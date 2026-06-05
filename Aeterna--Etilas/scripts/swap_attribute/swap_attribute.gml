function swap_roll_with_attribute(cc, attr)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.roll_pool)) return;
    if (cc.selected_roll_index < 0) return;

    if (!variable_struct_exists(cc.assigned, attr)) return;

    var idx = cc.selected_roll_index;
    if (idx < 0 || idx >= array_length(cc.roll_pool)) return;

    var new_roll = cc.roll_pool[idx];
    var old_roll = safe_get_assigned(cc, attr);

    if (is_undefined(old_roll)) return;

    // ==========================================
    // NEW METHOD: SNAPSHOT FIRST
    // ==========================================
    push_history(cc);

    // ==========================================
    // MUTATION
    // ==========================================
    cc.assigned[$ attr] = new_roll;

    array_delete(cc.roll_pool, idx, 1);
    array_push(cc.roll_pool, old_roll);

    sanitize_roll_pool(cc);

    // ==========================================
    // RESET SELECTION
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}