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