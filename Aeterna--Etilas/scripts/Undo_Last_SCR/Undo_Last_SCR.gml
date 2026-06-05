function undo_last(cc)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.history)) return;
    if (array_length(cc.history) <= 0) return;

    var snap = array_pop(cc.history);

    // ==========================================
    // VALIDATE SNAPSHOT FORMAT
    // ==========================================
    if (!variable_struct_exists(snap, "assigned")
    ||  !variable_struct_exists(snap, "roll_pool"))
    {
        show_debug_message("UNDO SKIPPED: invalid history entry");
        return;
    }

    // ==========================================
    // RESTORE STATE (PURE)
    // ==========================================
    cc.assigned = {};

    var keys = variable_struct_get_names(snap.assigned);

    for (var i = 0; i < array_length(keys); i++)
    {
        var k = keys[i];

        if (variable_struct_exists(snap.assigned, k))
            cc.assigned[$ k] = snap.assigned[$ k];
    }

    cc.roll_pool = array_copy_simple(snap.roll_pool);

    // ==========================================
    // IMPORTANT: DO NOT SANITIZE HERE
    // ==========================================
    // undo must restore EXACT snapshot state

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}