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