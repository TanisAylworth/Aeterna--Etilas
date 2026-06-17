function get_skill_check_nodes(skill)
{
    // New format
    if (variable_struct_exists(skill.check, "attributes"))
    {
        return skill.check.attributes;
    }

    // Old format
    return
    [
        {
            attribute : skill.check.attribute,
            modifier : skill.check.modifier
        }
    ];
}