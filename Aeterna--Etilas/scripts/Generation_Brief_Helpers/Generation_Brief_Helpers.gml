function briefing_ensure_state(cc)
{
    if (!variable_struct_exists(cc, "briefing_open"))
        cc.briefing_open = false;
    if (!variable_struct_exists(cc, "briefing_seen"))
        cc.briefing_seen = {};
}

function briefing_get_step_id(cc)
{
    if (!variable_struct_exists(cc, "steps") || !variable_struct_exists(cc, "step_index"))
        return "";
    if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps))
        return "";
    var step = cc.steps[cc.step_index];
    if (!is_struct(step) || !variable_struct_exists(step, "id"))
        return "";
    return step.id;
}

/// Call when entering a step (e.g. end of go_to_next_step)
function briefing_on_enter_step(cc)
{
    briefing_ensure_state(cc);
    var sid = briefing_get_step_id(cc);
    if (sid == "") return;
    
    if (!variable_struct_exists(cc.briefing_seen, sid) || !cc.briefing_seen[$ sid])
    {
        cc.briefing_open = true;
        cc.briefing_seen[$ sid] = true;
    }
}

function briefing_open(cc)
{
    briefing_ensure_state(cc);
    cc.briefing_open = true;
}

function briefing_close(cc)
{
    briefing_ensure_state(cc);
    cc.briefing_open = false;
}


/// Returns true if the briefing consumed input (caller should skip normal UI)
function briefing_update(cc)
{
    briefing_ensure_state(cc);
    if (!is_struct(cc)) return false;
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    var q_size = 36;
    var q_x = screen_w - q_size - 16;
    var q_y = 16;
    
    // "?" — always clickable
    if (mouse_check_button_pressed(mb_left)
        && point_in_rectangle(mx, my, q_x, q_y, q_x + q_size, q_y + q_size))
    {
        briefing_open(cc);
        return true;
    }
    
    if (!cc.briefing_open)
    return false;

	var was_open = true;
    
    // --- modal: panel is open ---
    var panel_w = min(640, screen_w - 80);
    var panel_h = min(420, screen_h - 80);
    var panel_x = (screen_w - panel_w) * 0.5;
    var panel_y = (screen_h - panel_h) * 0.5;
    
    var close_w = 120;
    var close_h = 40;
    var close_x = panel_x + (panel_w - close_w) * 0.5;
    var close_y = panel_y + panel_h - close_h - 20;
    
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right))
    {
        if (point_in_rectangle(mx, my, close_x, close_y, close_x + close_w, close_y + close_h))
            briefing_close(cc);
        // any other click: still consumed
    }
    
    if (keyboard_check_pressed(vk_escape))
        briefing_close(cc);

	
	if (was_open)
    return true;
}

function briefing_draw(cc)
{
	
    briefing_ensure_state(cc);
    
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // "?" button
    var q_size = 28;
    var q_x = screen_w - q_size - 14;
    var q_y = 14;
    var q_hover = point_in_rectangle(mx, my, q_x, q_y, q_x + q_size, q_y + q_size);
    
    draw_set_color(q_hover ? c_ltgray : c_dkgray);
    draw_rectangle(q_x, q_y, q_x + q_size, q_y + q_size, false);
    draw_set_color(c_white);
    draw_rectangle(q_x, q_y, q_x + q_size, q_y + q_size, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_text(q_x + q_size * 0.5 - 1, q_y + q_size * 0.5, "?");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    if (!cc.briefing_open)
        return;
    
    // Dimmer — full screen so it feels modal
    draw_set_alpha(0.65);
    draw_set_color(c_black);
    draw_rectangle(0, 0, screen_w, screen_h, false);
    draw_set_alpha(1);
    
    var panel_w = min(980, screen_w - 80);
    var panel_h = min(420, screen_h - 80);
    var panel_x = (screen_w - panel_w) * 0.5;
    var panel_y = (screen_h - panel_h) * 0.5;
    
    draw_set_color(make_color_rgb(30, 30, 40));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
    
    var sid = briefing_get_step_id(cc);
    var body = "No briefing for this step.";
    if (variable_struct_exists(global, "briefing_text") && variable_struct_exists(global.briefing_text, sid))
        body = global.briefing_text[$ sid];
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(panel_x + 24, panel_y + 24, body, 22, panel_w - 48);
    
    // Close button
    var close_w = 120;
    var close_h = 40;
    var close_x = panel_x + (panel_w - close_w) * 0.5;
    var close_y = panel_y + panel_h - close_h - 20;
    var close_hover = point_in_rectangle(mx, my, close_x, close_y, close_x + close_w, close_y + close_h);
    
    draw_set_color(close_hover ? c_lime : c_green);
    draw_rectangle(close_x, close_y, close_x + close_w, close_y + close_h, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(close_x + close_w * 0.5, close_y + close_h * 0.5, "CLOSE");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}