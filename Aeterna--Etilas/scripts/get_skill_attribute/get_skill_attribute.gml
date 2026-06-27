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