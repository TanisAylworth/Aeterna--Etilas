function handle_attribute_assign(step) {

    var cc = global.char_creation;

    if (cc.selected_index == -1) return;

    var attr = global.ATTRIBUTES[cc.selected_index];

    var current = variable_struct_get(cc.assigned, attr);

    if (is_undefined(current)) {

        var roll = cc.temp_pool[cc.selected_index];

        variable_struct_set(cc.assigned, attr, roll);

        array_delete(cc.temp_pool, cc.selected_index, 1);

        cc.selected_index = -1;
    }
}