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