function get_skill_slot_cost(cc, skill_name)
{
    var skill = global.skill_data[$ skill_name];

    if (character_has_table(cc, skill.table))
        return 1;

    return 2;
}