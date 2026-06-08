function draw_species_select(step)
{
    // =====================================================
    // GUI BASE
    // =====================================================
    var vw = display_get_gui_width();
    var vh = display_get_gui_height();

    var panel_w = 420;
    var panel_x = vw - panel_w;
    var panel_y = 0;

    draw_set_color(make_color_rgb(20, 20, 20));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + vh, false);

    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + vh, true);

	
	// =====================================================
	// SPECIES CONTROLS HELP PANEL
	// =====================================================

	var sc_box_x = 20;
	var sc_box_y = 20; // place under attribute controls or adjust as needed

	var sc_box_w = 380;
	var sc_box_h = 120;

	draw_set_color(c_black);
	draw_rectangle(sc_box_x, sc_box_y, sc_box_x + sc_box_w, sc_box_y + sc_box_h, false);

	draw_set_color(c_white);
	draw_rectangle(sc_box_x, sc_box_y, sc_box_x + sc_box_w, sc_box_y + sc_box_h, true);

	// Title
	draw_text(sc_box_x + 10, sc_box_y + 10, "SPECIES CONTROLS");

	// Instructions
	draw_text(sc_box_x + 10, sc_box_y + 35, "• Left Click Species = Select / Lock");
	draw_text(sc_box_x + 10, sc_box_y + 55, "• Hover To View Summary");
    // =====================================================
    // SPECIES LIST LAYOUT
    // =====================================================
    var box_w = 200;
    var box_h = 30;
    var spacing = 10;

    var count = array_length(global.species_list);

    var total_h = count * box_h + (count - 1) * spacing;

    var list_x = (vw - box_w) * 0.5;
    var start_y = (vh - total_h) * 0.5;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // LOCAL HOVER ONLY (DO NOT MAKE GLOBAL)
    var hovered_species = undefined;

    // =====================================================
    // LEFT LIST (SELECTABLE SPECIES)
    // =====================================================
    for (var i = 0; i < count; i++)
    {
        var species_id = global.species_list[i];
        var sp = global.species_data[$ species_id];

        var yy = start_y + i * (box_h + spacing);

        var is_hovered = point_in_rectangle(
            mx, my,
            list_x, yy,
            list_x + box_w, yy + box_h
        );

        if (is_hovered)
        {
            hovered_species = species_id;
			
            // LEFT CLICK = LOCK SELECTION
            if (mouse_check_button_pressed(mb_left))
            {
                var cc = global.char_creation;

				cc.locked_species = species_id;

				cc.species_bonus_map = {};
				cc.species_bonus_remaining = 0;

				var data = global.species_data[$ species_id];
				var adj = data.creation.attribute_adjustments;

				if (variable_struct_exists(adj, "choices"))
				{
				    cc.species_bonus_remaining = adj.choices;
				}
				
				
            }
        }

        // =====================================
// VISUAL STATE
// =====================================

var is_selected =
    (global.char_creation.locked_species == species_id);

// BORDER COLOR
if (is_selected)
{
    draw_set_color(c_green);
}
else if (is_hovered)
{
    draw_set_color(c_yellow);
}
else
{
    draw_set_color(c_white);
}

// OUTLINE
draw_rectangle(
    list_x,
    yy,
    list_x + box_w,
    yy + box_h,
    false
);

// FILL
if (is_selected)
{
    draw_set_color(make_color_rgb(40,120,40));
}
else
{
    draw_set_color(c_black);
}

draw_rectangle(
    list_x,
    yy,
    list_x + box_w,
    yy + box_h,
    true
);

// TEXT
draw_set_color(c_black);

draw_text(
    list_x + 10,
    yy + 6,
    sp.name
);
    }

    // RIGHT CLICK = UNLOCK
    if (mouse_check_button_pressed(mb_right))
    {
        global.char_creation.locked_species = undefined;
    }

    // =====================================================
// SELECTION RESOLUTION (FIXED)
// =====================================================

var selected_id = global.char_creation.locked_species;

