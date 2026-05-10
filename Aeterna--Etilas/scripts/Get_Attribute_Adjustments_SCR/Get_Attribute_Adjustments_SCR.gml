function get_attribute_adjustments(species)
{
    var result = {};

    if (variable_struct_exists(species, "attributes")) {
        result.fixed = species.attributes;
    }

    if (variable_struct_exists(species, "flex_attributes")) {
        result.flex = species.flex_attributes;
    }

    return result;
}