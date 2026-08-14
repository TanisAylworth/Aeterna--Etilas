function equipment_shop_draw(cc)
{
    equipment_step_init(cc);

	var L = {
        center_x: display_get_gui_width() * 0.5,
        center_y: display_get_gui_height() * 0.5
    };

    equipment_step_init(cc);
    var lay = equipment_layout(L);


	// Gold panel
	var gold_w = 220;
	var gold_h = 50;
	var gold_x = L.center_x - gold_w * 0.5;
	var gold_y = 100;

	draw_set_color(make_color_rgb(18, 18, 18));
	draw_rectangle(gold_x, gold_y, gold_x + gold_w, gold_y + gold_h, false);

	draw_set_color(c_gray);
	draw_rectangle(gold_x, gold_y, gold_x + gold_w, gold_y + gold_h, true);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_aqua);
	draw_text(L.center_x, gold_y + gold_h * 0.5, "Starting Gold: " + string(cc.equipment.gold));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
    

    // Clear hover each frame (set again while drawing)
    cc.equipment.hovered_category = "";
    cc.equipment.hovered_item = "";

    draw_equipment_column(cc, lay.weapons_x, "weapons", "WEAPONS", lay);
    draw_equipment_column(cc, lay.armor_x,   "armor",   "ARMOR",   lay);
    draw_equipment_column(cc, lay.gear_x,    "gear",    "GEAR",    lay);

    // Confirm → finalize (always available for now)
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var btn_w = 260;
    var btn_h = 60;
    var btn_x = (screen_w - btn_w) * 0.5;
    var btn_y = screen_h - 100;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var hover = point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

    draw_set_color(hover ? c_lime : c_green);
    draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
    draw_set_color(c_white);
    draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "CONFIRM EQUIPMENT");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	
	
	// BACK button
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
    draw_set_color(c_black);
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