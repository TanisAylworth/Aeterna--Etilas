function handle_specialization_popup(cc, L, mx, my, clicked)
{
    if (!clicked) return false;

    var popup_w = 360;
    var popup_x = L.center_x - popup_w * 0.5;
    var popup_y = 160;

    for (var i = 0; i < array_length(cc.pending_specializations); i++)
    {
        var row_y = popup_y + 75 + (i * 42);
       
        if (point_in_rectangle(mx, my, popup_x + 20, row_y - 8, popup_x + popup_w - 20, row_y + 28))
        {
            var base_skill = string_replace_all(cc.pending_skill, " (X)", "");
            var spec = cc.pending_specializations[i];
            var full_skill_name = base_skill + " (" + spec + ")";

            // Check if already exists
            if (variable_struct_exists(cc.skill_ranks, full_skill_name))
            {
                cc.specialization_popup = false;
                cc.pending_skill = "";
                cc.pending_specializations = [];
                return true;
            }

            // === CONSUME FREE SLOT ONLY WHEN CHOOSING THE SPEC ===
            var consumed_free_slot = false;
            if (variable_struct_exists(cc, "locked_species"))
            {
                var species = global.species_data[$ cc.locked_species];
                if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
                {
                    var remaining = species.creation.knowledge_skills.choices.count;
                    if (remaining > 0)
                    {
                        species.creation.knowledge_skills.choices.count--;
                        consumed_free_slot = true;
                        
                        // Track this specialization as a free slot skill
                        if (!variable_struct_exists(cc.free_slot_ranks, full_skill_name))
                            cc.free_slot_ranks[$ full_skill_name] = 0;
                        cc.free_slot_ranks[$ full_skill_name]++;
                    }
                }
            }

            // If no free slot was used, charge normal points
            if (!consumed_free_slot)
            {
                var owns_table = table_is_owned(cc, cc.selected_table);
                var cost = owns_table ? 1 : 2;
                if (cc.generation_slots_remaining >= cost)
                    cc.generation_slots_remaining -= cost;
            }

            set_skill_rank(cc, full_skill_name, 1);
            
            // Cleanup
            cc.specialization_popup = false;
            cc.pending_skill = "";
            cc.pending_specializations = [];
            return true;
        }
    }
    return false;
}

function handle_cdt_gold_controls(cc, L, mx, my, clicked)
{
    var btn_y = L.top_y + 55;
    var half_w = L.panel_w * 0.5;

    // CDT
    var cdt_x = L.center_x - L.panel_spacing;
    cc.generation_hover.cdt_minus = point_in_rectangle(mx, my, cdt_x - half_w, btn_y, cdt_x - L.btn_gap, btn_y + L.btn_h);
    cc.generation_hover.cdt_plus  = point_in_rectangle(mx, my, cdt_x + L.btn_gap, btn_y, cdt_x + half_w, btn_y + L.btn_h);

    // Gold
    var gold_x = L.center_x + L.panel_spacing;
    cc.generation_hover.gold_minus = point_in_rectangle(mx, my, gold_x - half_w, btn_y, gold_x - L.btn_gap, btn_y + L.btn_h);
    cc.generation_hover.gold_plus  = point_in_rectangle(mx, my, gold_x + L.btn_gap, btn_y, gold_x + half_w, btn_y + L.btn_h);

    if (!clicked) return;

    // CDT logic
    if (cc.generation_hover.cdt_minus && cc.generation.cdt_bonus > 0)
    {
        cc.generation.cdt_bonus--;
        cc.generation_slots_remaining++;
    }
    if (cc.generation_hover.cdt_plus && cc.generation_slots_remaining > 0)
    {
        var current_cdt = get_current_cdt(cc); // assume you have or can make this
        if (current_cdt + 1 <= get_cdt_cap(cc))
        {
            cc.generation.cdt_bonus++;
            cc.generation_slots_remaining--;
        }
    }

    // Gold logic
    if (cc.generation_hover.gold_minus && cc.generation.gold_bonus > 0)
    {
        cc.generation.gold_bonus -= 20;
        cc.generation_slots_remaining++;
    }
    if (cc.generation_hover.gold_plus && cc.generation_slots_remaining > 0)
    {
        cc.generation.gold_bonus += 20;
        cc.generation_slots_remaining--;
    }
}

