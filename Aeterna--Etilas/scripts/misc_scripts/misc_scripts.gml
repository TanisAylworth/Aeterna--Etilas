function skill_buy_rank(cc, skill)
{
    if (cc.skill_points_remaining <= 0)
        return;

    var current = 0;

    if (variable_struct_exists(cc.skills, skill))
        current = cc.skills[$ skill];

    // Optional cap
    if (current >= 5)
        return;

    cc.skills[$ skill] = current + 1;
    cc.skill_points_remaining--;
}






function get_all_knowledge_tables()
{
    return  [
		"General",
        "Professional",
        "Laborer",
        "Clerical",
        "Roguery",
        "Warfare",
        "Arcane",
        "Occult",
        "Survival"
    ];
}


function get_toughness_cdt_bonus(cc)
{
    var val = get_final_attribute(cc, "Toughness");

    var cdt;

    if (val >= 10)
    {
        cdt = floor((val - 10) / 2);
    }
    else
    {
        cdt = ceil((val - 10) / 2);
    }

    if (val <= 0)
    {
        cdt = 0;
    }

    return cdt;
}


function get_cdt_cap(cc)
{
    var sp = cc.locked_species;

    if (!variable_struct_exists(global.species_data, sp))
        return 0;

    var species = global.species_data[$ sp];

    var base_cdt = 0;

    if (variable_struct_exists(species, "stats")
    && variable_struct_exists(species.stats, "cdt"))
    {
        base_cdt = species.stats.cdt;
    }
    else
    {
        show_debug_message("WARNING: Missing stats.cdt for species: " + string(sp));
    }

    var toughness = get_final_attribute(cc, "Toughness");
	
	var toughness_bonus = toughness

    return base_cdt + toughness;
}


function get_creation_slots(cc)
{
    var total = 20;

    var intelligence =
        get_final_attribute(cc, "Intelligence");

    total += max(0, floor((intelligence - 10) / 2));

    return total;
}





function get_size_category(cc)
{
    if (!variable_struct_exists(cc, "locked_species") || is_undefined(cc.locked_species))
        return SIZE_CATEGORY.Medium;

    var traits = global.species_data[$ cc.locked_species].stats.traits;

    if (array_contains(traits, "tiny"))  return SIZE_CATEGORY.Tiny;
    if (array_contains(traits, "small")) return SIZE_CATEGORY.Small;
    if (array_contains(traits, "large")) return SIZE_CATEGORY.Large;
    if (array_contains(traits, "huge"))  return SIZE_CATEGORY.Huge;

    return SIZE_CATEGORY.Medium;
}



function get_skill_attribute(cc, skill_name)
{
    var skill =
        global.skill_data[$ skill_name];

    var size =
        get_size_category(cc);

    if (
        variable_struct_exists(skill, "size_override")
        &&
        variable_struct_exists(
            skill.size_override,
            size
        )
    )
    {
        return skill.size_override[$ size];
    }

    return skill.attribute;
}


function get_skill_check_nodes(skill, cc)
{
    var nodes = [];
   
    if (!variable_struct_exists(skill, "check"))
        return nodes;
      
    var check = skill.check;
   
    if (!variable_struct_exists(check, "mode"))
        return nodes;
   
    switch (check.mode)
    {
        case "best":
			if (variable_struct_exists(check, "attributes") && is_array(check.attributes))
                nodes = check.attributes;
            break;
        case "all":
            if (variable_struct_exists(check, "attributes") && is_array(check.attributes))
                nodes = check.attributes;
            break;
          
                case "size":
            if (variable_struct_exists(check, "size_attributes"))
            {
                var sizes = variable_struct_get_names(check.size_attributes);
                show_debug_message("Size keys found: " + json_stringify(sizes));
                for (var i = 0; i < array_length(sizes); i++)
                {
                    var size_key = sizes[i];
                    var data = check.size_attributes[$ size_key];
                    if (is_struct(data))
                        array_push(nodes, data);
                }
            }
            break;
            break;
          
        default:
            if (variable_struct_exists(check, "attribute"))
            {
                array_push(nodes, { attribute: check.attribute, modifier: 0 });
            }
            break;
    }
   
    return nodes;
}


