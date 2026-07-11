
function attribute_step_draw(cc)
{
	
	show_debug_message("Current locked species: " + string(cc.locked_species));
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
        L.top_y - 50,
        "ATTRIBUTES",
        c_white, c_white, c_white, c_white, 1
    );
    draw_set_halign(fa_left);

    for (var i = 0; i < attr_count; i++)
    {
        var attr = global.ATTRIBUTES[i];
        var r = get_attribute_rect(i);
        var x1 = r.x;
        var y1 = r.y;
        var x2 = r.x + r.w;
        var y2 = r.y + r.h;

        var base = is_real(cc.assigned[$ attr]) ? cc.assigned[$ attr] : 0;
        var species_bonus = 0;
        var choice_bonus = variable_struct_exists(cc.species_bonus_map, attr) ? 1 : 0;

                // === SPECIES BONUS ===
        var species_bonus = 0;
        var sp = cc.locked_species;
        if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
        {
            var data = global.species_data[$ sp];
            if (variable_struct_exists(data, "stats") && variable_struct_exists(data.stats, "attributes"))
            {
                var attrs = data.stats.attributes;
                
                show_debug_message("Species: " + sp + " | Looking for: " + attr);
                show_debug_message("Available attributes: " + string(variable_struct_get_names(attrs)));
                
                if (variable_struct_exists(attrs, attr))
                {
                    species_bonus = attrs[$ attr];
                    show_debug_message("Found exact match: " + string(species_bonus));
                }
                else if (variable_struct_exists(attrs, string_lower(attr)))
                {
                    species_bonus = attrs[$ string_lower(attr)];
                    show_debug_message("Found lowercase match: " + string(species_bonus));
                }
                else
                {
                    show_debug_message("No match found for " + attr);
                }
            }
        }

        var final_val = base + species_bonus + choice_bonus;

        var hover = point_in_rectangle(mx, my, x1, y1, x2, y2);
        var is_assigned = is_real(cc.assigned[$ attr]);
        var has_species_bonus = species_bonus != 0;
        var has_choice_bonus = choice_bonus > 0;

        // Color logic
        if (hover)
            draw_set_color(c_yellow);
        else if (has_species_bonus || has_choice_bonus)
            draw_set_color(c_aqua);
        else if (is_assigned)
            draw_set_color(c_green);
        else
            draw_set_color(c_white);

        draw_rectangle(x1, y1, x2, y2, false);

        // Text
        draw_set_color(c_black);
        draw_text(x1 + 5, y1 + 2, attr + ": " + string(final_val));

        // Derived effects
        draw_set_color(c_white);
        if (variable_struct_exists(global.attribute_data, attr))
        {
            var effects = global.attribute_data[$ attr](final_val);
            for (var j = 0; j < array_length(effects); j++)
            {
                draw_text(x1 + 5, y1 + 25 + j * 25, effects[j]);
            }
        }
    }

   // =====================================================
// SPECIES BONUS PANEL
// =====================================================



var panel_w = 220;
var panel_h = 280;

// Background
draw_set_color(c_black);

draw_rectangle(
    bonus_x - 10,
    bonus_y - 10,
    bonus_x + panel_w,
    bonus_y + panel_h,
    false
);

// Border
draw_set_color(c_white);

draw_rectangle(
    bonus_x - 10,
    bonus_y - 10,
    bonus_x + panel_w,
    bonus_y + panel_h,
    true
);

// Header
draw_set_color(c_white);

draw_text(
    bonus_x,
    bonus_y,
    "SPECIES BONUSES"
);

draw_text(
    bonus_x,
    bonus_y + 20,
    "Remaining: " + string(cc.species_bonus_remaining)
);

// Attribute choices
for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
{
    var attr = global.ATTRIBUTES[i];

    var yy = bonus_y + 50 + i * 20;

    var selected =
        variable_struct_exists(
            cc.species_bonus_map,
            attr
        );

    var hover =
        point_in_rectangle(
            mx, my,
            bonus_x,
            yy,
            bonus_x + 180,
            yy + 18
        );

    if (selected)
        draw_set_color(c_lime);
    else if (hover && cc.species_bonus_remaining > 0)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);

    draw_text(
        bonus_x,
        yy,
        attr
    );

    draw_text(
        bonus_x + 150,
        yy,
        selected ? "-" : "+"
    );
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