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