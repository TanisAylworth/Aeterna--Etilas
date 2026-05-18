function get_final_attribute(cc, attr)
{
    var base = variable_struct_exists(cc, "assigned")
        && variable_struct_exists(cc.assigned, attr)
        ? cc.assigned[$ attr]
        : 0;

    var species_bonus = 0;

    if (!is_undefined(cc.locked_species)
    && variable_struct_exists(global.species_data, cc.locked_species))
    {
        var sp = global.species_data[$ cc.locked_species];

        if (variable_struct_exists(sp, "stats")
        && variable_struct_exists(sp.stats, "attributes"))
        {
            var attrs = sp.stats.attributes;

            if (variable_struct_exists(attrs, attr))
                species_bonus = attrs[$ attr];
        }
    }

    var choice_bonus =
        variable_struct_exists(cc, "species_bonus_map")
        && variable_struct_exists(cc.species_bonus_map, attr)
        ? 1
        : 0;

    return base + species_bonus + choice_bonus;
}