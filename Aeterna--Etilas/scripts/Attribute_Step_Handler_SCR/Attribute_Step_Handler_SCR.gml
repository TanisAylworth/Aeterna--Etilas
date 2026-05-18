function attribute_step_update(cc)
{
    if (keyboard_check_pressed(ord("R"))) reroll_all();
    if (keyboard_check_pressed(ord("Z"))) undo_last();

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var screen_w = display_get_gui_width();

    // -------------------------
    // LAYOUT
    // -------------------------
    var attr_w = 200;
    var col_spacing = 80;
    var cols = 2;

    var attr_count = array_length(global.ATTRIBUTES);

    var total_attr_w = cols * attr_w + (cols - 1) * col_spacing;
    var attr_start_x = (screen_w - total_attr_w) / 2;
    var attr_y = 220;

    var bonus_x = attr_start_x + total_attr_w + 120;
    var bonus_y = attr_y;

    // =====================================================
    // ROLL POOL
    // =====================================================
    var roll_count = array_length(cc.roll_pool);

    var roll_w = 60;
    var roll_h = 20;
    var roll_spacing = 10;

    var total_w = roll_count * roll_w + (roll_count - 1) * roll_spacing;
    var start_x = (screen_w - total_w) / 2;
    var roll_y = 80;

    for (var i = 0; i < roll_count; i++)
    {
        var x1 = start_x + i * (roll_w + roll_spacing);
        var y1 = roll_y;
        var x2 = x1 + roll_w;
        var y2 = y1 + roll_h;

        if (point_in_rectangle(mx, my, x1, y1, x2, y2))
        {
            if (mouse_check_button_pressed(mb_left))
                cc.selected_roll_index = i;
        }
    }

    // =====================================================
    // ATTRIBUTE ASSIGN / REMOVE (FIXED LOGIC)
    // =====================================================
    if (mouse_check_button_pressed(mb_left))
    {
        for (var i = 0; i < attr_count; i++)
        {
            var attr = global.ATTRIBUTES[i];

            var col = i mod cols;
            var row = floor(i / cols);

            var x1 = attr_start_x + col * (attr_w + col_spacing);
            var y1 = attr_y + row * 90;
            var x2 = x1 + attr_w;
            var y2 = y1 + 20;

            if (!point_in_rectangle(mx, my, x1, y1, x2, y2))
                continue;

            var assigned = !is_undefined(cc.assigned[$ attr]);

            // -------------------------
// REMOVE
// -------------------------
if (assigned)
{
    var current = cc.assigned[$ attr];

    variable_struct_remove(cc.assigned, attr);

    array_insert(cc.roll_pool, 0, current);

    cc.selected_roll_index = -1;
}
            // -------------------------
            // ASSIGN
            // -------------------------
            else
            {
                if (cc.selected_roll_index == -1)
                    break;

                assign_roll(attr);
            }

            break;
        }
    }

    // =====================================================
    // SPECIES BONUS (SIMPLIFIED BUT SAFE)
    // =====================================================
    if (mouse_check_button_pressed(mb_left))
    {
        var sp = cc.locked_species;

        if (variable_struct_exists(global.species_data, sp))
        {
            var keys = global.ATTRIBUTES;

            for (var i = 0; i < array_length(keys); i++)
            {
                var attr = keys[i];
                var yy = bonus_y + 30 + i * 20;

                if (!point_in_rectangle(mx, my, bonus_x, yy, bonus_x + 200, yy + 18))
                    continue;

                var selected = variable_struct_exists(cc.species_bonus_map, attr);

                if (selected)
                {
                    variable_struct_remove(cc.species_bonus_map, attr);
                    cc.species_bonus_remaining += 1;
                }
                else if (cc.species_bonus_remaining > 0)
                {
                    variable_struct_set(cc.species_bonus_map, attr, 1);
                    cc.species_bonus_remaining -= 1;
                }

                break;
            }
        }
    }
	
	
	// =====================================================
// CONFIRM BUTTON
// =====================================================

if (mouse_check_button_pressed(mb_left))
{
    var btn_w = 220;
    var btn_h = 40;

    var btn_x = screen_w * 0.5 - btn_w * 0.5;
    var btn_y = display_get_gui_height() - 80;

    if (point_in_rectangle(
        mx, my,
        btn_x, btn_y,
        btn_x + btn_w,
        btn_y + btn_h
    ))
    {
        var ready = true;

        // all attributes assigned
        for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
        {
            var attr = global.ATTRIBUTES[i];

            if (is_undefined(cc.assigned[$ attr]))
            {
                ready = false;
                break;
            }
        }

        // roll pool empty
        if (array_length(cc.roll_pool) > 0)
            ready = false;

        // optional species bonus check
        if (cc.species_bonus_remaining > 0)
            ready = false;

        if (ready)
        {
            global.char_creation_step += 1;

            show_debug_message(
                "ATTRIBUTE STEP CONFIRMED"
            );
        }
    }
}
	
	
}