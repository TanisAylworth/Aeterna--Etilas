function attribute_step_update(cc)
{
    if (!is_struct(cc)) return;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
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
    

   var L = get_attribute_layout();

var bonus_x = L.right_x + 120;
var bonus_y = L.top_y;

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

        draw_set_color(!ready ? c_dkgray : (hover_btn ? c_lime : c_green));
        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "CONFIRM ATTRIBUTES");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        // CLICK DETECTION
        if (hover_btn && mouse_check_button_pressed(mb_left) && ready)
        {
            show_debug_message("Confirmed attributes for: " + string(cc.locked_species));
            go_to_next_step(cc);
        }
    }

}

}        