var roll_x = 50;
var roll_y = 80;

var attr_x = 250;
var attr_y = 80;

var row_height = 30;

var cc = global.char_creation;

// ===== ROLLS =====
draw_text(roll_x, roll_y - 30, "ROLLS:");

for (var i = 0; i < array_length(cc.roll_pool); i++) {

    var x1 = roll_x;
    var y1 = roll_y + i * row_height;
    var x2 = roll_x + 60;
    var y2 = y1 + 20;

    // highlight
    if (cc.selected_roll_index == i) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

    draw_rectangle(x1, y1, x2, y2, false);

    draw_set_color(c_black);
    draw_text(x1 + 5, y1 + 2, string(cc.roll_pool[i]));
}

// ===== ATTRIBUTES =====
draw_text(attr_x, attr_y - 30, "ATTRIBUTES:");

for (var i = 0; i < array_length(global.ATTRIBUTES); i++) {

    var attr = global.ATTRIBUTES[i];
    var val = variable_struct_get(cc.assigned, attr);

    var x1 = attr_x;
    var y1 = attr_y + i * row_height;
    var x2 = attr_x + 180;
    var y2 = y1 + 20;

    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, false);

    var text_val = is_undefined(val) ? "-" : string(val);

    draw_set_color(c_black);
    draw_text(x1 + 5, y1 + 2, attr + ": " + text_val);
}