function handle_table_list(cc, L, mx, my, clicked, tables_x = undefined)
{
    if (tables_x == undefined)
        {tables_x = L.center_x - 280 - 40 - 200;} // Match your draw function offset


    var start_y = 400; 
    var tables = get_all_knowledge_tables();

    // Confirm / Lock Button
    var confirm_x = tables_x - 120;
    var confirm_y = start_y + (array_length(tables) * 36) + 5;
    var confirm_w = 240, confirm_h = 30;

    if (clicked && point_in_rectangle(mx, my, confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h))
    {
        cc.generation.tables_locked = !cc.generation.tables_locked;
        if (cc.generation.tables_locked)
            cc.selected_table = "";
        return;
    }

    // Only allow purchasing when NOT locked
    if (cc.generation.tables_locked)
    {
        handle_locked_table_selection(cc, L, mx, my, clicked);
        return;
    }

    // Purchasing logic (when unlocked)
    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_x = tables_x - 120;
        var btn_y = start_y + (i * 36);
        var btn_w = 240, btn_h = 30;

        if (!point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h))
            continue;

        if (clicked)
            handle_table_click(cc, table);
        else
            cc.hovered_table = table;

        break;
    }
}

function handle_table_click(cc, table)
{
    // Fixed = do nothing
    if (array_index_of(cc.generation.fixed_tables, table) != -1) return;

    var choice_idx = array_index_of(cc.generation.choice_tables, table);
    var purch_idx = array_index_of(cc.generation.purchased_tables, table);

    if (choice_idx != -1)
    {
        array_delete(cc.generation.choice_tables, choice_idx, 1);
        cc.generation.table_choices_remaining++;
        return;
    }

    if (purch_idx != -1)
    {
        refund_table_skills(cc, table);
        array_delete(cc.generation.purchased_tables, purch_idx, 1);
        cc.generation_slots_remaining += 2;
        return;
    }

    // Buy / Choose
    if (cc.generation.table_choices_remaining > 0)
    {
        array_push(cc.generation.choice_tables, table);
        cc.generation.table_choices_remaining--;
    }
    else if (cc.generation_slots_remaining >= 2)
    {
        array_push(cc.generation.purchased_tables, table);
        refund_table_skill_discount(cc, table); // if this gives discount
        cc.generation_slots_remaining -= 2;
    }
}

function handle_skill_list(cc, L, mx, my, clicked, right_clicked)
{
    if (cc.selected_table == "" || !cc.generation.tables_locked)
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];
    var display_y = 370;
    var row_h = 25;
    var col_width = 260;
    var max_rows_per_col = 18;

    var all_entries = [];
    var seen = {};

    // Build the same list as drawing
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species, "creation") && variable_struct_exists(species.creation, "fixed_skills"))
        {
            var fixed = species.creation.fixed_skills;
            for (var i = 0; i < array_length(fixed); i++)
            {
                var f = fixed[i];
                if (!variable_struct_exists(seen, f.name))
                {
                    array_push(all_entries, { name: f.name, rank: f.rank, is_fixed: true });
                    seen[$ f.name] = true;
                }
            }
        }
    }

    for (var i = 0; i < array_length(table_data.skills); i++)
    {
        var skill_name = table_data.skills[i];
        if (!variable_struct_exists(seen, skill_name))
        {
            array_push(all_entries, { name: skill_name, is_specialization: false });
            seen[$ skill_name] = true;
        }
        var base_skill = string_replace_all(skill_name, " (X)", "");
        var keys = variable_struct_get_names(cc.skill_ranks);
        for (var k = 0; k < array_length(keys); k++)
        {
            var key = keys[k];
            if (string_pos(base_skill, key) > 0 && !variable_struct_exists(seen, key))
            {
                array_push(all_entries, { name: key, is_specialization: true });
                seen[$ key] = true;
            }
        }
    }

    // Hit detection
    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;
      
        var draw_x = (L.center_x - 210) + (col * col_width);
        var draw_y = display_y + (row * row_h);

        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + 230, draw_y + 22))
        {
			cc.hovered_skill = entry.name;
            if (clicked)
            {
                if (entry.is_specialization)
                {
                    attempt_skill_rank_up(cc, entry.name, "", cc.selected_table);
                }
                else
                {
                    // Improved lookup
                    var skill_data = global.skill_data[$ entry.name];
                    if (!skill_data)
                        skill_data = global.skill_data[$ string_replace_all(entry.name, " (X)", "")];

                    if (skill_data && variable_struct_exists(skill_data, "specialization") && skill_data.specialization.required)
                    {
                        // ONLY OPEN POPUP — DO NOT CONSUME FREE SLOT HERE
                        cc.pending_skill = entry.name;
                        cc.pending_specializations = skill_data.specialization.choices;
                        cc.specialization_popup = true;
                        show_debug_message("OPENING SPECIALIZATION POPUP for: " + entry.name);
                    }
                    else
                    {
                        attempt_skill_rank_up(cc, entry.name, string_replace_all(entry.name, " (X)", ""), cc.selected_table);
                    }
                }
            }
            else if (right_clicked)
                attempt_skill_rank_down(cc, entry.name);
            return;
        }
    }
}

