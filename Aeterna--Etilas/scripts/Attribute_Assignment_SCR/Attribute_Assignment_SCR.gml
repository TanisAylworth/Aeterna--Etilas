function assign_roll(attr_name) {

    var cc = global.char_creation;

    if (cc.selected_roll_index == -1) return;

    var roll = cc.roll_pool[cc.selected_roll_index];

    // store previous value for undo
    var old_value = variable_struct_get(cc.assigned, attr_name);

    if (!is_undefined(old_value)) {

        // return old value back into pool
        array_push(cc.roll_pool, old_value);
    }

    // assign new value
    variable_struct_set(cc.assigned, attr_name, roll);

    // remove used roll
    array_delete(cc.roll_pool, cc.selected_roll_index, 1);

    cc.selected_roll_index = -1;

    // optional: history stack for full undo system
    array_push(cc.history, {
        type: "assign",
        attr: attr_name,
        value: roll,
        previous: old_value
    });
}

