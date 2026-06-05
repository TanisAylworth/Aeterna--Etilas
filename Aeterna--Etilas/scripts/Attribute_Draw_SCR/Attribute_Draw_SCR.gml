
function attribute_step_draw(cc)
{
	if (!variable_global_exists("ATTRIBUTES"))
{
    exit;
}

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "attribute_initialized")) exit;
if (!is_array(global.ATTRIBUTES)) exit;
	
    if (!is_struct(cc)) exit;
	
	if (!variable_struct_exists(cc, "attribute_initialized"))
    exit;

    // =====================================================
    // SAFETY (ONLY ONCE, EARLY)
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
        cc.confirm_btn = { w: 260, h: 60, x: 0, y: 0 };
    }

    // =====================================================
    // INPUT (SINGLE SOURCE OF TRUTH)
    // =====================================================
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();

    // =====================================================
    // LAYOUT CONFIG
    // =====================================================
    var cols = 2;

    var attr_w = 200;
    var attr_h = 20;

    var col_spacing = 80;
    var row_spacing = 90;

    var attr_count = is_array(global.ATTRIBUTES)
    ? array_length(global.ATTRIBUTES)
    : 0;

    var total_attr_w = cols * attr_w + (cols - 1) * col_spacing;
    var attr_start_x = (screen_w - total_attr_w) * 0.5;
    var attr_y = 220;

    var bonus_x = attr_start_x + total_attr_w + 120;
    var bonus_y = attr_y;

    // =====================================================
    // ROLL POOL DRAW
    // =====================================================
    var roll_pool = cc.roll_pool;
    var roll_count = array_length(roll_pool);

    var roll_w = 60;
    var roll_h = 20;
    var roll_spacing = 10;

    var roll_total_w = roll_count * roll_w + (roll_count - 1) * roll_spacing;
    var roll_start_x = (screen_w - roll_total_w) * 0.5;
    var roll_y = 80;

    draw_set_halign(fa_center);

    draw_text_colour(
        screen_w * 0.5,
        roll_y - 30,
        "ROLL POOL",
        c_white,c_white,c_white,c_white,1
    );

    draw_set_halign(fa_left);

    for (var i = 0; i < roll_count; i++)
    {
        var x1 = roll_start_x + i * (roll_w + roll_spacing);
        var y1 = roll_y;

        var hover = point_in_rectangle(mx, my, x1, y1, x1 + roll_w, y1 + roll_h);

        if (cc.selected_roll_index == i)
            draw_set_color(c_yellow);
        else if (hover)
            draw_set_color(c_ltgray);
        else
            draw_set_color(c_white);

        draw_rectangle(x1, y1, x1 + roll_w, y1 + roll_h, false);

        draw_set_color(c_black);
        draw_text(x1 + 5, y1 + 2, string(roll_pool[i]));
    }

    // =====================================================
    // ATTRIBUTES DRAW
    // =====================================================
    draw_set_halign(fa_center);

    draw_text_colour(
        screen_w * 0.5,
        attr_y - 50,
        "ATTRIBUTES",
        c_white,c_white,c_white,c_white,1
    );

    draw_set_halign(fa_left);

    for (var i = 0; i < attr_count; i++)
    {
        var attr = global.ATTRIBUTES[i];

        var col = i mod cols;
        var row = floor(i / cols);

        var x1 = attr_start_x + col * (attr_w + col_spacing);
        var y1 = attr_y + row * row_spacing;

        var x2 = x1 + attr_w;
        var y2 = y1 + attr_h;

        var base = 0;
        var species_bonus = 0;
        var choice_bonus = 0;

        if (is_real(cc.assigned[$ attr]))
            base = cc.assigned[$ attr];

        var final_val = base + species_bonus + choice_bonus;

        var hover = point_in_rectangle(mx, my, x1, y1, x2, y2);

        var is_assigned = is_real(cc.assigned[$ attr]);
        var has_bonus = variable_struct_exists(cc.species_bonus_map, attr);

        if (hover)
        {
            if (is_assigned && has_bonus) draw_set_color(make_color_rgb(120,255,120));
            else if (is_assigned) draw_set_color(c_ltgray);
            else if (has_bonus) draw_set_color(c_aqua);
            else draw_set_color(c_yellow);
        }
        else
        {
            if (is_assigned) draw_set_color(c_green);
            else if (has_bonus) draw_set_color(c_aqua);
            else draw_set_color(c_white);
        }

        draw_rectangle(x1, y1, x2, y2, false);

        draw_set_color(c_black);

        draw_text(x1 + 5, y1 + 2, attr + ": " + string(final_val));

        if (variable_struct_exists(global.attribute_data, attr))
        {
            var effects = global.attribute_data[$ attr](final_val);

            for (var j = 0; j < array_length(effects); j++)
            {
                draw_text(x1 + 5, y1 + 18 + j * 14, effects[j]);
            }
        }
    }

    // =====================================================
    // SPECIES PANEL (UNCHANGED LOGIC, CLEANED INPUT)
    // =====================================================
    draw_text(bonus_x, bonus_y, "SPECIES BONUSES");

    draw_text(
        bonus_x,
        bonus_y + 20,
        "Remaining: " + string(cc.species_bonus_remaining)
    );

    // =====================================================
    // CONTROLS (UNCHANGED VISUAL)
    // =====================================================
    draw_text(20, 20, "CONTROLS");

    draw_text(20, 40, "* Left Click Roll = Select");
    draw_text(20, 60, "* Left Click Attribute = Assign/Remove");
    draw_text(20, 80, "* R = Reroll");
    draw_text(20, 100, "* Z = Undo");
    draw_text(20, 120, "* A = Auto Assign");

    // =====================================================
    // CONFIRM BUTTON (SINGLE SYSTEM ONLY)
    // =====================================================
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
}