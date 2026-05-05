function undo_last() {

    var cc = global.char_creation;

    if (array_length(cc.history) == 0) return;

    var last = array_pop(cc.history);

    if (last.type == "assign") {

        // restore attribute
        variable_struct_set(cc.assigned, last.attr, last.previous);

        // return roll back to pool
        array_push(cc.roll_pool, last.value);
    }
}