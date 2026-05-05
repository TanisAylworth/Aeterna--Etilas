function reroll_all() {
    var cc = global.char_creation;

    // return assigned values to pool
    var attrs = global.ATTRIBUTES;

    for (var i = 0; i < array_length(attrs); i++) {
        var val = variable_struct_get(cc.assigned, attrs[i]);

        if (!is_undefined(val)) {
            array_push(cc.roll_pool, val);
            variable_struct_set(cc.assigned, attrs[i], undefined);
        }
    }

    cc.roll_pool = generate_roll_pool();
}