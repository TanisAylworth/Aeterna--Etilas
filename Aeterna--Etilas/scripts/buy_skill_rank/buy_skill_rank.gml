function skill_buy_rank(cc, skill)
{
    if (cc.skill_points_remaining <= 0)
        return;

    var current = 0;

    if (variable_struct_exists(cc.skills, skill))
        current = cc.skills[$ skill];

    // Optional cap
    if (current >= 5)
        return;

    cc.skills[$ skill] = current + 1;
    cc.skill_points_remaining--;
}