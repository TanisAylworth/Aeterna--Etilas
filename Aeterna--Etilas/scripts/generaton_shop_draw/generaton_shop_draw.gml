function generation_shop_draw()
{
    var cc = global.char_creation;
	var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
   
    if (!variable_struct_exists(cc, "generation")) return;
   
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

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var L = generation_layout(cc);

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

    var tables_x = L.center_x - col_w - col_gap - 200;   // Center-left
    var skills_x = L.center_x;                // Slightly right of center
    var talents_x = L.center_x + col_w + col_gap + 200;  // Far right

    // Main Columns
    draw_tables_column(cc, L, tables_x);           // Pass tables_x if needed
    draw_skills_column(cc, L, skills_x);           // Pass skills_x if needed
	draw_set_halign(fa_center);   // Reset alignment before drawing Talents
    draw_set_color(c_white);
    draw_text(talents_x, yy, "TALENTS");

    // Tooltips and Popups
    draw_skill_tooltip(cc);
    if (variable_struct_exists(cc, "specialization_popup") && cc.specialization_popup)
        draw_specialization_popup(cc, L);

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
}