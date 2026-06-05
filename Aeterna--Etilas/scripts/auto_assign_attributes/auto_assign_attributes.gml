function auto_assign_attributes(cc)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.roll_pool)) return;

    // ==========================================
    // SNAPSHOT (NEW SYSTEM RULE)
    // ==========================================
    push_history(cc);

    // ==========================================
    // BUILD UNASSIGNED LIST
    // ==========================================
    var unassigned = [];

    for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
    {
        var attr = global.ATTRIBUTES[i];

        if (!variable_struct_exists(cc.assigned, attr))
            array_push(unassigned, attr);
    }

    // ==========================================
    // RANDOM ASSIGNMENT
    // ==========================================
    while (array_length(unassigned) > 0
    && array_length(cc.roll_pool) > 0)
    {
        var attr_index = irandom(array_length(unassigned) - 1);
        var roll_index = irandom(array_length(cc.roll_pool) - 1);

        var attr = unassigned[attr_index];
        var roll = cc.roll_pool[roll_index];

        cc.assigned[$ attr] = roll;
        array_delete(cc.roll_pool, roll_index, 1);

        array_delete(unassigned, attr_index, 1);
    }

    // ==========================================
    // CLEANUP
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}