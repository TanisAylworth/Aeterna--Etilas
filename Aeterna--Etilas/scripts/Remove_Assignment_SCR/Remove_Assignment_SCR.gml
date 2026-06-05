function remove_assignment(cc, attr)
{
    if (!is_struct(cc)) return;
    if (!is_struct(cc.assigned)) return;
    if (!variable_struct_exists(cc.assigned, attr)) return;

    var roll = cc.assigned[$ attr];
    if (!is_real(roll)) return;

    // ==========================================
    // NEW METHOD: SNAPSHOT FIRST
    // ==========================================
    push_history(cc);

    show_debug_message("REMOVE CALLED: " + string(attr));
    show_debug_message("ROLL FOUND: " + string(roll));

    // ==========================================
    // MUTATION
    // ==========================================
    variable_struct_remove(cc.assigned, attr);

    if (is_array(cc.roll_pool))
        array_push(cc.roll_pool, roll);

    // ==========================================
    // CLEANUP
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}