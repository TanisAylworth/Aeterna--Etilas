function draw_species_select(step)
{
    var vw = display_get_gui_width();
    var vh = display_get_gui_height();
    var panel_w = 420;
    var panel_x = vw - panel_w;
    var panel_y = 0;
	
	

    draw_set_color(make_color_rgb(20, 20, 20));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + vh, false);
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + vh, true);

    // Help panel
    var sc_box_x = 20;
    var sc_box_y = 20;
    var sc_box_w = 380;
    var sc_box_h = 120;
    draw_set_color(c_black);
    draw_rectangle(sc_box_x, sc_box_y, sc_box_x + sc_box_w, sc_box_y + sc_box_h, false);
    draw_set_color(c_white);
    draw_rectangle(sc_box_x, sc_box_y, sc_box_x + sc_box_w, sc_box_y + sc_box_h, true);
    draw_text(sc_box_x + 10, sc_box_y + 10, "SPECIES CONTROLS");
    draw_text(sc_box_x + 10, sc_box_y + 35, "• Left Click Species = Select / Lock");
    draw_text(sc_box_x + 10, sc_box_y + 55, "• Hover To View Summary");

    // =====================================================
    // SPECIES LIST - EVEN COLUMNS
    // =====================================================
    var box_w = 220;
    var box_h = 35;
    var spacing = 8;
    var max_rows_per_col = 12;
    var col_width = box_w + 30;

    var species_count = array_length(global.species_list);
    var num_cols = ceil(species_count / max_rows_per_col);
    var rows_per_col = ceil(species_count / num_cols);

    var list_x = (vw - (num_cols * col_width)) * 0.5;
    var start_y = 180;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var hovered_species = undefined;

    for (var i = 0; i < species_count; i++)
    {
        var species_id = global.species_list[i];
        var sp = global.species_data[$ species_id];

        var col = i div rows_per_col;
        var row = i mod rows_per_col;

        var xx = list_x + (col * col_width);
        var yy = start_y + (row * (box_h + spacing));

                var is_hovered = point_in_rectangle(mx, my, xx, yy, xx + box_w, yy + box_h);

        if (is_hovered)
        {
            hovered_species = species_id;

            if (mouse_check_button_pressed(mb_left))
            {
                var cc = global.char_creation;
                cc.locked_species = species_id;
                cc.species_bonus_map = {};
                cc.species_bonus_remaining = 0;

                var data = global.species_data[$ species_id];
                if (variable_struct_exists(data, "creation") && variable_struct_exists(data.creation, "attribute_adjustments"))
                {
                    var adj = data.creation.attribute_adjustments;
                    if (variable_struct_exists(adj, "choices"))
                    {
                        cc.species_bonus_remaining = adj.choices;
                    }
                }

                show_debug_message("Species locked: " + species_id);
            }
        }

        var is_selected = (global.char_creation.locked_species == species_id);

        // Border / Trim
        if (is_selected)
            draw_set_color(c_green);
        else if (is_hovered)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);

        draw_rectangle(xx, yy, xx + box_w, yy + box_h, true);  // White trim

        // Fill (Black)
        draw_set_color(c_black);
        draw_rectangle(xx + 1, yy + 1, xx + box_w - 1, yy + box_h - 1, false);

        // Text (White)
        draw_set_color(c_white);
        draw_text(xx + 10, yy + 8, sp.name);
    }

    // Right-click to unlock
    if (mouse_check_button_pressed(mb_right))
        global.char_creation.locked_species = undefined;

    // =====================================================
    // RIGHT PANEL (YOUR ORIGINAL CODE)
    // =====================================================
    var tx = panel_x + 16;
    var ty = panel_y + 16;
    var line = 18;
    draw_set_color(c_white);

    var selected_id = global.char_creation.locked_species;
    if (selected_id == undefined && hovered_species != undefined)
        selected_id = hovered_species;

    var selected = undefined;
    if (selected_id != undefined && variable_struct_exists(global.species_data, selected_id))
        selected = global.species_data[$ selected_id];

    if (selected == undefined)
    {
        draw_text(tx, ty, "No species selected");
        return;
    }

    // BASIC INFO
    draw_text(tx, ty, selected.name);
    ty += 28;

    draw_text_ext(tx, ty, selected.description, line, panel_w - 32);
    ty += string_height_ext(selected.description, line, panel_w - 32) + 20;

    var cdt_y = ty;
    draw_text(tx, cdt_y, "CDT: " + string(selected.stats.cdt));
    if (point_in_rectangle(mx, my, tx, cdt_y, tx + 200, cdt_y + 18))
        set_tooltip("Critical Damage Threshold: The amount of damage required in a single hit to sustain a Critical Wound.", mx + 16, my + 16);

    ty += line * 2;

    // Sections (your original calls)
    ty = scr_ui_draw_section(tx, ty, "Attribute Adjustments", selected.creation.attribute_adjustments);
    ty = scr_ui_draw_section(tx, ty, "Tables", selected.creation.knowledge_tables);
    ty = scr_ui_draw_section(tx, ty, "Skills", selected.creation.knowledge_skills);
    ty = scr_ui_draw_section(tx, ty, "Talents", selected.creation.knowledge_talents);
    ty = scr_ui_draw_section(tx, ty, "Abilities", selected.stats.abilities);
	ty = scr_ui_draw_section(tx, ty, "Negatives", selected.stats.negatives);
    ty = scr_ui_draw_section(tx, ty, "Hit Locations", selected.stats.hit_locations);
    ty = scr_ui_draw_section(tx, ty, "Traits", selected.stats.traits);

    // Confirm Button (your original)
    if (global.char_creation.locked_species != undefined)
    {
        var btn_w = 260;
        var btn_h = 60;
        var btn_x = (vw - btn_w) * 0.5;
        var btn_y = vh - 100;
        var hovering = point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h);

        draw_set_color(hovering ? c_lime : c_green);
        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "CONFIRM SPECIES");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
	
	
	
	
	
	
	
}