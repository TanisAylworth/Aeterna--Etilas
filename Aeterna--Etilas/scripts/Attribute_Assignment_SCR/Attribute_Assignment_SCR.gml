function assign_roll(cc, attr)
{
    if (!is_struct(cc)) return;
    if (cc.selected_roll_index < 0) return;
    if (!is_array(cc.roll_pool)) return;

    var idx = cc.selected_roll_index;
    if (idx >= array_length(cc.roll_pool)) return;

    var new_roll = cc.roll_pool[idx];
    if (!is_real(new_roll)) return;

    // SNAPSHOT FIRST (critical)
    push_history(cc);

    var old_roll = undefined;

    if (is_real(cc.assigned[$ attr]))
        old_roll = cc.assigned[$ attr];

    // assign
    cc.assigned[$ attr] = new_roll;

    // remove from pool
    array_delete(cc.roll_pool, idx, 1);

    // restore old roll if valid
    if (is_real(old_roll))
        array_push(cc.roll_pool, old_roll);

    sanitize_roll_pool(cc);

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}