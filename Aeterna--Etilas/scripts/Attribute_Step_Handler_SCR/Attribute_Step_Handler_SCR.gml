function attribute_step_update(cc)
{
    if (!is_struct(cc)) return;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

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
    var roll_w = 60;
    var roll_h = 20;
    var roll_spacing = 10;

   

    var roll_count = array_length(cc.roll_pool);
    var attr_count = array_length(global.ATTRIBUTES);

    var roll_total_w = roll_count * roll_w + max(0, roll_count - 1) * roll_spacing;
    var roll_start_x = (screen_w - roll_total_w) * 0.5;
    var roll_y = 80;

   

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
// SPECIES BONUS SELECTION
// ==========================================
if (left && !click_used)
{
    

   var bonus_x = 1400;
var bonus_y = 220;

for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
{
    var attr = global.ATTRIBUTES[i];

    var yy = bonus_y + 50 + i * 20;

    if (point_in_rectangle(
        mx, my,
        bonus_x,
        yy,
        bonus_x + 180,
        yy + 18))
    {

        // remove bonus
        if (variable_struct_exists(cc.species_bonus_map, attr))
        {
            variable_struct_remove(
                cc.species_bonus_map,
                attr
            );

            cc.species_bonus_remaining++;

            click_used = true;
            break;
        }

        // add bonus
        if (cc.species_bonus_remaining > 0)
        {
            cc.species_bonus_map[$ attr] = true;

            cc.species_bonus_remaining--;

            click_used = true;
            break;
        }
    }
}
}

    // ==========================================
    // CONFIRM BUTTON (UNCHANGED LOGIC)
    // ==========================================
    var vw = display_get_gui_width();
    var vh = display_get_gui_height();

    cc.confirm_btn.x = (vw - cc.confirm_btn.w) * 0.5;
    cc.confirm_btn.y = vh - 100;

    var b = cc.confirm_btn;

    if (point_in_rectangle(mx, my, b.x, b.y, b.x + b.w, b.y + b.h))
    {
        if (left && !click_used)
        {
            var ready = true;

            for (var i = 0; i < attr_count; i++)
            {
                var attr = global.ATTRIBUTES[i];

                if (!variable_struct_exists(cc.assigned, attr))
                {
                    ready = false;
                    break;
                }
            }

            if (array_length(cc.roll_pool) > 0)
                ready = false;

            if (cc.species_bonus_remaining > 0)
                ready = false;

            if (ready)
                go_to_next_step(cc);
        }
    }
}