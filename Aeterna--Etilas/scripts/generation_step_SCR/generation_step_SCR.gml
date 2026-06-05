function generation_step_update(cc)
{
    var L = generation_layout(cc);

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var clicked = mouse_check_button_pressed(mb_left);

    // =================================================
    // SHARED COORDS (MUST MATCH DRAW 1:1)
    // =================================================
    var cdt_x  = L.center_x - L.panel_spacing;
    var gold_x = L.center_x + L.panel_spacing;

    var title_y = L.top_y;
	var cost_y  = L.top_y + 22;
	var btn_y   = L.top_y + 55;
	var value_y = L.top_y + 95;
    var half_w = L.panel_w * 0.5;

    // =================================================
    // CDT HITBOX
    // =================================================
    var cdt_minus_l = cdt_x - half_w;
    var cdt_minus_r = cdt_x - L.btn_gap;

    var cdt_plus_l  = cdt_x + L.btn_gap;
    var cdt_plus_r  = cdt_x + half_w;

    var cdt_h = L.btn_h;

    cc.generation_hover.cdt_minus =
        point_in_rectangle(mx, my, cdt_minus_l, btn_y, cdt_minus_r, btn_y + cdt_h);

    cc.generation_hover.cdt_plus =
        point_in_rectangle(mx, my, cdt_plus_l, btn_y, cdt_plus_r, btn_y + cdt_h);

    // =================================================
    // GOLD HITBOX
    // =================================================
    var g_minus_l = gold_x - half_w;
    var g_minus_r = gold_x - L.btn_gap;

    var g_plus_l  = gold_x + L.btn_gap;
    var g_plus_r  = gold_x + half_w;

    cc.generation_hover.gold_minus =
        point_in_rectangle(mx, my, g_minus_l, btn_y, g_minus_r, btn_y + cdt_h);

    cc.generation_hover.gold_plus =
        point_in_rectangle(mx, my, g_plus_l, btn_y, g_plus_r, btn_y + cdt_h);

    // =================================================
    // CLICK LOGIC
    // =================================================
    if (clicked)
    {
        if (cc.generation_hover.cdt_minus && cc.generation.cdt_bonus > 0)
        {
            cc.generation.cdt_bonus -= 1;
            cc.generation_slots_remaining += 1;
        }

        if (cc.generation_hover.cdt_plus && cc.generation_slots_remaining > 0)
        {
            if (cc.generation.cdt_bonus + 1 <= get_cdt_cap(cc))
		{
		    cc.generation.cdt_bonus += 1;
		    cc.generation_slots_remaining -= 1;
		}
        }

        if (cc.generation_hover.gold_minus && cc.generation.gold_bonus > 0)
        {
            cc.generation.gold_bonus -= 20;
            cc.generation_slots_remaining += 1;
        }

        if (cc.generation_hover.gold_plus && cc.generation_slots_remaining > 0)
        {
            cc.generation.gold_bonus += 20;
            cc.generation_slots_remaining -= 1;
        }
    }
	
	
	var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var clicked = mouse_check_button_pressed(mb_left);

var tables = [];
if (variable_struct_exists(cc, "available_tables"))
{
    tables = cc.available_tables;
}

var col_x = L.center_x - 250;
var start_y = 360;
var spacing = 22;

for (var i = 0; i < array_length(tables); i++)
{
    var t = tables[i];

    var x1 = col_x;
    var y1 = start_y + i * spacing;
    var x2 = col_x + 200;
    var y2 = y1 + 18;

    var hovering = point_in_rectangle(mx, my, x1, y1, x2, y2);

    if (hovering && clicked)
    {
        var idx = array_index_of(cc.generation.tables, t);

        if (idx == -1)
        {
            array_push(cc.generation.tables, t);
        }
        else
        {
            array_delete(cc.generation.tables, idx, 1);
        }
    }
}
}