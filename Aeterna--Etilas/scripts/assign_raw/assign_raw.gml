function assign_roll_raw(cc, attr, roll_index)
{
    if (!is_struct(cc)) return undefined;
    if (!is_array(cc.roll_pool)) return undefined;

    var len = array_length(cc.roll_pool);
    if (roll_index < 0 || roll_index >= len) return undefined;

    var roll = cc.roll_pool[roll_index];

    if (!is_struct(cc.assigned))
        cc.assigned = {};

    var old = undefined;

    if (is_real(cc.assigned[$ attr]))
        old = cc.assigned[$ attr];

    // REMOVE from pool ONLY (no snapshot logic here)
    array_delete(cc.roll_pool, roll_index, 1);

    return old;
}