// ===================================================================
function attempt_skill_rank_up(cc, skill_key, base_skill, table)
{
    var current_rank = get_skill_rank(cc, skill_key);

    // === FREE SKILL SLOTS FIRST ===
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
        {
            var remaining = species.creation.knowledge_skills.choices.count;
            if (remaining > 0)
            {
                // Check if this is a specialization base skill
                var lookup = string_replace_all(skill_key, " (X)", "");
                var skill_data = global.skill_data[$ skill_key] || global.skill_data[$ lookup];

                if (skill_data && variable_struct_exists(skill_data, "specialization") && skill_data.specialization.required && current_rank == 0)
                {
                    // ONLY OPEN POPUP — DO NOT CONSUME FREE SLOT HERE
                    cc.pending_skill = skill_key;
                    cc.pending_specializations = skill_data.specialization.choices;
                    cc.specialization_popup = true;
                    show_debug_message("Opened specialization popup for: " + skill_key);
                    return;
                }

                // ================== NORMAL FREE SLOT USAGE ==================
                species.creation.knowledge_skills.choices.count--;
                
                // === ADD THIS BLOCK ===
                if (!variable_struct_exists(cc.free_slot_ranks, skill_key))
                    cc.free_slot_ranks[$ skill_key] = 0;
                cc.free_slot_ranks[$ skill_key]++;

                set_skill_rank(cc, skill_key, current_rank + 1);
              
                show_debug_message("Used free skill slot for: " + skill_key);
                return;
            }
        }
    }

    // Fall back to character points
    var owns_table = table_is_owned(cc, cc.selected_table);
    var cost = owns_table ? 1 : 2;
    if (cc.generation_slots_remaining < cost)
        return;

    cc.generation_slots_remaining -= cost;
    set_skill_rank(cc, skill_key, current_rank + 1);
}

// ===================================================================
function attempt_skill_rank_down(cc, skill_key)
{
    var current_rank = get_skill_rank(cc, skill_key);
    if (current_rank <= 0) return;

    var free_ranks = variable_struct_exists(cc.free_slot_ranks, skill_key) ? cc.free_slot_ranks[$ skill_key] : 0;

    if (current_rank > free_ranks)
    {
        // Refund character point rank first
        cc.generation_slots_remaining++;
    }
    else if (free_ranks > 0)
    {
        // Refund free slot rank last
        cc.free_slot_ranks[$ skill_key]--;
        if (cc.free_slot_ranks[$ skill_key] <= 0)
            variable_struct_remove(cc.free_slot_ranks, skill_key);

        // Refund free slot back to the pool
        if (variable_struct_exists(cc, "locked_species"))
        {
            var species = global.species_data[$ cc.locked_species];
            if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
            {
                species.creation.knowledge_skills.choices.count++;
            }
        }
    }

    set_skill_rank(cc, skill_key, current_rank - 1);
}

// ===================================================================
function table_is_owned(cc, table_name)
{
    return array_contains(cc.generation.fixed_tables, table_name) ||
           array_contains(cc.generation.choice_tables, table_name) ||
           array_contains(cc.generation.purchased_tables, table_name);
}


