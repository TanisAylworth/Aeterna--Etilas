
function attribute_step_draw(cc)
{
    if (!is_struct(cc)) exit;

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

    // =====================================================
    // INPUT / SCREEN
    // =====================================================
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var screen_w = display_get_gui_width();

    // =====================================================
    // SHARED LAYOUT
    // =====================================================
    var cols = 2;

    var attr_w = 200;
    var attr_h = 20;

    var col_spacing = 80;
    var row_spacing = 90;

    var attr_count = array_length(global.ATTRIBUTES);

    var total_attr_w = cols * attr_w + (cols - 1) * col_spacing;

    var attr_start_x = (screen_w - total_attr_w) / 2;
    var attr_y = 220;

    var bonus_x = attr_start_x + total_attr_w + 120;
    var bonus_y = attr_y;

    // =====================================================
    // ROLL POOL
    // =====================================================
    var roll_pool = cc.roll_pool;
    var roll_count = array_length(roll_pool);

    var roll_w = 60;
    var roll_h = 20;
    var roll_spacing = 10;

    var roll_total_w =
        roll_count * roll_w +
        (roll_count - 1) * roll_spacing;

    var roll_start_x = (screen_w - roll_total_w) / 2;
    var roll_y = 80;

    draw_set_halign(fa_center);

    draw_text_colour(
        roll_start_x + roll_total_w * 0.5,
        roll_y - 30,
        "ROLL POOL",
        c_white,c_white,c_white,c_white,1
    );

    draw_set_halign(fa_left);

    for (var i = 0; i < roll_count; i++)
    {
        var x1 = roll_start_x + i * (roll_w + roll_spacing);
        var y1 = roll_y;

        var x2 = x1 + roll_w;
        var y2 = y1 + roll_h;

        var hover =
            point_in_rectangle(mx, my, x1, y1, x2, y2);

        if (cc.selected_roll_index == i)
            draw_set_color(c_yellow);
        else if (hover)
            draw_set_color(c_ltgray);
        else
            draw_set_color(c_white);

        draw_rectangle(x1, y1, x2, y2, false);

        draw_set_color(c_black);

        draw_text(x1 + 5, y1 + 2, string(roll_pool[i]));
    }

    // =====================================================
    // ATTRIBUTES
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

        // =================================================
        // VALUES
        // =================================================
        var base = 0;

        if (!is_undefined(cc.assigned[$ attr]))
        {
            var val = cc.assigned[$ attr];

            if (!is_undefined(val))
                base = val;
        }

        var species_bonus = 0;

        if (!is_undefined(cc.locked_species))
        {
            var sp = cc.locked_species;

            if (variable_struct_exists(global.species_data, sp))
            {
                var data = global.species_data[$ sp];

                if (variable_struct_exists(data, "stats"))
                if (variable_struct_exists(data.stats, "attributes"))
                {
                    var attrs = data.stats.attributes;

                    if (variable_struct_exists(attrs, attr))
                        species_bonus = attrs[$ attr];
                    else if (variable_struct_exists(attrs, string_lower(attr)))
                        species_bonus = attrs[$ string_lower(attr)];
                }
            }
        }

        var choice_bonus = 0;

        if (variable_struct_exists(cc.species_bonus_map, attr))
            choice_bonus = 1;

        var final_val = base + species_bonus + choice_bonus;

        // =================================================
        // UI STATE
        // =================================================
        var hover =
            point_in_rectangle(mx, my, x1, y1, x2, y2);

        var is_assigned =
            !is_undefined(cc.assigned[$ attr])
            && !is_undefined(cc.assigned[$ attr]);

        var has_bonus =
            variable_struct_exists(cc.species_bonus_map, attr);

        if (hover)
        {
            if (is_assigned && has_bonus)
                draw_set_color(make_color_rgb(120,255,120));
            else if (is_assigned)
                draw_set_color(c_ltgray);
            else if (has_bonus)
                draw_set_color(c_aqua);
            else
                draw_set_color(c_yellow);
        }
        else
        {
            if (is_assigned)
                draw_set_color(c_green);
            else if (has_bonus)
                draw_set_color(c_aqua);
            else
                draw_set_color(c_white);
        }

        draw_rectangle(x1, y1, x2, y2, false);

        draw_set_color(c_black);

        draw_text(
            x1 + 5,
            y1 + 2,
            attr + ": " + string(final_val)
        );

        // =================================================
        // CHARACTERISTICS
        // =================================================
        if (variable_struct_exists(global.attribute_data, attr))
        {
            var effects =
                global.attribute_data[$ attr](final_val);

            var yy = y1 + 18;

            for (var j = 0; j < array_length(effects); j++)
            {
                draw_text_colour(
                    x1 + 5,
                    yy + j * 14,
                    effects[j],
                    c_white,c_white,c_white,c_white,1
                );
            }
        }
    }

    // =====================================================
    // SPECIES BONUSES
    // =====================================================
    draw_text_colour(
        bonus_x,
        bonus_y - 40,
        "SPECIES BONUSES",
        c_white,c_white,c_white,c_white,1
    );

    var sp = cc.locked_species;

    if (is_undefined(sp)
    || !variable_struct_exists(global.species_data, sp))
    {
        draw_text(bonus_x, bonus_y, "No species selected");
        exit;
    }

    draw_text_colour(
        bonus_x,
        bonus_y,
        "Remaining Choices: "
        + string(cc.species_bonus_remaining),
        c_white,c_white,c_white,c_white,1
    );

    for (var i = 0; i < attr_count; i++)
    {
        var attr = global.ATTRIBUTES[i];

        var yy = bonus_y + 30 + i * 20;

        var selected =
            variable_struct_exists(cc.species_bonus_map, attr);

        var hover =
            point_in_rectangle(
                mx, my,
                bonus_x, yy,
                bonus_x + 200, yy + 18
            );

        if (selected)
            draw_set_color(c_green);
        else if (hover && cc.species_bonus_remaining > 0)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);

        draw_text(bonus_x, yy, attr);

        draw_text(
            bonus_x + 140,
            yy,
            selected ? "-" : "+"
        );
    }

    // =====================================================
    // CONTROLS PANEL
    // =====================================================
    var box_x = 20;
    var box_y = 20;

    var box_w = 380;
    var box_h = 180;

    draw_set_color(make_color_rgb(20,20,20));

    draw_rectangle(
        box_x,
        box_y,
        box_x + box_w,
        box_y + box_h,
        false
    );

    draw_set_color(c_white);

    draw_rectangle(
        box_x,
        box_y,
        box_x + box_w,
        box_y + box_h,
        true
    );

    draw_text(box_x + 10, box_y + 10, "CONTROLS");

    draw_text(box_x + 10, box_y + 35,
        "* Left Click Roll = Select");

    draw_text(box_x + 10, box_y + 55,
        "* Left Click Attribute = Assign/Remove");

    draw_text(box_x + 10, box_y + 75,
        "* Left Click Species Bonus = Add/Subtract");

    draw_text(box_x + 10, box_y + 95,
        "* R = Reroll All");

    draw_text(box_x + 10, box_y + 115,
        "* Z = Undo Last Attribute Input");

    draw_text(box_x + 10, box_y + 135,
        "* Must keep all attributes > 0");
		
		
		
		// =====================================================
