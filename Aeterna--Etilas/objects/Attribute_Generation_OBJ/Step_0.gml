var cc = global.char_creation;

var roll_x = 50;
var roll_y = 80;
var attr_x = 250;
var attr_y = 80;
var row_height = 30;

// keyboard
if (keyboard_check_pressed(ord("R"))) {
    reroll_all();
}

// mouse
if (mouse_check_button_pressed(mb_left)) {

    // rolls
    for (var i = 0; i < array_length(cc.roll_pool); i++) {

        var x1 = roll_x;
        var y1 = roll_y + i * row_height;
        var x2 = roll_x + 60;
        var y2 = y1 + 20;

        if (mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2) {
            cc.selected_roll_index = i;
            break;
        }
    }

    // attributes
    for (var i = 0; i < array_length(global.ATTRIBUTES); i++) {

        var attr = global.ATTRIBUTES[i];

        var x1 = attr_x;
        var y1 = attr_y + i * row_height;
        var x2 = attr_x + 180;
        var y2 = y1 + 20;

        if (mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2) {
            var current = variable_struct_get(cc.assigned, attr);

if (!is_undefined(current)) {

    // deselect (remove assignment)
    variable_struct_set(cc.assigned, attr, undefined);

    // return value to pool
    array_push(cc.roll_pool, current);

    // clear selected roll so it doesn't auto-cascade
    cc.selected_roll_index = -1;

} else {

    // normal assign
    assign_roll(attr);
}
            break;
        }
    }
}


if (keyboard_check_pressed(ord("Z"))) {
    undo_last();
}