function draw_cdt_gold_panels(cc, L)
{
    var title_y = L.top_y;
    var cost_y = L.top_y + 22;
    var btn_y = L.top_y + 55;
    var value_y = L.top_y + 95;
    var half_w = L.panel_w * 0.5;

    draw_set_color(c_white);
    draw_set_halign(fa_center);

    // CDT Panel
    var cdt_x = L.center_x - L.panel_spacing;
    draw_text(cdt_x, title_y, "CDT");
    draw_text(cdt_x, cost_y, "Cost: 1 Slot → +1 CDT");

    draw_button_pair(cdt_x, btn_y, half_w, L.btn_gap, L.btn_h,
        cc.generation_hover.cdt_minus, cc.generation_hover.cdt_plus);

    draw_text(cdt_x, value_y, "Bonus: +" + string(cc.generation.cdt_bonus));
    draw_text(cdt_x, value_y + 40, "Current CDT: " + string(get_current_cdt(cc)));
    draw_text(cdt_x, value_y + 60, "Limit: " + string(get_cdt_cap(cc)));

    // GOLD Panel
    var gold_x = L.center_x + L.panel_spacing;
    draw_text(gold_x, title_y, "GOLD");
    draw_text(gold_x, cost_y, "Cost: 1 Slot → +20 Gold");

    draw_button_pair(gold_x, btn_y, half_w, L.btn_gap, L.btn_h,
        cc.generation_hover.gold_minus, cc.generation_hover.gold_plus);

    draw_text(gold_x, value_y, "Starting Gold: " + string(cc.generation.gold_bonus));
}

function draw_button_pair(x, y, half_w, gap, h, hover_minus, hover_plus)
{
    var left_l = x - half_w;
    var left_r = x - gap;
    var right_l = x + gap;
    var right_r = x + half_w;

    draw_set_color(hover_minus ? c_yellow : c_gray);
    draw_rectangle(left_l, y, left_r, y + h, false);
    draw_set_color(c_black);
    draw_text((left_l + left_r)/2, y + 7, "-");

    draw_set_color(hover_plus ? c_yellow : c_gray);
    draw_rectangle(right_l, y, right_r, y + h, false);
    draw_set_color(c_black);
    draw_text((right_l + right_r)/2, y + 7, "+");

    draw_set_color(c_white);   // ← Reset for safety
}



function draw_tables_column(cc, L, tables_x = undefined)
{
    if (tables_x == undefined)
        tables_x = L.center_x - 340;   // fallback

    var yy = 320;
   
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(tables_x, yy, "KNOWLEDGE TABLES");
   
    draw_set_halign(fa_left);
    draw_text(tables_x - 110, yy + 25, "Free Choices Remaining: " + string(cc.generation.table_choices_remaining));
    draw_text(tables_x - 110, yy + 45, "Extra Tables Cost 2 Slots");

    var tables = get_all_knowledge_tables();
    var start_y = yy + 80;
    var btn_w = 240;
    var btn_h = 30;

    // Confirm / Lock Button
    var confirm_x = tables_x - 120;
    var confirm_y = start_y + (array_length(tables) * 36) + 5;
    var confirm_w = 240;
    var confirm_h = 30;
   
    var confirm_hover = point_in_rectangle(
        device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
        confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h
    );

    var is_locked = false;
    if (variable_struct_exists(cc.generation, "tables_locked"))
        is_locked = cc.generation.tables_locked;

    draw_set_color(is_locked ? 
        (confirm_hover ? c_lime : c_green) : 
        (confirm_hover ? c_gray : c_dkgray));
   
    draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, false);
   
    draw_set_color(c_white);
    draw_text(confirm_x + 10, confirm_y + 7, 
        is_locked ? "UNLOCK TABLES" : "CONFIRM TABLES");

    // Table List
    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_x = tables_x - 120;
        var btn_y = start_y + (i * 36);

        var is_fixed     = array_index_of(cc.generation.fixed_tables, table) != -1;
        var is_choice    = array_index_of(cc.generation.choice_tables, table) != -1;
        var is_purchased = array_index_of(cc.generation.purchased_tables, table) != -1;
       
        var hovered = false;
        if (variable_struct_exists(cc, "hovered_table"))
            hovered = (cc.hovered_table == table);

        if (is_fixed)        draw_set_color(c_green);
        else if (is_choice)  draw_set_color(c_lime);
        else if (is_purchased) draw_set_color(c_olive);
        else if (hovered)    draw_set_color(c_gray);
        else                 draw_set_color(c_dkgray);

        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

        if (hovered)
        {
            draw_set_color(c_yellow);
            draw_rectangle(btn_x-2, btn_y-2, btn_x+btn_w+2, btn_y+btn_h+2, true);
        }

        draw_set_color(c_white);
        var suffix = is_fixed ? " (Fixed)" : 
                    (is_choice ? " (Choice)" : 
                    (is_purchased ? " (Purchased)" : ""));
        
        draw_text(btn_x + 8, btn_y + 7, table + suffix);
    }
}