// fallback to hover (hovered_species is already an ID string)
if (selected_id == undefined && hovered_species != undefined)
{
    selected_id = hovered_species;
}

// convert ID → STRUCT safely
var selected = undefined;

if (selected_id != undefined)
{
    if (variable_struct_exists(global.species_data, selected_id))
    {
        selected = global.species_data[$ selected_id];
    }
}

    // =====================================================
    // RIGHT PANEL BASE
    // =====================================================
    var tx = panel_x + 16;
    var ty = panel_y + 16;
    var line = 18;

    draw_set_color(c_white);

    if (selected == undefined)
    {
        draw_text(tx, ty, "No species selected");
        return;
    }

    // =====================================================
	// BASIC INFO
	// =====================================================

	// NAME
	draw_set_color(c_white);
	draw_text(tx, ty, selected.name);

	ty += 28;

	// DESCRIPTION
	draw_text_ext(
	    tx,
	    ty,
	    selected.description,
	    line,
	    panel_w - 32
	);

	// advance properly after wrapped text
	ty += string_height_ext(
	    selected.description,
	    line,
	    panel_w - 32
	) + 20;

    var cdt_y = ty;

	draw_text(tx, cdt_y, "CDT: " + string(selected.stats.cdt));

	if (point_in_rectangle(mx, my, tx, cdt_y, tx + 200, cdt_y + 18))
	{
	    set_tooltip("Critical Damage Threshold: The amount of damage required in a single hit to sustain a Critical Wound.", mx + 16, my + 16);
	}

	ty += line * 2;

    // =====================================================
    // DEBUG (OPTIONAL - REMOVE LATER)
    // =====================================================
    // show_debug_message("SELECTED: " + string(selected.name));

    // =====================================================
    // SECTION RENDERING
    // =====================================================
    var header_h = 18;

// =========================
// ATTRIBUTE ADJUSTMENTS
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Attribute Adjustments");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Species attribute modifiers or allocation rules.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "Attribute Adjustments", selected.creation.attribute_adjustments);

// =========================
// TABLES
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Tables");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Determines available knowledge categories.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "", selected.creation.knowledge_tables);

// =========================
// SKILLS
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Skills");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Core skill selection pool.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "", selected.creation.knowledge_skills);

// =========================
// TALENTS
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Talents");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Passive or special character talents.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "", selected.creation.knowledge_talents);

// =========================
// ABILITIES
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Abilities");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Active or innate abilities.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "", selected.stats.abilities);

// =========================
// NEGATIVES
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Negatives");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Penalties or drawbacks applied to the character.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "", selected.stats.negatives);

// =========================
// HIT LOCATIONS
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Hit Locations");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Defines body targeting and damage distribution.", mx + 16, my + 16);
}


ty = scr_ui_draw_section(tx, ty, "Hit Locations", selected.stats.hit_locations);

// =========================
// TRAITS
// =========================
draw_set_color(c_gray);
draw_text(tx, ty, "Traits");

if (point_in_rectangle(mx, my, tx, ty, tx + 200, ty + 18))
{
    set_tooltip("Passive identity modifiers unique to the species.", mx + 16, my + 16);
}

ty = scr_ui_draw_section(tx, ty, "Traits", selected.stats.traits);





// =====================================================
// CONFIRM BUTTON
// =====================================================

if (global.char_creation.locked_species != undefined)
{
    var btn_w = 260;
    var btn_h = 60;

    var btn_x = (vw - btn_w) * 0.5;
    var btn_y = vh - 100;

    var hovering = point_in_rectangle(
        mx, my,
        btn_x, btn_y,
        btn_x + btn_w,
        btn_y + btn_h
    );

    draw_set_color(hovering ? c_lime : c_green);

    draw_rectangle(
        btn_x,
        btn_y,
        btn_x + btn_w,
        btn_y + btn_h,
        false
    );

    draw_set_color(c_white);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        btn_x + btn_w * 0.5,
        btn_y + btn_h * 0.5,
        "CONFIRM SPECIES"
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


}







