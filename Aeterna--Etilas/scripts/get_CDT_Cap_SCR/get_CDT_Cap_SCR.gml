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

    return base_cdt + toughness;
}