// ===================================================================
function draw_skills_column(cc, L, skills_x = undefined)
{
    if (skills_x == undefined)
        skills_x = L.center_x;

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(skills_x, 320, "SKILLS");

    if (cc.selected_table == "" || !cc.generation.tables_locked)
    {
        draw_set_color(c_ltgray);
        draw_text(skills_x, 370, "(Lock tables first, then select a table)");
        return;
    }

    if (!variable_struct_exists(global.knowledge_table_data, cc.selected_table))
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];
    var display_y = 370;
    var row_h = 25;
    var col_width = 260;
    var max_rows_per_col = 18;

    draw_set_halign(fa_left);
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var all_entries = [];
    var seen = {}; // Prevent duplicates

    // Fixed skills from species
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species, "creation") && variable_struct_exists(species.creation, "fixed_skills"))
        {
            var fixed = species.creation.fixed_skills;
            for (var i = 0; i < array_length(fixed); i++)
            {
                var f = fixed[i];
                if (!variable_struct_exists(seen, f.name))
                {
                    array_push(all_entries, { 
                        name: f.name, 
                        rank: f.rank, 
                        is_fixed: true 
                    });
                    seen[$ f.name] = true;
                }
            }
        }
    }

    // Table skills and specializations
    for (var i = 0; i < array_length(table_data.skills); i++)
    {
        var skill_name = table_data.skills[i];
        if (!variable_struct_exists(seen, skill_name))
        {
            array_push(all_entries, { name: skill_name, is_specialization: false });
            seen[$ skill_name] = true;
        }

        var base_skill = string_replace_all(skill_name, " (X)", "");
        var keys = variable_struct_get_names(cc.skill_ranks);
      
        for (var k = 0; k < array_length(keys); k++)
        {
            var key = keys[k];
            if (string_pos(base_skill, key) > 0 && !variable_struct_exists(seen, key))
            {
                array_push(all_entries, { name: key, is_specialization: true });
                seen[$ key] = true;
            }
        }
    }

    // Draw all entries
    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;
        
        var draw_x = (skills_x - 210) + (col * col_width);
        var draw_y = display_y + (row * row_h);
		
	
		
                var is_hovered = (cc.hovered_skill == entry.name);

        if (is_hovered)
            draw_set_color(c_yellow);
        else if (variable_struct_exists(entry, "is_fixed") && entry.is_fixed)
            draw_set_color(c_green);
        else if (variable_struct_exists(cc.free_slot_ranks, entry.name) && cc.free_slot_ranks[$ entry.name] > 0)
            draw_set_color(c_aqua);           // ← This makes free slot skills blue
        else if (entry.is_specialization)
            draw_set_color(c_ltgray);
        else
            draw_set_color(c_white);

        if (entry.is_specialization)
        {
            var display_name = entry.name;
            if (string_pos(":", entry.name) > 0)
            {
                var parts = string_split(entry.name, ":");
                display_name = parts[1];
            }
            var rank = get_skill_rank(cc, entry.name);
            draw_text(draw_x, draw_y, display_name + " (" + string(rank) + ")");
        }
        else
        {
            var base_skill = string_replace_all(entry.name, " (X)", "");
            var rank = variable_struct_exists(entry, "rank") ? entry.rank : get_skill_rank(cc, base_skill);
           
            if (string_pos(" (X)", entry.name) > 0)
                draw_text(draw_x, draw_y, entry.name);
            else
                draw_text(draw_x, draw_y, entry.name + " (" + string(rank) + ")");
        }

        // Hover
        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + 240, draw_y + 25))
            cc.hovered_skill = entry.name;
    }

    // Free Skill Slots (at the bottom)
    var remaining = 0;
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
            remaining = species.creation.knowledge_skills.choices.count;
    }

    draw_set_color(c_white);
    draw_text(skills_x - 80, + 340, "Free Skill Slots: " + string(remaining));
}


