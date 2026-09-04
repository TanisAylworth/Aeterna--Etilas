function generation_shop_draw(step)
{
    var cc = global.char_creation;
	var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	draw_generation_help_box();
    if (!variable_struct_exists(cc, "generation")) return;
	generation_init_species_choices(cc);
    // Safety defaults
    if (!variable_struct_exists(cc, "hovered_table")) cc.hovered_table = "";
    if (!variable_struct_exists(cc, "hovered_skill")) cc.hovered_skill = "";
    if (!variable_struct_exists(cc, "selected_table")) cc.selected_table = "";
    if (!variable_struct_exists(cc.generation, "tables_locked")) cc.generation.tables_locked = false;

    if (!variable_struct_exists(cc, "generation_hover"))
    {
        cc.generation_hover = {
            cdt_minus: false,
            cdt_plus: false,
            gold_minus: false,
            gold_plus: false
        };
    }
	

	var L = {center_x: display_get_gui_width() * 0.5,center_y: display_get_gui_height() * 0.5};
	var lay = generation_layout(L);
	var modal = variable_struct_exists(cc, "specialization_popup") && cc.specialization_popup;

if (modal)
{
    cc.hovered_skill = "";
    cc.hovered_talent = "";
    cc.hovered_table = "";
}

// columns...
draw_skills_column(cc, L, lay.skills_x);
draw_tables_column(cc, L, lay.tables_x);
draw_talents_column(cc, L, lay.talents_x);

if (!modal)
{
    draw_talent_tooltip(cc);
    draw_skill_tooltip(cc);
}
if (modal)
{
    cc.hovered_table = "";
    cc.hovered_skill = "";
    if (variable_struct_exists(cc, "hovered_talent"))
        cc.hovered_talent = "";
    mx = -99999;
    my = -99999;
}

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var L = {
    center_x: display_get_gui_width() * 0.5,
    center_y: display_get_gui_height() * 0.5
};

    draw_text(L.center_x, 40, "CHARACTER GENERATION");
    draw_text(L.center_x, 70, "Remaining Character Points: "
        + string(cc.generation_slots_remaining)
        + " / "
        + string(cc.generation_slots_total));

    // CDT & Gold
    draw_cdt_gold_panels(cc, L);

    // =================================================
    // COLUMNS - Adjusted Layout
    // =================================================
    var col_w = 280;           // Wider for tables
    var col_gap = 40;          // Reduced gap
    var yy = 320;

    var tables_x = L.center_x;   // Center-left
    var skills_x = L.center_x - col_w - col_gap - 300;                // Slightly right of center
    var talents_x = L.center_x + col_w + col_gap + 300;  // Far right
	generation_layout(L);
    // Main Columns
	var lay = generation_layout(L);

	draw_skills_column(cc, L, lay.skills_x);
	draw_tables_column(cc, L, lay.tables_x);
	draw_talents_column(cc, L, lay.talents_x);

		draw_talent_tooltip(cc);
	draw_skill_tooltip(cc);
	draw_set_halign(fa_center);   // Reset alignment before drawing Talents
    draw_set_color(c_white);
    

	
	
	// =====================================
// BACK BUTTON
// =====================================


var back_x = 40;
	var back_y = display_get_gui_height() - 100;

	var back_w = 160;
	var back_h = 60;
	var can_back = array_length(cc.step_history) > 0;


var hover_back = point_in_rectangle(
    mx,
    my,
    back_x,
    back_y,
    back_x + back_w,
    back_y + back_h
);


if (!can_back)
{
    draw_set_color(c_dkgray);
}
else if (hover_back)
{
    draw_set_color(c_lime);
}
else
{
    draw_set_color(c_gray);
}


draw_rectangle(
    back_x,
    back_y,
    back_x + back_w,
    back_y + back_h,
    false
);


// Border
draw_set_color(c_white);

draw_rectangle(
    back_x,
    back_y,
    back_x + back_w,
    back_y + back_h,
    true
);


// Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    back_x + back_w * 0.5,
    back_y + back_h * 0.5,
    "BACK"
);


draw_set_halign(fa_left);
draw_set_valign(fa_top);



// ===== CONFIRM GENERATION =====
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

var btn_w = 260;
var btn_h = 60;
var btn_x = (screen_w - btn_w) * 0.5;
var btn_y = screen_h - 100;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var hover = point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

var ready = (cc.generation_slots_remaining <= 0);

if (!ready)
    draw_set_color(c_dkgray);
else if (hover)
    draw_set_color(make_color_rgb(40, 90, 40));
else
    draw_set_color(make_color_rgb(30, 70, 30));

draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

if (!ready)
        draw_set_color(c_gray);
    else if (hover)
        draw_set_color(c_lime);          // bright green border on hover
    else
        draw_set_color(c_green);

    draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(ready ? c_white : c_ltgray);
draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "CONFIRM GENERATION");
draw_set_halign(fa_left);
draw_set_valign(fa_top);


if (variable_struct_exists(cc, "specialization_popup") && cc.specialization_popup)
{
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    
    // Dimmer
    draw_set_alpha(0.65);
    draw_set_color(c_black);
    draw_rectangle(0, 0, screen_w, screen_h, false);
    draw_set_alpha(1);
    
    var panel_w = min(480, screen_w - 80);
    var panel_h = min(400, screen_h - 80);
    var panel_x = (screen_w - panel_w) * 0.5;
    var panel_y = (screen_h - panel_h) * 0.5;
    
    draw_set_color(make_color_rgb(30, 30, 40));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
    
    draw_set_halign(fa_center);
    draw_text(panel_x + panel_w * 0.5, panel_y + 20, "Choose Specialization");
    draw_set_halign(fa_left);
    
    var base_name = string(cc.pending_skill);
    draw_text(panel_x + 24, panel_y + 48, base_name);
    
    var choices = cc.pending_specializations;
    var list_y = panel_y + 70;
    var row_h = 32;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (is_array(choices))
    {
        for (var i = 0; i < array_length(choices); i++)
        {
            var yy = list_y + i * row_h;
            var hover = point_in_rectangle(mx, my, panel_x + 20, yy, panel_x + panel_w - 20, yy + row_h - 4);
            
            draw_set_color(hover ? make_color_rgb(70, 70, 40) : make_color_rgb(40, 40, 50));
            draw_rectangle(panel_x + 20, yy, panel_x + panel_w - 20, yy + row_h - 4, false);
            draw_set_color(hover ? c_yellow : c_white);
            draw_rectangle(panel_x + 20, yy, panel_x + panel_w - 20, yy + row_h - 4, true);
            draw_set_color(c_white);
            draw_text(panel_x + 28, yy + 6, string(choices[i]));
        }
    }
    
    // CLOSE button
    var close_w = 120;
    var close_h = 40;
    var close_x = panel_x + (panel_w - close_w) * 0.5;
    var close_y = panel_y + panel_h - close_h - 16;
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

briefing_draw(cc);
}