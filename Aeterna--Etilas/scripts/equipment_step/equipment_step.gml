function equipment_shop_update(cc)
{
    equipment_step_init(cc);

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var clicked = mouse_check_button_pressed(mb_left);
    var right_clicked = mouse_check_button_pressed(mb_right);

    var L = {
        center_x: display_get_gui_width() * 0.5,
        center_y: display_get_gui_height() * 0.5
    };
    var lay = equipment_layout(L);

    // ===== BACK (handle first so nothing else eats the click) =====
    var back_x = 40;
    var back_y = display_get_gui_height() - 100;
    var back_w = 160;
    var back_h = 60;

    if (clicked && point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h))
    {
        
            go_back_step(cc);
       
    }

    // ===== CONFIRM =====
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var btn_w = 260;
    var btn_h = 60;
    var btn_x = (screen_w - btn_w) * 0.5;
    var btn_y = screen_h - 100;

    if (clicked && point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h))
    {
        go_to_next_step(cc);
        return;
    }

    handle_equipment_column(cc, lay.weapons_x, "weapons", lay, mx, my, clicked, right_clicked);
    handle_equipment_column(cc, lay.armor_x,   "armor",   lay, mx, my, clicked, right_clicked);
    handle_equipment_column(cc, lay.gear_x,    "gear",    lay, mx, my, clicked, right_clicked);
}