function get_skill_check_result(cc, skill)
{
    var result = {
    total: 0,
    attribute: "None",
    modifier: 0,
    is_best: false,
    can_attempt: true
};
    
    if (!variable_struct_exists(skill, "check"))
        return result;
        
    var check = skill.check;
    var char_size = get_character_size(cc);
	
	var trained = variable_struct_exists(cc.skill_ranks, skill.name);

	if (!trained && skill.difficulty == SKILL_DIFFICULTY.ADVANCED)
	{
	    result.can_attempt = false;
	    return result;
	}

    switch (check.mode)
    {
        case "best":
            var nodes = get_skill_check_nodes(skill, cc);
            var best_value = -999;
            var best_attr = "None";
            var best_mod = 0;
            
            for (var i = 0; i < array_length(nodes); i++)
            {
                var node = nodes[i];
                var attr = node.attribute;
                var _mod = variable_struct_exists(node, "modifier") ? node.modifier : 0;
                var value = get_final_attribute(cc, attr) + _mod;
                
                if (value > best_value)
                {
                    best_value = value;
                    best_attr = attr;
                    best_mod = _mod;
                }
            }
            
            result.total = best_value;   // Do NOT add rank here
            result.attribute = best_attr;
            result.modifier = best_mod;
            result.is_best = true;
            break;

        case "all":
            var total = 0;
            var nodes = get_skill_check_nodes(skill, cc);
            
            for (var i = 0; i < array_length(nodes); i++)
            {
                var node = nodes[i];
                var attr = node.attribute;
                var _mod = variable_struct_exists(node, "modifier") ? node.modifier : 0;
                total += get_final_attribute(cc, attr) + _mod;
            }
            
            result.total = total;   // Do NOT add rank here
            result.attribute = "Multiple";
            result.modifier = 0;
            break;

        case "size":
        case "size_dependent":
            if (variable_struct_exists(check, "size_attributes"))
            {
                var size_data = check.size_attributes[$ char_size];
                if (is_struct(size_data))
                {
                    result.attribute = size_data.attribute;
                    result.modifier = variable_struct_exists(size_data, "modifier") ? size_data.modifier : 0;
                    result.total = get_final_attribute(cc, result.attribute) + result.modifier;
                }
            }
            break;

        default:
            if (variable_struct_exists(check, "attribute"))
            {
                result.attribute = check.attribute;
                result.modifier = 0;
                result.total = get_final_attribute(cc, result.attribute);
            }
            break;
    }
    
    return result;
}


function get_skill_rank(cc, skill_name)
{
    if (variable_struct_exists(cc.skill_ranks, skill_name))
        return cc.skill_ranks[$ skill_name];

    return 0;
}



function get_available_tables(cc)
{
    var sp = cc.locked_species;

    if (is_undefined(sp)
    || !variable_struct_exists(global.species_data, sp))
        return [];

    var species = global.species_data[$ sp];

    if (variable_struct_exists(species.creation, "knowledge_tables"))
        return species.creation.knowledge_tables.options;

    return [];
}



function go_to_next_step(cc)
{
    var from_id = (cc.step_index >= 0 && cc.step_index < array_length(cc.steps))
        ? cc.steps[cc.step_index].id
        : "none";
    
    cc.step_index++;
    
    if (cc.step_index >= array_length(cc.steps))
        cc.step_index = array_length(cc.steps) - 1;
    
    var to_id = cc.steps[cc.step_index].id;
    show_debug_message("STEP " + from_id + " -> " + to_id + " (index " + string(cc.step_index) + ")");
    
    briefing_on_enter_step(cc);
}


function character_has_table(cc, table_name)
{
    return array_contains(cc.knowledge_tables, table_name);
}

function skill_sell_rank(cc, skill)
{
    if (!variable_struct_exists(cc.skills, skill))
        return;

    var current = cc.skills[$ skill];

    if (current <= 0)
        return;

    cc.skills[$ skill] = current - 1;
    cc.skill_points_remaining++;

    if (cc.skills[$ skill] <= 0)
        variable_struct_remove(cc.skills, skill);
}

function refund_table_skill_discount(cc, table_name)
{
    if (!variable_struct_exists(
        global.knowledge_table_data,
        table_name))
    {
        return;
    }

    var table =
        global.knowledge_table_data[$ table_name];

    var refund = 0;

    for (var i = 0; i < array_length(table.skills); i++)
    {
        var skill_name = table.skills[i];

        var rank =
            get_skill_rank(
                cc,
                skill_name
            );

        refund += rank;
    }

    cc.generation_slots_remaining += refund;
}



function refund_table_skills(cc, table_name)
{
    if (!variable_struct_exists(
        global.knowledge_table_data,
        table_name))
    {
        return;
    }

    var table =
        global.knowledge_table_data[$ table_name];

    for (var i = 0; i < array_length(table.skills); i++)
    {
        var skill_name = table.skills[i];

        var rank =
            get_skill_rank(
                cc,
                skill_name
            );

        if (rank > 0)
        {
            cc.generation_slots_remaining += rank;

            set_skill_rank(
                cc,
                skill_name,
                0
            );
        }
    }
}



function set_skill_rank(cc, skill_name, rank)
{
    if (rank < 0)
    {
        if (variable_struct_exists(cc.skill_ranks, skill_name))
            variable_struct_remove(cc.skill_ranks, skill_name);
        return;
    }
    cc.skill_ranks[$ skill_name] = rank;
}


function get_skill_slot_cost(cc, skill_name)
{
    var skill = global.skill_data[$ skill_name];

    if (character_has_table(cc, skill.table))
        return 1;

    return 2;
}


function skill_constants_init()
{
    global.SKILL_SIMPLE  = 0;
    global.SKILL_INTERMEDIATE = 1;
    global.SKILL_ADVANCED    = 2;
}


function skill_difficulty_name(diff)
{
    switch(diff)
    {
        case global.SKILL_SIMPLE:  return "Simple";
        case global.SKILL_INTERMEDIATE: return "Intermediate";
        case global.SKILL_ADVANCED:    return "Advanced";
    }

    return "Unknown";
}