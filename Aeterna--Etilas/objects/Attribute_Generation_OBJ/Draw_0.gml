var cc = global.char_creation;

var screen_w = camera_get_view_width(view_camera[0]);

// =======================
// ===== ROLL POOL =======
// =======================

var roll_w = 60;
var roll_h = 20;
var roll_spacing = 10;

var roll_count = array_length(cc.roll_pool);

// total width of roll row
var total_roll_w = roll_count * roll_w + (roll_count - 1) * roll_spacing;

// starting X so it's centered
var roll_start_x = (screen_w - total_roll_w) / 2;
var roll_y = 80;

// centered title
draw_set_halign(fa_center);
draw_text(roll_start_x + total_roll_w / 2, roll_y - 30, "ROLL POOL");
draw_set_halign(fa_left);

// draw rolls horizontally
for (var i = 0; i < roll_count; i++) {

    var x1 = roll_start_x + i * (roll_w + roll_spacing);
    var y1 = roll_y;

    // highlight
    if (cc.selected_roll_index == i) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_ltgray);
    }

    draw_rectangle(x1, y1, x1 + roll_w, y1 + roll_h, false);

    draw_set_color(c_black);
    draw_text(x1 + 5, y1 + 2, string(cc.roll_pool[i]));
}




// =========================
// ===== ATTRIBUTES =========
// =========================

var attr_w = 200;
var attr_h = 20;

var col_spacing = 80;   // space between left/right columns
var row_spacing = 90;   // vertical space per attribute (IMPORTANT)

var attr_y = 220;

var attr_count = array_length(global.ATTRIBUTES);

// split into 2 columns
var cols = 2;
var rows = ceil(attr_count / cols);

// center the whole block
var total_w = cols * attr_w + (cols - 1) * col_spacing;
var start_x = (camera_get_view_width(view_camera[0]) - total_w) / 2;

// title
draw_set_halign(fa_center);
draw_text(start_x + total_w / 2, attr_y - 50, "ATTRIBUTES");
draw_set_halign(fa_left);

// loop
for (var i = 0; i < attr_count; i++) {

    var attr = global.ATTRIBUTES[i];
    var raw_val = variable_struct_get(cc.assigned, attr);
    var val = is_undefined(raw_val) ? 0 : raw_val;

    // column + row
    var col = i mod cols;
    var row = floor(i / cols);

    var x1 = start_x + col * (attr_w + col_spacing);
    var y1 = attr_y + row * row_spacing;

    // box
    draw_set_color(c_ltgray);
    draw_rectangle(x1, y1, x1 + attr_w, y1 + attr_h, false);

    draw_set_color(c_black);

    // main stat
    var text_val = is_undefined(raw_val) ? "-" : string(raw_val);
    draw_text(x1 + 5, y1 + 2, attr + ": " + text_val);

    // details
    var details = [];

    if (variable_struct_exists(global.attribute_data, attr)) {
        details = global.attribute_data[$ attr](val);
    } else {
        details = ["No data"];
    }

    // draw details BELOW with spacing
    for (var j = 0; j < array_length(details); j++) {
        draw_text(x1 + 5, y1 + 25 + j * 14, details[j]);
    }
}