// CONFIRM BUTTON
// =====================================================

var btn_w = 220;
var btn_h = 40;

var btn_x = screen_w * 0.5 - btn_w * 0.5;
var btn_y = display_get_gui_height() - 160;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var hover =
    point_in_rectangle(
        mx, my,
        btn_x, btn_y,
        btn_x + btn_w,
        btn_y + btn_h
    );

// validation
var ready = true;

// all attributes assigned
for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
{
    var attr = global.ATTRIBUTES[i];

    if (is_undefined(cc.assigned[$ attr]))
    {
        ready = false;
        break;
    }
}

// roll pool empty
if (array_length(cc.roll_pool) > 0)
    ready = false;

// optional species bonus requirement
if (cc.species_bonus_remaining > 0)
    ready = false;

// draw state
if (!ready)
    draw_set_color(c_dkgray);
else if (hover)
    draw_set_color(c_yellow);
else
    draw_set_color(c_green);

draw_rectangle(
    btn_x,
    btn_y,
    btn_x + btn_w,
    btn_y + btn_h,
    false
);

draw_set_color(c_black);

draw_set_halign(fa_center);

draw_text(
    btn_x + btn_w * 0.5,
    btn_y + 10,
    "CONFIRM ATTRIBUTES"
);

draw_set_halign(fa_left);
		
		
}

