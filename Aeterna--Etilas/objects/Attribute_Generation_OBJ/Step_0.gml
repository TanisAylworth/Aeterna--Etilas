var cc = global.char_creation;

// =====================
// ===== KEYBOARD ======
// =====================

if (keyboard_check_pressed(ord("R"))) {
    reroll_all();
}

if (keyboard_check_pressed(ord("Z"))) {
    undo_last();
}

// =====================
// ===== MOUSE =========
// =====================

if (mouse_check_button_pressed(mb_left)) {

    // IMPORTANT:
    // Must match Draw coordinate system
    var screen_w = camera_get_view_width(view_camera[0]);

    // ==================================================
    // ================= ROLL POOL =======================
    // ==================================================

    var roll_w = 60;
    var roll_h = 20;
    var roll_spacing = 10;

    var roll_count = array_length(cc.roll_pool);

    var total_roll_w =
        roll_count * roll_w +
        (roll_count - 1) * roll_spacing;

    var roll_start_x =
        (screen_w - total_roll_w) / 2;

    var roll_y = 80;

    for (var i = 0; i < roll_count; i++) {

        var x1 = roll_start_x + i * (roll_w + roll_spacing);
        var y1 = roll_y;

        var x2 = x1 + roll_w;
        var y2 = y1 + roll_h;

        if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {

            cc.selected_roll_index = i;
            break;
        }
    }

    // ==================================================
    // ================= ATTRIBUTES ======================
    // ==================================================

    var attr_w = 200;
    var attr_h = 20;

    var col_spacing = 80;
    var row_spacing = 90;

    var attr_count = array_length(global.ATTRIBUTES);

    var cols = 2;

    var total_w =
        cols * attr_w +
        (cols - 1) * col_spacing;

    var start_x =
        (screen_w - total_w) / 2;

    var attr_y = 220;

    for (var i = 0; i < attr_count; i++) {

        var col = i mod cols;
        var row = floor(i / cols);

        var x1 =
            start_x + col * (attr_w + col_spacing);

        var y1 =
            attr_y + row * row_spacing;

        var x2 = x1 + attr_w;
        var y2 = y1 + attr_h;

        if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {

            var attr = global.ATTRIBUTES[i];

            var current =
                variable_struct_get(cc.assigned, attr);

            // deselect
            if (!is_undefined(current)) {

                variable_struct_set(
                    cc.assigned,
                    attr,
                    undefined
                );

                array_push(cc.roll_pool, current);

                cc.selected_roll_index = -1;

            } else {

                // assign
                assign_roll(attr);
            }

            break;
        }
    }
}