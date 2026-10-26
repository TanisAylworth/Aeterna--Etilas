function species_random_select(cc)
{
    if (!is_struct(cc)) return;
    if (!variable_global_exists("species_list")) return;
    if (!is_array(global.species_list) || array_length(global.species_list) == 0)
        return;

    var idx = irandom(array_length(global.species_list) - 1);
    var species_id = global.species_list[idx];

    // Same state reset as a manual click
    cc.locked_species = species_id;
    cc.species_bonus_map = {};
    cc.species_bonus_remaining = 0;
	
    
var snd = audio_play_sound(scribble, 5, false);
audio_sound_pitch(snd, random_range(0.90, 1.10));
    if (variable_struct_exists(global.species_data, species_id))
    {
        var data = global.species_data[$ species_id];
        if (variable_struct_exists(data, "creation")
            && variable_struct_exists(data.creation, "attribute_adjustments"))
        {
            var adj = data.creation.attribute_adjustments;
            if (adj.type == "choice" && variable_struct_exists(adj, "count"))
                cc.species_bonus_remaining = adj.count;
            else if (variable_struct_exists(adj, "choices"))
                cc.species_bonus_remaining = adj.choices;
        }
    }

    // Optional: clear attribute init so bonuses reload if they already visited attributes
    if (variable_struct_exists(cc, "attribute_initialized"))
        cc.attribute_initialized = false;

    show_debug_message("Random species: " + species_id);
}


function tooltip_lookup_description(map_name, key)
{
    if (is_undefined(key) || key == "")
        return "No description available.";
    
    if (!variable_global_exists(map_name))
        return "No description available. (missing global." + map_name + ")";
    
    var map = variable_global_get(map_name);
    if (!is_struct(map))
        return "No description available.";
    
    var k = string(key);
    
    // Base name: everything before " ("
    var base = k;
    var paren = string_pos(" (", k);
    if (paren > 0)
        base = string_copy(k, 1, paren - 1);
    
    // Try keys in order
    var try_keys = [k, base, base + " (X)"];
    
    var entry = undefined;
    for (var i = 0; i < array_length(try_keys); i++)
    {
        var tk = try_keys[i];
        if (tk != "" && variable_struct_exists(map, tk))
        {
            entry = map[$ tk];
            break;
        }
        // optional lowercase fallback
        var low = string_lower(tk);
        if (low != tk && variable_struct_exists(map, low))
        {
            entry = map[$ low];
            break;
        }
    }
    
    if (is_undefined(entry))
        return "No description available.";
    
    if (is_string(entry))
        return entry;
    
    if (is_struct(entry))
    {
        if (variable_struct_exists(entry, "description"))
            return entry.description;
        if (variable_struct_exists(entry, "desc"))
            return entry.desc;
        if (variable_struct_exists(entry, "text"))
            return entry.text;
    }
    
    return "No description available.";
}


function character_reset_for_new_species(cc, new_species_id)
{
    var old = variable_struct_exists(cc, "locked_species") ? cc.locked_species : undefined;
    if (old == new_species_id) return; // same species, nothing to do

    cc.locked_species = new_species_id;
    cc.confirmed_species = new_species_id;
    cc.species = new_species_id;

    // --- Size cache ---
    cc.size = equipment_get_size_name(cc);

    // --- Attributes: force full re-init next time that step runs ---
    cc.attribute_initialized = false;
    cc.assigned = {};
    cc.species_bonus_map = {};
    cc.species_bonus_remaining = 0;
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
    cc.history = [];
    if (variable_struct_exists(cc, "roll_pool")) cc.roll_pool = [];
    if (variable_struct_exists(cc, "base_pool")) cc.base_pool = [];

    // --- Skills / talents bought in generation ---
    cc.skill_ranks = {};
    if (variable_struct_exists(cc, "talent_ranks")) cc.talent_ranks = {};
    if (variable_struct_exists(cc, "free_slot_skills")) cc.free_slot_skills = [];
    if (variable_struct_exists(cc, "free_slot_talents")) cc.free_slot_talents = [];

    // --- Generation / knowledge shop state ---
    if (variable_struct_exists(cc, "generation"))
    {
        // Rebuild from species creation block (fixed tables/skills/talents)
        generation_rebuild_from_species(cc);
    }
    else
    {
        generation_rebuild_from_species(cc);
    }

    // --- UI selection leftovers ---
    if (variable_struct_exists(cc, "selected_table")) cc.selected_table = "";
    if (variable_struct_exists(cc, "hovered_skill")) cc.hovered_skill = "";
    if (variable_struct_exists(cc, "pending_skill")) cc.pending_skill = "";
    if (variable_struct_exists(cc, "specialization_popup")) cc.specialization_popup = false;

    show_debug_message("SPECIES RESET → " + string(new_species_id)
        + " | size=" + string(cc.size));
}