function _normalize_knowledge(node)
{
    var out = {
        fixed: [],
        choices: {
            count: 0,
            options: []
        }
    };
    
    if (is_undefined(node))
        return out;

    // Already standardized
    if (variable_struct_exists(node, "fixed"))
        out.fixed = node.fixed;

    if (variable_struct_exists(node, "choices"))
    {
        var c = node.choices;
        if (is_struct(c))
        {
            if (variable_struct_exists(c, "count"))
                out.choices.count = c.count;
            if (variable_struct_exists(c, "options"))
                out.choices.options = c.options;
        }
        else if (is_real(c))
        {
            out.choices.count = c;
        }
    }

    // Legacy support
    if (variable_struct_exists(node, "options"))
        out.choices.options = node.options;

    // Raw array fallback
    if (is_array(node))
        out.fixed = node;

    return out;
}



function get_current_cdt(cc)
{
    if (!variable_struct_exists(cc, "locked_species"))
        return 0;
        
    var species_cdt = 0;
    var sp = cc.locked_species;
    
    if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
    {
        if (variable_struct_exists(global.species_data[$ sp], "stats"))
        {
            species_cdt = global.species_data[$ sp].stats.cdt;
        }
    }
    
    var toughness_bonus = 0;
    if (variable_global_exists("get_toughness_cdt_bonus"))
    {
        toughness_bonus = get_toughness_cdt_bonus(cc);
    }
    
    var bonus = 0;
    if (variable_struct_exists(cc, "generation") && variable_struct_exists(cc.generation, "cdt_bonus"))
    {
        bonus = cc.generation.cdt_bonus;
    }
    
    return species_cdt + toughness_bonus + bonus;
}


function handle_locked_table_selection(cc, L, mx, my, clicked)
{
    var col_w = 250;
    var tables_x = L.center_x - 280 - 40 - 200;
    var start_y = 400;
    var tables = get_all_knowledge_tables();

    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_x = tables_x - 120;
        var btn_y = start_y + (i * 36);
        var btn_w = 240, btn_h = 30;

        if (point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h))
        {
            if (clicked)
            {
                cc.selected_table = table;
                show_debug_message("Selected Table (Locked Mode): " + table);
            }
            else
            {
                cc.hovered_table = table;
            }
            break;
        }
    }
}



