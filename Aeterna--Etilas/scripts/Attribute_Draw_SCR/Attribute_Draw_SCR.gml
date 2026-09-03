
function attribute_step_draw(cc)
{
	
	
    // =====================================================
    // VALIDATION
    // =====================================================

    if (!variable_global_exists("ATTRIBUTES")) exit;
    if (!is_array(global.ATTRIBUTES)) exit;
    if (!is_struct(cc)) exit;

    if (!variable_struct_exists(cc, "attribute_initialized"))
        exit;

    // =====================================================
    // SAFETY
    // =====================================================

    if (!variable_struct_exists(cc, "roll_pool"))
        cc.roll_pool = generate_roll_pool();

    if (!variable_struct_exists(cc, "assigned"))
        cc.assigned = {};

    if (!variable_struct_exists(cc, "species_bonus_map"))
        cc.species_bonus_map = {};

    if (!variable_struct_exists(cc, "species_bonus_remaining"))
        cc.species_bonus_remaining = 0;

    if (!variable_struct_exists(cc, "selected_roll_index"))
        cc.selected_roll_index = -1;

    if (!variable_struct_exists(cc, "confirm_btn"))
    {
        cc.confirm_btn =
        {
            w : 260,
            h : 60,
            x : 0,
            y : 0
        };
    }

    // =====================================================
    // INPUT
    // =====================================================

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();

    // =====================================================
    // LAYOUT
    // =====================================================

    var attr_count = array_length(global.ATTRIBUTES);

    var L = get_attribute_layout();

    var bonus_x = L.right_x + 120;
    var bonus_y = L.top_y;

	
    

    // =====================================================
// ROLL POOL DRAW (Matching box style)
// =====================================================
var roll_pool = cc.roll_pool;
var roll_count = array_length(roll_pool);
var roll_w = 70;
var roll_h = 36;
var roll_spacing = 12;

// Fixed layout width — original pool size (does not shrink)
var full_count = array_length(cc.base_pool);
if (full_count <= 0)
    full_count = array_length(global.ATTRIBUTES);

var roll_total_w = full_count * roll_w + max(0, full_count - 1) * roll_spacing;
var roll_start_x = (screen_w - roll_total_w) * 0.5;
var roll_y = 80;

// Header
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(screen_w * 0.5, roll_y - 28, "ROLL POOL");
draw_set_halign(fa_left);

// Draw only remaining rolls (left-aligned inside the fixed strip)
for (var i = 0; i < roll_count; i++)
{
    var x1 = roll_start_x + i * (roll_w + roll_spacing);
    var y1 = roll_y;
    var x2 = x1 + roll_w;
    var y2 = y1 + roll_h;

    var is_selected = (cc.selected_roll_index == i);
    var briefing_up = variable_struct_exists(cc, "briefing_open") && cc.briefing_open;

	var hover = !briefing_up && point_in_rectangle(mx, my, x1, y1, x2, y2);

    if (is_selected)
        draw_set_color(make_color_rgb(70, 70, 30));
    else if (hover)
        draw_set_color(make_color_rgb(55, 55, 35));
    else
        draw_set_color(c_black);

    draw_rectangle(x1, y1, x2, y2, false);

    if (is_selected)
        draw_set_color(c_yellow);
    else if (hover)
        draw_set_color(c_ltgray);
    else
        draw_set_color(c_white);

    draw_rectangle(x1, y1, x2, y2, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    if (cc.manual_roll_mode && cc.editing_roll_index == i)
        draw_text(x1 + roll_w * 0.5, y1 + roll_h * 0.5, cc.editing_roll_string + "|");
    else
        draw_text(x1 + roll_w * 0.5, y1 + roll_h * 0.5, string(roll_pool[i]));

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// Manual Rolls — fixed to the RIGHT EDGE of the full strip
var man_w = 140;
var man_h = 32;
var man_x = roll_start_x + roll_total_w + 20;
var man_y = roll_y;
	
	var briefing_up = variable_struct_exists(cc, "briefing_open") && cc.briefing_open;

    var hover_man = !briefing_up && point_in_rectangle(mx, my, man_x, man_y, man_x + man_w, man_y + man_h);

    draw_set_color(cc.manual_roll_mode ? make_color_rgb(60, 40, 20) : make_color_rgb(30, 30, 30));
    draw_rectangle(man_x, man_y, man_x + man_w, man_y + man_h, false);

    draw_set_color(hover_man ? c_yellow : (cc.manual_roll_mode ? c_orange : c_gray));
    draw_rectangle(man_x, man_y, man_x + man_w, man_y + man_h, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(man_x + man_w * 0.5, man_y + man_h * 0.5, cc.manual_roll_mode ? "Done" : "Manual Rolls");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	

        // =====================================================
    // ATTRIBUTES DRAW (More spacing + centered text)
    // =====================================================
    draw_set_halign(fa_center);
    draw_text_colour(screen_w * 0.5, L.top_y - 50, "ATTRIBUTES", c_white, c_white, c_white, c_white, 1);
    draw_set_halign(fa_left);

    for (var i = 0; i < attr_count; i++)
    {
        var attr = global.ATTRIBUTES[i];
        var r = get_attribute_rect(i);

        // Slightly taller + more visual padding
        var box_h = 120;
        var x1 = r.x;
        var y1 = r.y;
        var x2 = r.x + r.w;
        var y2 = r.y + box_h;

        // Values
        var base = is_real(cc.assigned[$ attr]) ? cc.assigned[$ attr] : undefined;
        var species_bonus = 0;
        var choice_bonus = variable_struct_exists(cc.species_bonus_map, attr) ? 1 : 0;

        // Species bonus lookup
        var sp = cc.locked_species;
        if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
        {
            var data = global.species_data[$ sp];
            if (variable_struct_exists(data, "stats") && variable_struct_exists(data.stats, "attributes"))
            {
                var attrs = data.stats.attributes;
                if (variable_struct_exists(attrs, attr))
                    species_bonus = attrs[$ attr];
                else if (variable_struct_exists(attrs, string_lower(attr)))
                    species_bonus = attrs[$ string_lower(attr)];
            }
        }

        var final_val = (is_real(base) ? base : 0) + species_bonus + choice_bonus;
        var is_assigned = is_real(base);
        var has_adjustment = (species_bonus != 0) || (choice_bonus > 0);
        var hover = !briefing_up && point_in_rectangle(mx, my, x1, y1, x2, y2);
		

        // === BACKGROUND ===
        if (hover)
            draw_set_color(make_color_rgb(70, 70, 40));
        else if (has_adjustment)
            draw_set_color(make_color_rgb(20, 55, 70));
        else if (is_assigned)
            draw_set_color(make_color_rgb(20, 50, 20));
        else
            draw_set_color(c_black);

        draw_rectangle(x1, y1, x2, y2, false);

        // === BORDER ===
        if (hover)
            draw_set_color(c_yellow);
        else if (is_assigned)
            draw_set_color(c_lime);
        else if (has_adjustment)
            draw_set_color(c_teal);
        else
            draw_set_color(c_white);

        draw_rectangle(x1, y1, x2, y2, true);

        // === CENTERED TEXT ===
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);

        // Attribute name + total
        draw_set_color(c_white);
        draw_text((x1 + x2) * 0.5, y1 + 10, attr + ": " + string(final_val));

        // Species / Choice adjustment
        if (has_adjustment)
        {
            draw_set_color(c_aqua);
            var adj_text = "";
            if (species_bonus != 0)
            {
                var _sign = species_bonus > 0 ? "+" : "";
                adj_text += "Species " + _sign + string(species_bonus);
            }
            if (choice_bonus > 0)
            {
                if (adj_text != "") adj_text += "  ";
                adj_text += "Bonus +1";
            }
            draw_text((x1 + x2) * 0.5, y1 + 32, adj_text);
        }

        // Derived effects
        draw_set_color(c_ltgray);
        if (variable_struct_exists(global.attribute_data, attr))
        {
            var effects = global.attribute_data[$ attr](final_val);
            for (var j = 0; j < array_length(effects); j++)
            {
                draw_text((x1 + x2) * 0.5, y1 + 56 + j * 18, effects[j]);
            }
        }

        // Reset alignment
        draw_set_halign(fa_center);
	}
        // =====================================================
    // SPECIES BONUS PANEL (More spacing between rows)
    // =====================================================
    var panel_w = 240;
    var panel_h = 440;               // a bit taller to fit the extra space
    var panel_x = bonus_x;
    var panel_y = bonus_y;
    var row_h = 28;                  // taller clickable rows
    var row_spacing = 6;             // gap between rows

    // Background
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

    // Border
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

    // Header
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(panel_x + panel_w * 0.5, panel_y + 12, "SPECIES BONUSES");
    
    draw_set_color(c_aqua);
    draw_text(panel_x + panel_w * 0.5, panel_y + 36, "Remaining: " + string(cc.species_bonus_remaining));
    draw_set_halign(fa_left);

    // Attribute list
    for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
    {
        var attr = global.ATTRIBUTES[i];
        var yy = panel_y + 70 + i * (row_h + row_spacing);
        
        var selected = variable_struct_exists(cc.species_bonus_map, attr);
        var hover = !briefing_up && point_in_rectangle(mx, my, panel_x + 12, yy, panel_x + panel_w - 12, yy + row_h);

        // Row background
        if (selected)
            draw_set_color(make_color_rgb(20, 60, 30));
        else if (hover && cc.species_bonus_remaining > 0)
            draw_set_color(make_color_rgb(50, 50, 30));
        else
            draw_set_color(make_color_rgb(35, 35, 35));

        draw_rectangle(panel_x + 10, yy, panel_x + panel_w - 10, yy + row_h, false);

        // Row border
        if (selected)
            draw_set_color(c_lime);
        else if (hover && cc.species_bonus_remaining > 0)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_black);

        draw_rectangle(panel_x + 10, yy, panel_x + panel_w - 10, yy + row_h, true);

        // Text
        draw_set_color(c_white);
        draw_text(panel_x + 18, yy + 5, attr);

        draw_set_halign(fa_right);
        draw_set_color(selected ? c_lime : c_ltgray);
        draw_text(panel_x + panel_w - 18, yy + 5, selected ? "−" : "+");
        draw_set_halign(fa_left);
    }
		
	
    // =====================================================
// CONTROLS PANEL
// =====================================================

var ctrl_x = 20;
var ctrl_y = 20;

var ctrl_w = 400;
var ctrl_h = 200;

// Background
draw_set_color(c_black);

draw_rectangle(
    ctrl_x,
    ctrl_y,
    ctrl_x + ctrl_w,
    ctrl_y + ctrl_h,
    false
);

draw_set_colour(c_white)
draw_rectangle(
    ctrl_x,
    ctrl_y,
    ctrl_x + ctrl_w,
    ctrl_y + ctrl_h,
    true
);



// Text
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(ctrl_x + 10, ctrl_y + 10, "CONTROLS");

draw_text(ctrl_x + 10, ctrl_y + 35,
    "* Left Click Roll = Select");

draw_text(ctrl_x + 10, ctrl_y + 55,
    "* Left Click Attribute = Assign / Swap");
	
	draw_text(ctrl_x + 10, ctrl_y + 75,
    "* Right Click Assigned Attribute = Remove");

draw_text(ctrl_x + 10, ctrl_y + 95,
    "* Left Click Species Bonus = Add / Remove");
	
	

draw_text(ctrl_x + 10, ctrl_y + 115,
    "* R = Reroll All");

draw_text(ctrl_x + 10, ctrl_y + 135,
    "* Z = Undo");

draw_text(ctrl_x + 10, ctrl_y + 155,
    "* A = Auto Assign");

        // =====================================================
    // CONFIRM BUTTON (with hover border)
    // =====================================================
    var btn_w = cc.confirm_btn.w;
    var btn_h = cc.confirm_btn.h;
    var btn_x = (screen_w - btn_w) * 0.5;
    var btn_y = screen_h - 100;
    cc.confirm_btn.x = btn_x;
    cc.confirm_btn.y = btn_y;

    var hover_btn = !briefing_up && point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

    // Ready check
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

    // Background
    if (!ready)
        draw_set_color(c_dkgray);
    else if (hover_btn)
        draw_set_color(make_color_rgb(40, 90, 40));
    else
        draw_set_color(make_color_rgb(30, 70, 30));

    draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

    // Border
    if (!ready)
        draw_set_color(c_gray);
    else if (hover_btn)
        draw_set_color(c_lime);          // bright green border on hover
    else
        draw_set_color(c_green);

    draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, true);

    // Text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "CONFIRM ATTRIBUTES");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);


	// =====================================
// BACK BUTTON
// =====================================

    // =====================================
    // BACK BUTTON SETUP
    // =====================================
    var back_x = 40;
    var back_y = display_get_gui_height() - 100;
    var back_w = 160;
    var back_h = 60;

var can_back = array_length(cc.step_history) > 0;

var hover_back = !briefing_up && point_in_rectangle(
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

briefing_draw(cc);
	
}