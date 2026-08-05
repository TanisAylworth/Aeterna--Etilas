function generation_step_update(cc)
{
    var L = {
    center_x: display_get_gui_width() * 0.5,
    center_y: display_get_gui_height() * 0.5
};

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
	var screen_h = display_get_gui_height();
	var back_x = 40;
	var back_y = screen_h - 100;

	var back_w = 160;
	var back_h = 60;
    var clicked = mouse_check_button_pressed(mb_left);
    var right_clicked = mouse_check_button_pressed(mb_right);
	show_debug_message("Mouse GUI: " + string(mx) + ", " + string(my));

    // === CLEAR HOVERS EVERY FRAME ===
    cc.hovered_table = "";
	cc.hovered_talent = "";
    cc.hovered_skill = "";

    // Force initialization if needed
    if (!variable_struct_exists(cc, "generation_initialized") || !cc.generation_initialized)
    {
        generation_shop_init(cc);
        return;
    }

    // ... rest of your function continues ...

    // =================================================
    // SPECIALIZATION POPUP (Highest priority)
    // =================================================
    if (variable_struct_exists(cc, "specialization_popup") && cc.specialization_popup)
    {
        if (handle_specialization_popup(cc, L, mx, my, clicked))
            exit;
    }

    // =================================================
    // CDT & GOLD CONTROLS
    // =================================================
    handle_cdt_gold_controls(cc, L, mx, my, clicked);



    var lay = generation_layout(L);

handle_table_list(cc, L, mx, my, clicked, lay.tables_x);
handle_skill_list(cc, L, mx, my, clicked, right_clicked, lay.skills_x);
handle_talent_list(cc, L, mx, my, clicked, right_clicked, lay.talents_x);
	
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