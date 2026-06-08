function buy_skill_rank(cc, skill_name)
{
    var cost = get_skill_slot_cost(cc, skill_name);

    if (cc.skill_points_remaining < cost)
        return false;

    var rank = get_skill_rank(cc, skill_name);

    cc.skill_ranks[$ skill_name] = rank + 1;

    cc.skill_points_remaining -= cost;

    return true;
}