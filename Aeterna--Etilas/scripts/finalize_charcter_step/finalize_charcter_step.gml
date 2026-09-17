function character_sheet_update(cc)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var clicked = mouse_check_button_pressed(mb_left);
    
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // BACK button
    var back_x = 40;
    var back_y = screen_h - 70;
    var back_w = 160;
    var back_h = 50;
    
    if (clicked && point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h))
    {
        go_back_step(cc);
        return;
    }
    
    // FINISH CHARACTER button
    var fin_w = 260;
    var fin_h = 50;
    var fin_x = (screen_w - fin_w) * 0.5;
    var fin_y = screen_h - 70;
    
    if (clicked && point_in_rectangle(mx, my, fin_x, fin_y, fin_x + fin_w, fin_y + fin_h))
    {
        // TODO: finalize character (save, move to play, etc.)
        show_debug_message("Character finalized!");
        // go_to_next_step(cc);  or whatever your end-of-creation call is
        return;
    }
}