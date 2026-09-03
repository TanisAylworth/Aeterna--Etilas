function attribute_step_update(cc)
{
    if (!is_struct(cc)) return;
	if (briefing_update(global.char_creation))
    exit;
	if (variable_struct_exists(cc, "briefing_open") && cc.briefing_open)
	    return;
	
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
	var back_x = 40;
	var back_y = screen_h - 100;
    // Layout (same as Draw)
    var L = get_attribute_layout();
    var bonus_x = L.right_x + 120;
    var bonus_y = L.top_y;
	var back_w = 160;
	var back_h = 60;
    var left  = mouse_check_button_pressed(mb_left);
    var right = mouse_check_button_pressed(mb_right);

    var click_used = false;

    // ==========================================
    // HOTKEYS (ONLY CALL SAFE ENTRY POINTS)
    // ==========================================
    if (keyboard_check_pressed(ord("R")))
        reroll_all();

    if (keyboard_check_pressed(ord("Z")))
    {
        undo_last(cc);

        cc.selected_roll_index = -1;
        cc.selected_roll_value = undefined;
    }

    if (keyboard_check_pressed(ord("A")))
        auto_assign_attributes(cc);

    var screen_w = display_get_gui_width();

    // ==========================================
    // CONFIG
    // ==========================================
    var roll_w = 70;
	var roll_h = 36;
	var roll_spacing = 12;

	var roll_count = array_length(cc.roll_pool);
	var attr_count = array_length(global.ATTRIBUTES);

	// Fixed layout — same as Draw (does not move as pool empties)
	var full_count = array_length(cc.base_pool);
	if (full_count <= 0)
	    full_count = array_length(global.ATTRIBUTES);

	var roll_total_w = full_count * roll_w + max(0, full_count - 1) * roll_spacing;
	var roll_start_x = (screen_w - roll_total_w) * 0.5;
	var roll_y = 80;

       // Toggle manual mode
    if (left && !click_used)
    {
        var man_w = 140;
        var man_h = 32;
        var man_x = roll_start_x + roll_total_w + 20;
        var man_y = roll_y;

        if (point_in_rectangle(mx, my, man_x, man_y, man_x + man_w, man_y + man_h))
        {
            if (cc.manual_roll_mode)
            {
                // Finish editing any open box
                if (cc.editing_roll_index != -1)
                {
                    var num = real(cc.editing_roll_string);
                    if (is_real(num))
                        cc.roll_pool[cc.editing_roll_index] = clamp(floor(num), 1, 20); // safety range
                    cc.editing_roll_index = -1;
                    cc.editing_roll_string = "";
                }
                cc.manual_roll_mode = false;
            }
            else
            {
                cc.manual_roll_mode = true;
            }
            click_used = true;
        }
    }

    // Click a roll box while in manual mode → start editing
    if (cc.manual_roll_mode && left && !click_used)
    {
        for (var i = 0; i < roll_count; i++)
        {
            var x1 = roll_start_x + i * (roll_w + roll_spacing);
            var y1 = roll_y;
            if (point_in_rectangle(mx, my, x1, y1, x1 + roll_w, y1 + roll_h))
            {
                // Save previous edit if any
                if (cc.editing_roll_index != -1)
                {
                    var num = real(cc.editing_roll_string);
                    if (is_real(num))
                        cc.roll_pool[cc.editing_roll_index] = clamp(floor(num), 1, 20);
                }
                cc.editing_roll_index = i;
                cc.editing_roll_string = string(cc.roll_pool[i]);
                keyboard_string = cc.editing_roll_string;
                click_used = true;
                break;
            }
        }
    }

    // Typing while editing
    if (cc.manual_roll_mode && cc.editing_roll_index != -1)
    {
        cc.editing_roll_string = keyboard_string;

        // Confirm with Enter
        if (keyboard_check_pressed(vk_enter))
        {
            var num = real(cc.editing_roll_string);
            if (is_real(num))
                cc.roll_pool[cc.editing_roll_index] = clamp(floor(num), 1, 20);
            cc.editing_roll_index = -1;
            cc.editing_roll_string = "";
            keyboard_string = "";
        }
    }

    // ==========================================
    // SELECT ROLL
    // ==========================================
    if (left && !click_used)
    {
        for (var i = 0; i < roll_count; i++)
        {
            var x1 = roll_start_x + i * (roll_w + roll_spacing);
            var y1 = roll_y;

            if (point_in_rectangle(mx, my, x1, y1, x1 + roll_w, y1 + roll_h))
            {
                cc.selected_roll_index = i;
                cc.selected_roll_value = cc.roll_pool[i];

                click_used = true;
                break;
            }
        }
    }

    // ==========================================
    // SELECTION SAFETY
    // ==========================================
    if (cc.selected_roll_index < 0 ||
        cc.selected_roll_index >= array_length(cc.roll_pool))
    {
        cc.selected_roll_index = -1;
        cc.selected_roll_value = undefined;
    }

    // ==========================================
    // RIGHT CLICK REMOVE (SNAPSHOT FIRST)
    // ==========================================
    if (right && !click_used)
    {
        for (var i = 0; i < attr_count; i++)
{
    var attr = global.ATTRIBUTES[i];
    var r = get_attribute_rect(i);

    if (!point_in_rectangle(
        mx, my,
        r.x, r.y,
        r.x + r.w,
        r.y + r.h))
    {
        continue;
    }

    if (!variable_struct_exists(cc.assigned, attr))
        continue;

    push_history(cc);

    var old_roll = cc.assigned[$ attr];

    variable_struct_remove(cc.assigned, attr);

    if (is_real(old_roll))
        array_push(cc.roll_pool, old_roll);

    sanitize_roll_pool(cc);

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;

    click_used = true;
    break;
}
    }

    // ==========================================
    // LEFT CLICK ASSIGN / SWAP
    // ==========================================
    if (left && !click_used)
    {
        for (var i = 0; i < attr_count; i++)
{
    var attr = global.ATTRIBUTES[i];
    var r = get_attribute_rect(i);

    if (!point_in_rectangle(
        mx, my,
        r.x, r.y,
        r.x + r.w,
        r.y + r.h))
    {
        continue;
    }

    if (!variable_struct_exists(cc.assigned, attr))
    {
        assign_roll(cc, attr);
    }
    else
    {
        swap_roll_with_attribute(cc, attr);
    }

    click_used = true;
    break;
}
    }
	
    // ==========================================
    // SPECIES BONUS SELECTION (matches new panel)
    // ==========================================
        // ==========================================
    // SPECIES BONUS SELECTION (matches new spacing)
    // ==========================================
    if (left && !click_used)
    {
        var panel_x = bonus_x;
        var panel_y = bonus_y;
        var panel_w = 240;
        var row_h = 28;
        var row_spacing = 6;

        for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
        {
            var attr = global.ATTRIBUTES[i];
            var yy = panel_y + 70 + i * (row_h + row_spacing);

            if (point_in_rectangle(mx, my, panel_x + 10, yy, panel_x + panel_w - 10, yy + row_h))
            {
                if (variable_struct_exists(cc.species_bonus_map, attr))
                {
                    variable_struct_remove(cc.species_bonus_map, attr);
                    cc.species_bonus_remaining++;
                    click_used = true;
                    break;
                }
                if (cc.species_bonus_remaining > 0)
                {
                    cc.species_bonus_map[$ attr] = true;
                    cc.species_bonus_remaining--;
                    click_used = true;
                    break;
                }
            }
        }
    
    

    // CONFIRM BUTTON
    if (global.char_creation.locked_species != undefined)
    {
        var screen_w = display_get_gui_width();
        var screen_h = display_get_gui_height();

        var btn_w = cc.confirm_btn.w;
        var btn_h = cc.confirm_btn.h;
        var btn_x = (screen_w - btn_w) * 0.5;
        var btn_y = screen_h - 100;
        cc.confirm_btn.x = btn_x;
        cc.confirm_btn.y = btn_y;

        var hover_btn = point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

        var ready = true;
        for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
        {
            if (!is_real(cc.assigned[$ global.ATTRIBUTES[i]]))
            {
                ready = false;
                break;
            }
        }
        if (array_length(cc.roll_pool) > 0) ready = false;
        if (cc.species_bonus_remaining > 0) ready = false;


        // CLICK DETECTION
        if (hover_btn && mouse_check_button_pressed(mb_left) && ready)
        {
            show_debug_message("Confirmed attributes for: " + string(cc.locked_species));
            go_to_next_step(cc);
        }
    }

}




if (mouse_check_button_pressed(mb_left))
{
    if (point_in_rectangle(
        mx,
        my,
        back_x,
        back_y,
        back_x + back_w,
        back_y + back_h))
    {
        if (array_length(cc.step_history) > 0)
        {
            go_back_step(cc);
            exit;
        }
    }
}

}        