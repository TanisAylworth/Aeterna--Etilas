function refund_skill_rank(cc, skill_name)
{
    var rank = get_skill_rank(cc, skill_name);

    if (rank <= 0)
        return false;

    var cost = get_skill_slot_cost(cc, skill_name);

    cc.skill_ranks[$ skill_name] = rank - 1;

    if (rank - 1 <= 0)
        variable_struct_remove(cc.skill_ranks, skill_name);

    cc.skill_points_remaining += cost;

    return true;
}