function draw_skill_tooltip(cc)
{
    if (!variable_struct_exists(cc, "hovered_skill") || cc.hovered_skill == "")
        return;
      
    var hovered_key = cc.hovered_skill;
    var base_key = hovered_key;
  
    // Extract base skill name
    if (string_pos(":", hovered_key) > 0)
    {
        var parts = string_split(hovered_key, ":");
        base_key = parts[0] + " (X)";
    }
    else if (string_pos(" (", hovered_key) > 0)
    {
        var parts = string_split(hovered_key, " (");
        base_key = parts[0] + " (X)";
    }

    if (!variable_global_exists("skill_data") || !variable_struct_exists(global.skill_data, base_key))
        return;

    var skill = global.skill_data[$ base_key];
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var char_size = get_character_size(cc);

    var tooltip_text = hovered_key + "\n\n";

    if (variable_struct_exists(skill, "table"))
        tooltip_text += "Table: " + skill.table + "\n";

       if (variable_struct_exists(skill, "check") && variable_struct_exists(skill.check, "mode"))
    {
        var mode = skill.check.mode;
        var mode_text = mode;
        
        if (mode == "all") mode_text = "All Attributes";
        else if (mode == "best") mode_text = "Best Attribute";
        else if (mode == "size" || mode == "size_dependent") mode_text = "Size Dependent Attribute";
        
        tooltip_text += "Mode: " + mode_text + "\n";
    }

    var rank = get_skill_rank(cc, hovered_key);

    // === CHECKS ===
    var is_all_mode = false;
    if (variable_struct_exists(skill, "check") && skill.check.mode == "all")
        is_all_mode = true;

    var is_size_mode = false;
    if (variable_struct_exists(skill, "check"))
    {
        var mode = skill.check.mode;
        if (mode == "size" || mode == "size_dependent")
            is_size_mode = true;
    }

    var info = undefined; // Safety

            if (is_all_mode)
    {
        tooltip_text += "Checks:\n";
        var checks = get_skill_check_nodes(skill, cc);
        for (var i = 0; i < array_length(checks); i++)
        {
            var node = checks[i];
            var attr = variable_struct_exists(node, "attribute") ? node.attribute : "Unknown";
            var mod_val = variable_struct_exists(node, "modifier") ? node.modifier : 0;
            var base_value = get_final_attribute(cc, attr);
            var final_value = base_value + mod_val + rank;
           
            var line = attr + " Check: " + string(final_value) + " (" + attr + " " + string(base_value);
            if (mod_val != 0)
            {
                if (mod_val >= 0) line += " + Mod +" + string(mod_val);
                else line += " + Mod " + string(mod_val);
            }
            line += " + Rank " + string(rank) + ")";
            tooltip_text += line + "\n";
        }
    }
    else
    {
        // Single check (original style)
        var info = get_skill_check_result(cc, skill);
        var total_check = (variable_struct_exists(info, "total") ? info.total : 0) + rank;

        var check_line = "Check: " + string(total_check) + " (" +
            (variable_struct_exists(info, "attribute") ? info.attribute : "None") + " " +
            string(get_final_attribute(cc, info.attribute));

        if (variable_struct_exists(info, "modifier"))
        {
            if (info.modifier >= 0)
                check_line += " + Mod +" + string(info.modifier);
            else
                check_line += " + Mod " + string(info.modifier);
        }

        check_line += " + Rank " + string(rank) + ")";
        tooltip_text += check_line + "\n\n";
    }

    tooltip_text += "Attributes:\n";
  
    if (!is_undefined(info) && variable_struct_exists(info, "attribute"))
    {
        var attr = info.attribute;
        var mod_val = variable_struct_exists(info, "modifier") ? info.modifier : 0;
        var attr_value = get_final_attribute(cc, attr);
      
        var line = " " + attr;
        if (mod_val != 0)
        {
            if (mod_val >= 0) line += " +" + string(mod_val);
            else line += " " + string(mod_val);
        }
        line += " (" + string(attr_value) + ") ← CURRENT";
        tooltip_text += line + "\n";
    }
    else
    {
        tooltip_text += " No attribute data\n";
    }

    if (is_size_mode)
    {
        tooltip_text += "\n(Size Category: " + string_upper(char_size) + ")";
    }

    tooltip_text += "\nDifficulty: " + (variable_struct_exists(skill, "difficulty") ? skill_difficulty_name(skill.difficulty) : "Standard") + "\n\n";
  
    if (variable_struct_exists(skill, "description"))
        tooltip_text += skill.description;

    // Drawing (same as before)
    var tooltip_w = 400;
    var tooltip_h = string_height_ext(tooltip_text, 20, tooltip_w - 30) + 40;
    var box_x = mx + 24;
    var box_y = my + 24;
    if (box_x + tooltip_w > display_get_gui_width())
        box_x = mx - tooltip_w - 24;
    if (box_y + tooltip_h > display_get_gui_height() - 20)
        box_y = my - tooltip_h - 24;
    if (box_y < 0) box_y = 20;

    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + tooltip_w, box_y + tooltip_h, false);

    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + tooltip_w, box_y + tooltip_h, true);

    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_text_ext(box_x + 15, box_y + 15, tooltip_text, 20, tooltip_w - 30);
}



function draw_specialization_popup(cc, L)
{
    if (!variable_struct_exists(cc, "pending_specializations")) return;
	
    var popup_w = 360;
    var popup_h = 90 + (array_length(cc.pending_specializations) * 42);
    var popup_x = L.center_x - popup_w * 0.5;
    var popup_y = 160;

    // Background
    draw_set_color(c_dkgray);
    draw_rectangle(popup_x - 4, popup_y - 4, popup_x + popup_w + 4, popup_y + popup_h + 4, false);
    
    draw_set_color(c_black);
    draw_rectangle(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, false);

    // Border
    draw_set_color(c_white);
    draw_rectangle(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, true);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(popup_x + popup_w/2, popup_y + 18, "Select Specialization");
    draw_text(popup_x + popup_w/2, popup_y + 42, cc.pending_skill);

    draw_set_halign(fa_left);

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    for (var i = 0; i < array_length(cc.pending_specializations); i++)
    {
        var choice = cc.pending_specializations[i];
                // Skip if already purchased
        var full_key1 = string_replace_all(cc.pending_skill, " (X)", "") + ":" + choice;
        var full_key2 = string_replace_all(cc.pending_skill, " (X)", "") + " (" + choice + ")";
        
        if (variable_struct_exists(cc.skill_ranks, full_key1) || variable_struct_exists(cc.skill_ranks, full_key2))
            continue;

        var row_y = popup_y + 75 + (i * 42);
        
        var hovered = point_in_rectangle(mx, my, popup_x + 20, row_y - 8, popup_x + popup_w - 20, row_y + 28);

        if (hovered)
        {
            draw_set_color(c_yellow);
            draw_rectangle(popup_x + 15, row_y - 6, popup_x + popup_w - 15, row_y + 28, false);
            draw_set_color(c_black);
        }
        else
        {
            draw_set_color(c_white);
        }

        draw_text(popup_x + 30, row_y + 6, choice);
    }
}


