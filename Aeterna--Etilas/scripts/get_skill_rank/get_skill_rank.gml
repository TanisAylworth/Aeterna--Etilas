function get_skill_rank(cc, skill_name)
{
    if (variable_struct_exists(cc.skill_ranks, skill_name))
        return cc.skill_ranks[$ skill_name];

    return 0;
}