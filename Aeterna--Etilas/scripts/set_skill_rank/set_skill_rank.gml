function set_skill_rank(cc, skill_name, rank)
{
    if (rank < 0)
    {
        if (variable_struct_exists(cc.skill_ranks, skill_name))
            variable_struct_remove(cc.skill_ranks, skill_name);
        return;
    }
    cc.skill_ranks[$ skill_name] = rank;
}