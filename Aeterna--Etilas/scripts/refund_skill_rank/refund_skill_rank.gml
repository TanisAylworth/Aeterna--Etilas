function skill_sell_rank(cc, skill)
{
    if (!variable_struct_exists(cc.skills, skill))
        return;

    var current = cc.skills[$ skill];

    if (current <= 0)
        return;

    cc.skills[$ skill] = current - 1;
    cc.skill_points_remaining++;

    if (cc.skills[$ skill] <= 0)
        variable_struct_remove(cc.skills, skill);
}