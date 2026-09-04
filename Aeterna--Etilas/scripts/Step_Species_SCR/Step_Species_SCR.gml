function species_step_update(step)
{
    var cc = global.char_creation;
    
    if (briefing_update(cc))
        return;
    
	 if (!variable_global_exists("SKILL_SIMPLE"))      skill_constants_init();
    if (!variable_global_exists("skill_data"))        skills_data();
    talent_data();
	ability_data();
	negative_data();
	
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var vw = display_get_gui_width();
    var vh = display_get_gui_height();
    
    // =====================================================
    // LAYOUT — MUST MATCH draw_species_select
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
    
    // Hotkey
    if (keyboard_check_pressed(ord("A")))
        species_random_select(cc);
    
    // =====================================================
    // LEFT CLICK — select / lock species
    // =====================================================
    if (mouse_check_button_pressed(mb_left))
    {
        for (var i = 0; i < species_count; i++)
        {
            var species_id = global.species_list[i];
            var col = i div rows_per_col;
            var row = i mod rows_per_col;
            var xx = list_x + (col * col_width);
            var yy = start_y + (row * (box_h + spacing));
            
            if (point_in_rectangle(mx, my, xx, yy, xx + box_w, yy + box_h))
            {
                cc.locked_species = species_id;
                cc.species_bonus_map = {};
                cc.species_bonus_remaining = 0;
                
                var data = global.species_data[$ species_id];
                if (variable_struct_exists(data, "creation")
                    && variable_struct_exists(data.creation, "attribute_adjustments"))
                {
                    var adj = data.creation.attribute_adjustments;
                    if (variable_struct_exists(adj, "choices"))
                        cc.species_bonus_remaining = adj.choices;
                }
                
                show_debug_message("Species locked: " + species_id);
                break;
            }
        }
        
        // Confirm button (same as Draw)
        if (cc.locked_species != undefined)
        {
            var btn_w = 260;
            var btn_h = 60;
            var btn_x = (vw - btn_w) * 0.5;
            var btn_y = vh - 100;
            
            if (point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h))
            {
                cc.confirmed_species = cc.locked_species;
                cc.species = cc.locked_species;
                go_to_next_step(cc);
                return;
            }
        }
    }
    
    // =====================================================
    // RIGHT CLICK — unlock
    // =====================================================
    if (mouse_check_button_pressed(mb_right))
        cc.locked_species = undefined;
}