function draw_specializations_for_skill(cc, draw_x, start_y, base_skill)
{
    var keys = variable_struct_get_names(cc.skill_ranks);
    var y_pos = start_y;

    for (var k = 0; k < array_length(keys); k++)
    {
        var key = keys[k];
        
        // Check if this is a specialization of the current base skill
        if (string_pos(base_skill + " (", key) == 1 || string_pos(base_skill + ":", key) == 1)
        {
            var spec_rank = get_skill_rank(cc, key);
            var is_hovered = (cc.hovered_skill == key);

            draw_set_color(is_hovered ? c_yellow : c_ltgray);
            draw_text(draw_x + 15, y_pos, "> " + key + " (" + string(spec_rank) + ")");
            y_pos += 18;
        }
    }
}


function draw_specializations_under_parent(cc, base_x, start_y, base_skill)
{
    var keys = variable_struct_get_names(cc.skill_ranks);
    var y_pos = start_y;

    for (var k = 0; k < array_length(keys); k++)
    {
        var key = keys[k];
        
        // Check if this is a specialization of the current base skill
        if (string_pos(base_skill + " (", key) == 1)
        {
            var rank = get_skill_rank(cc, key);
            var is_hovered = (cc.hovered_skill == key);

            draw_set_color(is_hovered ? c_yellow : c_ltgray);
            draw_text(base_x + 20, y_pos, "> " + key + " (" + string(rank) + ")");
            
            y_pos += 22;   // Slightly more spacing for sub-items
        }
    }
}


function get_skill_check_result_size_aware(cc, skill)
{
    var result = {
        attribute: "Strength",  // fallback
        total: 0,
        modifier: 0,
        is_size_based: false
    };

    if (!variable_struct_exists(skill, "check"))
        return result;

    var check = skill.check;

    if (check.mode == "size_dependent" && variable_struct_exists(check, "size_attributes"))
    {
        var size = get_creature_size(cc);   // You'll need this function
        
        if (variable_struct_exists(check.size_attributes, size))
        {
            var entry = check.size_attributes[$ size];
            result.attribute = entry.attribute;
            result.modifier = variable_struct_exists(entry, "modifier") ? entry.modifier : 0;
            result.is_size_based = true;
        }
        else if (variable_struct_exists(check, "default_attribute"))
        {
            result.attribute = check.default_attribute;
        }
    }
    else
    {
        // Fall back to your existing logic
        return get_skill_check_result(cc, skill);
    }
    return result;
}



function get_character_size(cc)
{
    if (!is_struct(cc)) return "medium";

    // Direct field (future-proof)
    if (variable_struct_exists(cc, "size"))
        return string_lower(string(cc.size));

    // From traits array (your current system)
    if (variable_struct_exists(cc, "traits") && is_array(cc.traits))
    {
        for (var i = 0; i < array_length(cc.traits); i++)
        {
            var trait = string_lower(string(cc.traits[i]));
            
            if (string_pos("tiny", trait) != 0) return "tiny";
            if (string_pos("small", trait) != 0) return "small";
            if (string_pos("large", trait) != 0) return "large";
            if (string_pos("huge", trait) != 0) return "huge";
            if (string_pos("giant", trait) != 0) return "huge";
        }
    }

    // Check species data as fallback
    if (variable_struct_exists(cc, "locked_species") && variable_struct_exists(global.species_data, cc.locked_species))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species, "stats") && variable_struct_exists(species.stats, "traits"))
        {
            var traits = species.stats.traits;
            for (var i = 0; i < array_length(traits); i++)
            {
                var trait = string_lower(string(traits[i]));
                if (string_pos("tiny", trait) != 0) return "tiny";
                if (string_pos("small", trait) != 0) return "small";
                if (string_pos("large", trait) != 0) return "large";
                if (string_pos("huge", trait) != 0) return "huge";
            }
        }
    }

    return "medium";
}