function generation_rebuild_from_species(cc)
{
    if (!variable_struct_exists(cc, "generation") || !is_struct(cc.generation))
        cc.generation = {};

    cc.generation.fixed_tables = [];
    cc.generation.choice_tables = [];
    cc.generation.purchased_tables = [];
    cc.generation.tables_locked = false;

    // Default shop points if you use them
    if (!variable_struct_exists(cc.generation, "slots_remaining"))
        cc.generation_slots_remaining = variable_struct_exists(cc, "generation_slots_remaining")
            ? cc.generation_slots_remaining : 0;

    cc.skill_ranks = {};
    if (!variable_struct_exists(cc, "talent_ranks")) cc.talent_ranks = {};
    else cc.talent_ranks = {};
    cc.free_slot_skills = [];
    if (!variable_struct_exists(cc, "free_slot_talents")) cc.free_slot_talents = [];
    else cc.free_slot_talents = [];

    if (!variable_struct_exists(cc, "locked_species")) return;
    if (!variable_global_exists("species_data")) return;
    if (!variable_struct_exists(global.species_data, cc.locked_species)) return;

    var sp = global.species_data[$ cc.locked_species];
    if (!variable_struct_exists(sp, "creation")) return;
    var cre = sp.creation;

    // Fixed / choice tables
    if (variable_struct_exists(cre, "knowledge_tables"))
    {
        var kt = cre.knowledge_tables;
        if (variable_struct_exists(kt, "fixed") && is_array(kt.fixed))
            cc.generation.fixed_tables = array_copy_simple(kt.fixed);

        if (variable_struct_exists(kt, "choices") && is_struct(kt.choices))
        {
            // store choice count/options however your shop expects
            cc.generation.table_choices_remaining =
                variable_struct_exists(kt.choices, "count") ? kt.choices.count : 0;
            cc.generation.table_choice_options =
                variable_struct_exists(kt.choices, "options") ? kt.choices.options : [];
        }
    }

    // Fixed skills → ranks
    if (variable_struct_exists(cre, "knowledge_skills"))
    {
        var ks = cre.knowledge_skills;
        if (variable_struct_exists(ks, "fixed") && is_array(ks.fixed))
        {
            for (var i = 0; i < array_length(ks.fixed); i++)
            {
                var f = ks.fixed[i];
                if (is_struct(f) && variable_struct_exists(f, "name"))
                    set_skill_rank(cc, f.name, variable_struct_exists(f, "rank") ? f.rank : 1);
            }
        }
        // Free skill slot count lives on species data — keep a working copy on cc
        if (variable_struct_exists(ks, "choices") && is_struct(ks.choices)
            && variable_struct_exists(ks.choices, "count"))
        {
            cc.species_skill_choice_remaining = ks.choices.count;
            // IMPORTANT: do not permanently decrement the global species template
            // if you previously mutated species.creation.knowledge_skills.choices.count
        }
    }

    // Fixed talents
    if (variable_struct_exists(cre, "knowledge_talents"))
    {
        var kt2 = cre.knowledge_talents;
        if (variable_struct_exists(kt2, "fixed") && is_array(kt2.fixed))
        {
            for (var i = 0; i < array_length(kt2.fixed); i++)
            {
                var tname = kt2.fixed[i];
                if (is_string(tname) && tname != "None")
                    cc.talent_ranks[$ tname] = 0; // or 1 if "owned"
            }
        }
        if (variable_struct_exists(kt2, "choices") && is_struct(kt2.choices)
            && variable_struct_exists(kt2.choices, "count"))
            cc.species_talent_choice_remaining = kt2.choices.count;
    }

    show_debug_message("generation_rebuild_from_species done for " + string(cc.locked_species));
}