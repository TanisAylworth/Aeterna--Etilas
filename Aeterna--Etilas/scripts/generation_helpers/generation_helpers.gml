function generation_layout(L)
{
    var cx = L.center_x;
    return {
        skills_x:  cx - 480,
        tables_x:  cx,
        talents_x: cx + 480
    };
}



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
var source = variable_struct_exists(cc, "pending_skill_source")
    ? cc.pending_skill_source : "cp";

if (source == "species_choice"
    && variable_struct_exists(cc, "species_skill_choice_remaining")
    && cc.species_skill_choice_remaining > 0)
{
    cc.species_skill_choice_remaining--;
    if (!variable_struct_exists(cc, "species_choice_skill_ranks"))
        cc.species_choice_skill_ranks = {};
    if (!variable_struct_exists(cc.species_choice_skill_ranks, full_skill_name))
        cc.species_choice_skill_ranks[$ full_skill_name] = 0;
    cc.species_choice_skill_ranks[$ full_skill_name]++;
}
else if (source == "free_slot")
{
    var species = global.species_data[$ cc.locked_species];
    if (species.creation.knowledge_skills.choices.count > 0)
    {
        species.creation.knowledge_skills.choices.count--;
        if (!variable_struct_exists(cc.free_slot_ranks, full_skill_name))
            cc.free_slot_ranks[$ full_skill_name] = 0;
        cc.free_slot_ranks[$ full_skill_name]++;
    }
}
else
{
    var owns_table = table_is_owned(cc, cc.selected_table);
    var cost = owns_table ? 1 : 2;
    if (cc.generation_slots_remaining < cost) return true; // or abort cleanly
    cc.generation_slots_remaining -= cost;
}

set_skill_rank(cc, full_skill_name, 0);
cc.pending_skill_source = "";
            
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
    var panel_w = 220;
    var gap = 40;
    var cdt_x = L.center_x - panel_w - gap * 0.5;
    var gold_x = L.center_x + gap * 0.5;
    var panel_y = 110;

    var btn_y = panel_y + 60;
    var btn_w = 50;
    var btn_h = 28;

    // CDT button positions
    var cdt_minus_x = cdt_x + 30;
    var cdt_plus_x  = cdt_x + panel_w - 30 - btn_w;

    // Gold button positions
    var gold_minus_x = gold_x + 30;
    var gold_plus_x  = gold_x + panel_w - 30 - btn_w;

    // Hover detection
    cc.generation_hover.cdt_minus  = point_in_rectangle(mx, my, cdt_minus_x, btn_y, cdt_minus_x + btn_w, btn_y + btn_h);
    cc.generation_hover.cdt_plus   = point_in_rectangle(mx, my, cdt_plus_x,  btn_y, cdt_plus_x  + btn_w, btn_y + btn_h);
    cc.generation_hover.gold_minus = point_in_rectangle(mx, my, gold_minus_x, btn_y, gold_minus_x + btn_w, btn_y + btn_h);
    cc.generation_hover.gold_plus  = point_in_rectangle(mx, my, gold_plus_x,  btn_y, gold_plus_x  + btn_w, btn_y + btn_h);

    if (!clicked) return;

    // CDT logic
    if (cc.generation_hover.cdt_minus && cc.generation.cdt_bonus > 0)
    {
        cc.generation.cdt_bonus--;
        cc.generation_slots_remaining++;
    }
    if (cc.generation_hover.cdt_plus && cc.generation_slots_remaining > 0)
    {
        var current_cdt = get_current_cdt(cc);
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

function handle_table_list(cc, L, mx, my, clicked, tables_x)
{
    if (tables_x == undefined)
        tables_x = L.center_x;

    var yy = 320;
    var btn_w = 260;
    var btn_h = 34;
    var row_gap = 8;
    var start_y = yy + 80;
    var btn_x = tables_x - btn_w * 0.5;

    var tables = get_all_knowledge_tables();

    var confirm_x = btn_x;
    var confirm_y = start_y + array_length(tables) * (btn_h + row_gap) + 12;
    var confirm_w = btn_w;
    var confirm_h = 36;

    if (clicked && point_in_rectangle(mx, my, confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h))
    {
        cc.generation.tables_locked = !cc.generation.tables_locked;
        if (cc.generation.tables_locked)
            cc.selected_table = "";
        return;
    }

    if (cc.generation.tables_locked)
    {
        handle_locked_table_selection(cc, L, mx, my, clicked, tables_x);
        return;
    }

    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_y = start_y + i * (btn_h + row_gap);

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
    if (array_index_of(cc.generation.fixed_tables, table) != -1)
        return;

    var choice_idx = array_index_of(cc.generation.choice_tables, table);
    var purch_idx = array_index_of(cc.generation.purchased_tables, table);

    // ===== Remove free choice =====
    if (choice_idx != -1)
    {
        array_delete(cc.generation.choice_tables, choice_idx, 1);
        cc.generation.table_choices_remaining++;
        return;
    }

    // ===== Un-buy purchased table =====
    if (purch_idx != -1)
    {
        // Table is no longer owned → reclaim the 1-point discounts
        reclaim_skill_table_discount(cc, table);
        reclaim_talent_table_discount(cc, table);

        array_delete(cc.generation.purchased_tables, purch_idx, 1);
        cc.generation_slots_remaining += 2;
        return;
    }

    // ===== Buy / Choose =====
    if (cc.generation.table_choices_remaining > 0)
    {
        // Free table choice — now owned, apply discounts
        array_push(cc.generation.choice_tables, table);
        cc.generation.table_choices_remaining--;

        refund_skill_table_discount(cc, table);
        refund_talent_table_discount(cc, table);
    }
    else if (cc.generation_slots_remaining >= 2)
    {
        // Paid table — now owned, apply discounts
        array_push(cc.generation.purchased_tables, table);
        cc.generation_slots_remaining -= 2;

        refund_skill_table_discount(cc, table);
        refund_talent_table_discount(cc, table);
    }
}

function refund_talent_table_discount(cc, table_name)
{
    if (!variable_struct_exists(global.knowledge_table_data, table_name))
        return;

    var table_data = global.knowledge_table_data[$ table_name];
    if (!variable_struct_exists(table_data, "talents"))
        return;

    var refunded = 0;

    for (var i = 0; i < array_length(table_data.talents); i++)
    {
        var t_name = table_data.talents[i];
        var rank = get_talent_rank(cc, t_name);
        if (rank < 0)
            continue;

        if (array_contains(cc.free_slot_talents, t_name))
            continue;

        // rank 0 = 1 purchase, rank 1 = 2 purchases, etc.
        refunded += (rank + 1);
    }

    if (refunded > 0)
    {
        cc.generation_slots_remaining += refunded;
        show_debug_message("Talent discount +" + string(refunded) + " for table " + table_name);
    }
}


function reclaim_talent_table_discount(cc, table_name)
{
    if (!variable_struct_exists(global.knowledge_table_data, table_name))
        return;

    var table_data = global.knowledge_table_data[$ table_name];
    if (!variable_struct_exists(table_data, "talents"))
        return;

    var reclaimed = 0;

    for (var i = 0; i < array_length(table_data.talents); i++)
    {
        var t_name = table_data.talents[i];
        var rank = get_talent_rank(cc, t_name);
        if (rank < 0)
            continue;

        if (array_contains(cc.free_slot_talents, t_name))
            continue;

        reclaimed += (rank + 1);
    }

    if (reclaimed > 0)
    {
        cc.generation_slots_remaining -= reclaimed;
        show_debug_message("Talent discount reclaimed -" + string(reclaimed) + " for table " + table_name);
    }
}

function handle_skill_list(cc, L, mx, my, clicked, right_clicked, skills_x = undefined)
{
    if (skills_x == undefined)
        skills_x = L.center_x - 480;
    if (cc.selected_table == "" || !cc.generation.tables_locked)
        return;

    if (!variable_struct_exists(global.knowledge_table_data, cc.selected_table))
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];

    // ===== MATCH THE DRAW VALUES EXACTLY =====
   var col_width = 280;
    var max_rows_per_col = 16;
    var row_h = 26;
    var row_gap = 6;
    var box_w = 260;
    var display_y = 385;
    var total_cols = 2;
    var start_x = skills_x - (total_cols * col_width) * 0.5 + 10;

    // ===== BUILD THE SAME LIST AS DRAW =====
    var all_entries = [];
    var seen = {};

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
                    if (array_contains(table_data.skills, f.name) || array_contains(table_data.skills, string_replace_all(f.name, " (X)", "")))
                    {
                        array_push(all_entries, {
                            name: f.name,
                            rank: f.rank,
                            is_fixed: true,
                            is_specialization: false
                        });
                        seen[$ f.name] = true;
                    }
                }
            }
        }
    }

    // Table skills + specializations
    for (var i = 0; i < array_length(table_data.skills); i++)
    {
        var skill_name = table_data.skills[i];
        if (!variable_struct_exists(seen, skill_name))
        {
            array_push(all_entries, {
                name: skill_name,
                is_specialization: false,
                is_fixed: false
            });
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

    // ===== CLICK / HOVER DETECTION =====
    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;

        var draw_x = start_x + col * col_width;
        var draw_y = display_y + row * (row_h + row_gap);

        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + box_w, draw_y + row_h))
        {
            cc.hovered_skill = entry.name;

            if (clicked)
            {
                // Your existing rank-up / specialization popup logic here
                // (keep whatever you already had for left-click)

                attempt_skill_rank_up(
    cc,
    entry.name,
    string_replace_all(entry.name, " (X)", ""),
    cc.selected_table
);
            }
            else if (right_clicked)
            {
                attempt_skill_rank_down(cc, entry.name);
            }

            return; // stop after first hit
        }
    }
}

// ===================================================================
function attempt_skill_rank_up(cc, skill_key, base_skill, table)
{
    var current_rank = get_skill_rank(cc, skill_key);

    var species_choice_skill =
        get_species_choice_skill_for_specialization(cc, skill_key);

    // Spec required at 0 → open popup only (spend on confirm)
    var lookup = string_replace_all(skill_key, " (X)", "");
    var skill_data = global.skill_data[$ skill_key];

    if (skill_data == undefined)
        skill_data = global.skill_data[$ lookup];

    if (skill_data != undefined
        && variable_struct_exists(skill_data, "specialization")
        && skill_data.specialization.required
        && current_rank == 0
        && !variable_struct_exists(cc.skill_ranks, skill_key))
    {
        cc.pending_skill = skill_key;
        cc.pending_specializations = skill_data.specialization.choices;
        cc.pending_skill_source = "cp"; // default

        if (species_choice_skill != undefined
            && variable_struct_exists(cc, "species_skill_choice_remaining")
            && cc.species_skill_choice_remaining > 0)
        {
            cc.pending_skill_source = "species_choice";
        }
        else if (!species_skill_choices_are_restricted(cc)
            && variable_struct_exists(cc, "locked_species"))
        {
            var sp = global.species_data[$ cc.locked_species];

            if (variable_struct_exists(
                sp.creation.knowledge_skills,
                "choices"
            )
            && sp.creation.knowledge_skills.choices.count > 0)
            {
                cc.pending_skill_source = "free_slot";
            }
        }

        cc.specialization_popup = true;
        return;
    }

    // === 1) Restricted species skill choice ===

if (species_choice_skill != undefined
    && variable_struct_exists(cc, "species_skill_choice_remaining")
    && cc.species_skill_choice_remaining > 0)
{
    cc.species_skill_choice_remaining--;

    set_skill_rank(
        cc,
        skill_key,
        variable_struct_exists(cc.skill_ranks, skill_key)
            ? current_rank + 1
            : 0
    );


    // Track which skill actually received the species rank
    if (!variable_struct_exists(cc, "species_choice_skill_ranks"))
        cc.species_choice_skill_ranks = {};

    if (!variable_struct_exists(
        cc.species_choice_skill_ranks,
        skill_key
    ))
    {
        cc.species_choice_skill_ranks[$ skill_key] = 0;
    }

    cc.species_choice_skill_ranks[$ skill_key]++;


    show_debug_message(
        "Species choice skill: "
        + skill_key
        + " parent="
        + species_choice_skill
        + " remaining="
        + string(cc.species_skill_choice_remaining)
    );

    return;
}

    // === 2) Unrestricted free slots only (empty options list) ===
    if (!species_skill_choices_are_restricted(cc)
        && variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
        {
            var remaining = species.creation.knowledge_skills.choices.count;
            if (remaining > 0)
            {
                species.creation.knowledge_skills.choices.count--;
                set_skill_rank(cc, skill_key,
                    variable_struct_exists(cc.skill_ranks, skill_key) ? current_rank + 1 : 0);

                if (!variable_struct_exists(cc.free_skill_ranks, skill_key))
                    cc.free_skill_ranks[$ skill_key] = 0;
                cc.free_skill_ranks[$ skill_key]++;
                return;
            }
        }
    }

    // === 3) Character points ===
var owns_table = table_is_owned(cc, table);
var cost = owns_table ? 1 : 2;

if (cc.generation_slots_remaining < cost)
    return;

cc.generation_slots_remaining -= cost;

set_skill_rank(
    cc,
    skill_key,
    variable_struct_exists(cc.skill_ranks, skill_key)
        ? current_rank + 1
        : 0
);


// Track that this rank was purchased with CP
if (!variable_struct_exists(cc, "paid_skill_ranks"))
    cc.paid_skill_ranks = {};

if (!variable_struct_exists(cc.paid_skill_ranks, skill_key))
    cc.paid_skill_ranks[$ skill_key] = 0;

cc.paid_skill_ranks[$ skill_key]++;
}

//==============================================================

function table_is_owned(cc, table_name)
{
    return array_contains(cc.generation.fixed_tables, table_name) ||
           array_contains(cc.generation.choice_tables, table_name) ||
           array_contains(cc.generation.purchased_tables, table_name);
}

// ===================================================================
function attempt_skill_rank_down(cc, skill_key)
{
    var current_rank = get_skill_rank(cc, skill_key);

    if (!variable_struct_exists(cc.skill_ranks, skill_key))
        return;

    // Initialize tracking structures if they don't exist
    if (!variable_struct_exists(cc, "free_skill_ranks"))
        cc.free_skill_ranks = {};

    if (!variable_struct_exists(cc, "paid_skill_ranks"))
        cc.paid_skill_ranks = {};

    // =====================================================
    // Check if this skill is fixed
    // =====================================================

    var initial_fixed_rank =
        variable_struct_exists(cc.fixed_skills, skill_key)
        ? cc.fixed_skills[$ skill_key]
        : 0;

    if (initial_fixed_rank > 0 && current_rank <= initial_fixed_rank)
    {
        show_debug_message(
            "Cannot refund below fixed rank for: " + skill_key
        );

        return;
    }


    // =====================================================
    // Determine ranks from each source
    // =====================================================

    var species_choice_ranks = 0;

    if (variable_struct_exists(cc, "species_choice_skill_ranks")
        && variable_struct_exists(cc.species_choice_skill_ranks, skill_key))
    {
        species_choice_ranks =
            cc.species_choice_skill_ranks[$ skill_key];
    }


    var free_ranks = 0;

    if (variable_struct_exists(cc.free_skill_ranks, skill_key))
    {
        free_ranks =
            cc.free_skill_ranks[$ skill_key];
    }


    var paid_ranks = 0;

    if (variable_struct_exists(cc.paid_skill_ranks, skill_key))
    {
        paid_ranks =
            cc.paid_skill_ranks[$ skill_key];
    }


    // =====================================================
    // 1. REFUND CP-PURCHASED RANK FIRST
    // =====================================================

    if (paid_ranks > 0)
    {
        var owns_table = table_is_owned(cc, cc.selected_table);
        var refund = owns_table ? 1 : 2;

        cc.generation_slots_remaining += refund;

        set_skill_rank(
            cc,
            skill_key,
            current_rank - 1
        );

        cc.paid_skill_ranks[$ skill_key]--;

        if (cc.paid_skill_ranks[$ skill_key] <= 0)
        {
            variable_struct_remove(
                cc.paid_skill_ranks,
                skill_key
            );
        }

        return;
    }


    // =====================================================
    // 2. REFUND OTHER FREE RANK
    // =====================================================

    if (free_ranks > 0)
    {
        set_skill_rank(
            cc,
            skill_key,
            current_rank - 1
        );

        cc.free_skill_ranks[$ skill_key]--;

        if (cc.free_skill_ranks[$ skill_key] <= 0)
        {
            variable_struct_remove(
                cc.free_skill_ranks,
                skill_key
            );
        }


        // Return the unrestricted free skill choice
        if (variable_struct_exists(cc, "locked_species"))
        {
            var species =
                global.species_data[$ cc.locked_species];

            if (variable_struct_exists(
                species.creation.knowledge_skills,
                "choices"
            ))
            {
                species.creation.knowledge_skills.choices.count++;
            }
        }

        return;
    }


    // =====================================================
    // 3. REFUND SPECIES-CHOICE RANK LAST
    // =====================================================

    if (species_choice_ranks > 0)
    {
        set_skill_rank(
            cc,
            skill_key,
            current_rank - 1
        );

        cc.species_choice_skill_ranks[$ skill_key]--;

        if (cc.species_choice_skill_ranks[$ skill_key] <= 0)
        {
            variable_struct_remove(
                cc.species_choice_skill_ranks,
                skill_key
            );
        }

        // Return the species skill choice
        cc.species_skill_choice_remaining++;

        return;
    }
}


function draw_cdt_gold_panels(cc, L)
{
    var panel_w = 220;
    var panel_h = 170;
    var gap = 40;

    var cdt_x = L.center_x - panel_w - gap * 0.5;
    var gold_x = L.center_x + gap * 0.5;
    var panel_y = 110;

    // =========================================
    // CDT PANEL
    // =========================================
    draw_set_color(c_black);
    draw_rectangle(cdt_x, panel_y, cdt_x + panel_w, panel_y + panel_h, false);

    draw_set_color(c_white);
    draw_rectangle(cdt_x, panel_y, cdt_x + panel_w, panel_y + panel_h, true);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(cdt_x + panel_w * 0.5, panel_y + 10, "CDT");

    draw_set_color(c_ltgray);
    draw_text(cdt_x + panel_w * 0.5, panel_y + 34, "1 Point  =  +1 CDT");

    // +/- buttons
    var btn_y = panel_y + 60;
    var btn_w = 50;
    var btn_h = 28;
    var minus_x = cdt_x + 30;
    var plus_x  = cdt_x + panel_w - 30 - btn_w;

    // Minus
    draw_set_color(cc.generation_hover.cdt_minus ? make_color_rgb(60, 50, 20) : make_color_rgb(35, 35, 35));
    draw_rectangle(minus_x, btn_y, minus_x + btn_w, btn_y + btn_h, false);
    draw_set_color(cc.generation_hover.cdt_minus ? c_yellow : c_white);
    draw_rectangle(minus_x, btn_y, minus_x + btn_w, btn_y + btn_h, true);
    draw_set_color(c_white);
    draw_text(minus_x + btn_w * 0.5, btn_y + 5, "-");

    // Plus
    draw_set_color(cc.generation_hover.cdt_plus ? make_color_rgb(60, 50, 20) : make_color_rgb(35, 35, 35));
    draw_rectangle(plus_x, btn_y, plus_x + btn_w, btn_y + btn_h, false);
    draw_set_color(cc.generation_hover.cdt_plus ? c_yellow : c_white);
    draw_rectangle(plus_x, btn_y, plus_x + btn_w, btn_y + btn_h, true);
    draw_set_color(c_white);
    draw_text(plus_x + btn_w * 0.5, btn_y + 5, "+");

    // Values
    draw_set_color(c_aqua);
    draw_text(cdt_x + panel_w * 0.5, panel_y + 100, "Bonus: +" + string(cc.generation.cdt_bonus));
    draw_set_color(c_white);
    draw_text(cdt_x + panel_w * 0.5, panel_y + 120, "Current: " + string(get_current_cdt(cc)));
    draw_set_color(c_ltgray);
    draw_text(cdt_x + panel_w * 0.5, panel_y + 140, "Limit: " + string(get_cdt_cap(cc)));

    // =========================================
    // GOLD PANEL
    // =========================================
    draw_set_color(c_black);
    draw_rectangle(gold_x, panel_y, gold_x + panel_w, panel_y + panel_h, false);

    draw_set_color(c_white);
    draw_rectangle(gold_x, panel_y, gold_x + panel_w, panel_y + panel_h, true);

    draw_set_color(c_white);
    draw_text(gold_x + panel_w * 0.5, panel_y + 10, "GOLD");

    draw_set_color(c_ltgray);
    draw_text(gold_x + panel_w * 0.5, panel_y + 34, "1 Point  =  +20 Gold");

    // +/- buttons
    minus_x = gold_x + 30;
    plus_x  = gold_x + panel_w - 30 - btn_w;

    // Minus
    draw_set_color(cc.generation_hover.gold_minus ? make_color_rgb(60, 50, 20) : make_color_rgb(35, 35, 35));
    draw_rectangle(minus_x, btn_y, minus_x + btn_w, btn_y + btn_h, false);
    draw_set_color(cc.generation_hover.gold_minus ? c_yellow : c_white);
    draw_rectangle(minus_x, btn_y, minus_x + btn_w, btn_y + btn_h, true);
    draw_set_color(c_white);
    draw_text(minus_x + btn_w * 0.5, btn_y + 5, "-");

    // Plus
    draw_set_color(cc.generation_hover.gold_plus ? make_color_rgb(60, 50, 20) : make_color_rgb(35, 35, 35));
    draw_rectangle(plus_x, btn_y, plus_x + btn_w, btn_y + btn_h, false);
    draw_set_color(cc.generation_hover.gold_plus ? c_yellow : c_white);
    draw_rectangle(plus_x, btn_y, plus_x + btn_w, btn_y + btn_h, true);
    draw_set_color(c_white);
    draw_text(plus_x + btn_w * 0.5, btn_y + 5, "+");

    // Value
    draw_set_color(c_aqua);
    draw_text(gold_x + panel_w * 0.5, panel_y + 110, "Starting Gold: " + string(cc.generation.gold_bonus));

    draw_set_halign(fa_left);
}

function draw_button_pair(x, y, half_w, gap, h, hover_minus, hover_plus)
{
    var left_l = x - half_w;
    var left_r = x - gap;
    var right_l = x + gap;
    var right_r = x + half_w;

    draw_set_color(hover_minus ? c_yellow : c_white);
    draw_rectangle(left_l, y, left_r, y + h, false);
    draw_set_color(c_black);
    draw_text((left_l + left_r)/2, y + 7, "-");

    draw_set_color(hover_plus ? c_yellow : c_white);
    draw_rectangle(right_l, y, right_r, y + h, false);
    draw_set_color(c_black);
    draw_text((right_l + right_r)/2, y + 7, "+");

    draw_set_color(c_white);   // ← Reset for safety
}



function draw_tables_column(cc, L, tables_x)
{
    if (tables_x == undefined)
        tables_x = L.center_x;

    var yy = 320;
    var btn_w = 260;
    var btn_h = 34;
    var row_gap = 8;

    var tables = get_all_knowledge_tables();
    var start_y = yy + 80;

    var panel_w = 290;
    var panel_x = tables_x - panel_w * 0.5;
    var panel_y = yy - 15;
    var panel_h = 80 + array_length(tables) * (btn_h + row_gap) + 60;

    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h + 30, false);
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h + 30, true);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(tables_x, yy, "KNOWLEDGE TABLES");

    draw_set_color(c_ltgray);
    draw_text(tables_x, yy + 28, "Free Choices: " + string(cc.generation.table_choices_remaining));
    draw_text(tables_x, yy + 48, "Extra Tables cost 2 slots");
    draw_set_halign(fa_left);

    var btn_x = tables_x - btn_w * 0.5;

    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_y = start_y + i * (btn_h + row_gap);

        var is_fixed     = array_index_of(cc.generation.fixed_tables, table) != -1;
        var is_choice    = array_index_of(cc.generation.choice_tables, table) != -1;
        var is_purchased = array_index_of(cc.generation.purchased_tables, table) != -1;
		var is_selected = (cc.selected_table == table);
        var hovered      = (cc.hovered_table == table);

        if (is_fixed)
		    draw_set_color(make_color_rgb(20, 55, 25));
		else if (is_selected)
		    draw_set_color(make_color_rgb(35, 50, 80));   // warm highlight
		else if (is_choice)
		    draw_set_color(make_color_rgb(25, 55, 35));
		else if (is_purchased)
		    draw_set_color(make_color_rgb(40, 45, 20));
		else if (hovered)
		    draw_set_color(make_color_rgb(50, 50, 30));
		else
		    draw_set_color(make_color_rgb(30, 30, 30));

        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

        if (hovered)
		    draw_set_color(c_yellow);
		else if (is_selected)
		    draw_set_color(make_color_rgb(35, 70, 90));   // or c_yellow if you prefer
		else if (is_fixed)
		    draw_set_color(c_lime);
		else if (is_choice)
		    draw_set_color(c_aqua);
		else if (is_purchased)
		    draw_set_color(c_olive);
		else
		    draw_set_color(c_white);

        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, true);

        draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var suffix = "";
if (is_fixed)
    suffix = " (Fixed)";
else if (is_selected)
    suffix = " (Active)";
else if (is_choice)
    suffix = " (Choice)";
else if (is_purchased)
    suffix = " (Bought)";

draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, table + suffix);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
    }

    var confirm_x = btn_x;
    var confirm_y = start_y + array_length(tables) * (btn_h + row_gap) + 12;
    var confirm_w = btn_w;
    var confirm_h = 36;

    var confirm_hover = point_in_rectangle(
        device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
        confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h
    );

    var is_locked = variable_struct_exists(cc.generation, "tables_locked")
        && cc.generation.tables_locked;

    if (is_locked)
        draw_set_color(confirm_hover ? make_color_rgb(40, 90, 40) : make_color_rgb(25, 60, 25));
    else
        draw_set_color(confirm_hover ? make_color_rgb(60, 60, 30) : make_color_rgb(40, 40, 25));

    draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, false);
    draw_set_color(confirm_hover ? c_yellow : (is_locked ? c_lime : c_white));
    draw_rectangle(confirm_x, confirm_y, confirm_x + confirm_w, confirm_y + confirm_h, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(confirm_x + confirm_w * 0.5, confirm_y + confirm_h * 0.5,
        is_locked ? "UNLOCK TABLES" : "LOCK TABLES");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// ===================================================================
function draw_skills_column(cc, L, skills_x = undefined)
{
    if (skills_x == undefined)
    skills_x = L.center_x - 480;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // ===== LAYOUT =====
    var col_width = 280;
    var max_rows_per_col = 16;
    var row_h = 26;
    var row_gap = 6;
    var box_w = 260;

    // Outer panel sized to content
    var panel_w = col_width * 2 + 40;
    var panel_x = skills_x - panel_w * 0.5;
    var panel_y = 305;
    var panel_h = 600;

    // Background
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

    // Border
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

    // Header
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(skills_x, 318, "SKILLS");

    // Free Skill slots
    // Free Skill Slots: only unrestricted pool
	var free_remaining = 0;
	if (!species_skill_choices_are_restricted(cc) && variable_struct_exists(cc, "locked_species"))
	{
	    var species = global.species_data[$ cc.locked_species];
	    if (variable_struct_exists(species.creation.knowledge_skills, "choices"))
	        free_remaining = species.creation.knowledge_skills.choices.count;
	}
	draw_set_color(c_aqua);
	draw_text(skills_x, 342, "Free Skill Slots: " + string(free_remaining));

	// Species choices tracker
if (variable_struct_exists(cc, "species_skill_choice_required")
    && cc.species_skill_choice_required > 0)
{
    draw_set_color(c_black);
    draw_rectangle(
        skills_x - 140,
        910,
        skills_x + 140,
        950,
        false
    );

    draw_set_color(c_white);
    draw_rectangle(
        skills_x - 140,
        910,
        skills_x + 140,
        950,
        true
    );

    draw_set_color(c_white);

    draw_text(
        skills_x,
        920,
        "Species Skill Choices: "
        + string(cc.species_skill_choice_remaining)
        + " / "
        + string(cc.species_skill_choice_required)
    );
}
	
	// Current table
draw_set_color(c_ltgray);
if (cc.selected_table != "")
    draw_text(skills_x, 358, "Current Table: " + cc.selected_table);
else
    draw_text(skills_x, 358, "Current Table: —");


    draw_set_halign(fa_left);

    // Early exits
    if (cc.selected_table == "" || !cc.generation.tables_locked)
    {
        draw_set_halign(fa_center);
        draw_set_color(c_ltgray);
        draw_text(skills_x, 380, "(Lock tables first, then select a table)");
        draw_set_halign(fa_left);
        return;
    }

    if (!variable_struct_exists(global.knowledge_table_data, cc.selected_table))
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];
    var display_y = 385;

    // ===== BUILD LIST =====
    var all_entries = [];
    var seen = {};

    // Fixed skills
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
                    if (array_contains(table_data.skills, f.name) || array_contains(table_data.skills, string_replace_all(f.name, " (X)", "")))
                    {
                        array_push(all_entries, {
                            name: f.name,
                            rank: f.rank,
                            is_fixed: true,
                            is_specialization: false
                        });
                        seen[$ f.name] = true;
                    }
                }
            }
        }
    }

    // Table skills + specializations
    for (var i = 0; i < array_length(table_data.skills); i++)
    {
        var skill_name = table_data.skills[i];
        if (!variable_struct_exists(seen, skill_name))
        {
            array_push(all_entries, {
                name: skill_name,
                is_specialization: false,
                is_fixed: false
            });
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

    // ===== DRAW ENTRIES (centered under title) =====
    var total_cols = 2;
    var start_x = skills_x - (total_cols * col_width) * 0.5 + 10;

    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;

        var draw_x = start_x + col * col_width;
        var draw_y = display_y + row * (row_h + row_gap);

        var has_free_rank = variable_struct_exists(cc.free_skill_ranks, entry.name)
            && cc.free_skill_ranks[$ entry.name] > 0;
        var is_hovered = (cc.hovered_skill == entry.name);
        var is_fixed = variable_struct_exists(cc.fixed_skills, entry.name)
            || (variable_struct_exists(entry, "is_fixed") && entry.is_fixed);
		var is_choice_opt = skill_is_species_choice_option(cc, entry.name);
		if (!is_choice_opt && variable_struct_exists(entry, "is_specialization") && entry.is_specialization)
		{
		    var paren = string_pos(" (", entry.name);
		    if (paren > 0)
		    {
		        var parent = string_copy(entry.name, 1, paren - 1) + " (X)";
		        is_choice_opt = skill_is_species_choice_option(cc, parent);
		    }
		}

		var has_choice_left = variable_struct_exists(cc, "species_skill_choice_remaining")
		    && cc.species_skill_choice_remaining > 0;

        // Background
        if (is_hovered)
            draw_set_color(make_color_rgb(60, 55, 25));
        else if (is_fixed)
            draw_set_color(make_color_rgb(20, 50, 25));
		else if (is_choice_opt && has_choice_left)
			draw_set_color(make_color_rgb(183, 135, 0));
		else if (variable_struct_exists(cc, "species_choice_skill_ranks")
		    && variable_struct_exists(cc.species_choice_skill_ranks, entry.name)
		    && cc.species_choice_skill_ranks[$ entry.name] > 0)
		    draw_set_color(make_color_rgb(183, 135, 0));
        else if (variable_struct_exists(cc.free_slot_ranks, entry.name) && cc.free_slot_ranks[$ entry.name] > 0)
            draw_set_color(make_color_rgb(20, 50, 60));
        else if (has_free_rank)
            draw_set_color(make_color_rgb(25, 55, 30));
        else
            draw_set_color(make_color_rgb(28, 28, 28));

        draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + row_h, false);

        // Border
        if (is_hovered)
            draw_set_color(c_yellow);
        else if (is_fixed)
            draw_set_color(c_lime);
        else if (variable_struct_exists(cc.free_slot_ranks, entry.name) && cc.free_slot_ranks[$ entry.name] > 0)
            draw_set_color(c_aqua);
        else if (has_free_rank)
            draw_set_color(c_lime);
		else if (is_choice_opt && has_choice_left)
			draw_set_color(make_color_rgb(211, 175, 55));
		else if (variable_struct_exists(cc, "species_choice_skill_ranks")
		    && variable_struct_exists(cc.species_choice_skill_ranks, entry.name)
		    && cc.species_choice_skill_ranks[$ entry.name] > 0)
		    draw_set_color(make_color_rgb(211, 175, 55));
        else
            draw_set_color(c_dkgray);

        draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + row_h, true);

        // Text
        if (is_hovered)
            draw_set_color(c_yellow);
        else if (is_fixed)
            draw_set_color(c_lime);
        else if (variable_struct_exists(cc.free_slot_ranks, entry.name) && cc.free_slot_ranks[$ entry.name] > 0)
            draw_set_color(c_aqua);
        else if (has_free_rank)
            draw_set_color(c_lime);
        else if (entry.is_specialization)
            draw_set_color(c_white);
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
            draw_text(draw_x + 6, draw_y + 3, display_name + " (" + string(rank) + ")");
        }
        else
        {
            var base_skill = string_replace_all(entry.name, " (X)", "");
            var rank = get_skill_rank(cc, base_skill);

            if (rank == 0)
            {
                if (variable_struct_exists(cc.skill_ranks, base_skill))
                    draw_text(draw_x + 6, draw_y + 3, entry.name + " (0)");
                else
                    draw_text(draw_x + 6, draw_y + 3, entry.name + " (U)");
            }
            else if (string_pos(" (X)", entry.name) > 0)
                draw_text(draw_x + 6, draw_y + 3, entry.name);
            else
                draw_text(draw_x + 6, draw_y + 3, entry.name + " (" + string(rank) + ")");
        }

        // Hover
        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + box_w, draw_y + row_h))
            cc.hovered_skill = entry.name;
    }
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


function handle_locked_table_selection(cc, L, mx, my, clicked, tables_x)
{
    if (tables_x == undefined)
        tables_x = L.center_x;

    var yy = 320;
    var btn_w = 260;
    var btn_h = 34;
    var row_gap = 8;
    var start_y = yy + 80;
    var btn_x = tables_x - btn_w * 0.5;

    var tables = get_all_knowledge_tables();

    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];
        var btn_y = start_y + i * (btn_h + row_gap);

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
var trained = skill_is_trained(cc, hovered_key);

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
        var total_check = variable_struct_exists(info, "total") ? info.total : 0;
		var cannot_test = false;

			if (trained)
			{
			    total_check += rank;
			}
			else
			{
			    if (skill.difficulty == SKILL_DIFFICULTY.SIMPLE)
			        total_check -= 4;
			    else if (skill.difficulty == SKILL_DIFFICULTY.INTERMEDIATE)
			        total_check -= 4;
			    else if (skill.difficulty == SKILL_DIFFICULTY.ADVANCED)
			        cannot_test = true;
			}

        var check_line;

		if (cannot_test)
		{
		    check_line = "Check: Cannot test untrained";
		}
		else
		{
		    check_line = "Check: " + string(total_check) + " (" +
        (variable_struct_exists(info, "attribute") ? info.attribute : "None") + " " +
        string(get_final_attribute(cc, info.attribute));
		}

        if (variable_struct_exists(info, "modifier"))
        {
            if (info.modifier >= 0)
                check_line += " + Mod +" + string(info.modifier);
            else
                check_line += " + Mod " + string(info.modifier);
        }

        if (!trained)
		{
		    if (skill.difficulty == SKILL_DIFFICULTY.SIMPLE ||
		        skill.difficulty == SKILL_DIFFICULTY.INTERMEDIATE)
		    {
		        check_line += " - 4 (Untrained))";
		    }
		    else
		    {
		        check_line += " - Untrained)";
		    }
		}
		else
		{
		    check_line += " + Rank " + string(rank) + ")";
		}
        tooltip_text += check_line + "\n\n";
    }

    tooltip_text += "Attributes:\n";
    if (!is_undefined(info) && variable_struct_exists(info, "attribute"))
    {
        var attr = info.attribute;
        var mod_val = variable_struct_exists(info, "modifier") ? info.modifier : 0;
        var attr_value = get_final_attribute(cc, attr);
      
        var line = " " + attr;
        
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

            draw_set_color(is_hovered ? c_yellow : c_white);
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



function skill_is_trained(cc, skill_name)
{
    return variable_struct_exists(cc.skill_ranks, skill_name);
}



function get_intelligence_slots(cc)
{
    var val = get_final_attribute(cc, "Intelligence");

    if (val >= 10)
        return 20 + (val - 10);
    else
        return 20 + ceil((val - 10) / 2);

    if (val <= 0)
        return 0;
}



function get_talent_rank(cc, talent_name)
{
    if (!variable_struct_exists(cc.talent_ranks, talent_name))
        return -1;   // not owned
    return cc.talent_ranks[$ talent_name];
}

function set_talent_rank(cc, talent_name, rank)
{
    if (rank < 0)
    {
        if (variable_struct_exists(cc.talent_ranks, talent_name))
            variable_struct_remove(cc.talent_ranks, talent_name);
    }
    else
    {
        cc.talent_ranks[$ talent_name] = rank;
    }
}


function refund_skill_table_discount(cc, table_name)
{
    show_debug_message("=== skill discount for table: " + table_name);

    if (!variable_struct_exists(global.knowledge_table_data, table_name))
        return;

    var table_data = global.knowledge_table_data[$ table_name];
    if (!variable_struct_exists(table_data, "skills"))
        return;

    if (!variable_struct_exists(cc, "skill_ranks"))
        return;

    var refunded = 0;
    var keys = variable_struct_get_names(cc.skill_ranks);

    for (var i = 0; i < array_length(keys); i++)
    {
        var key = keys[i];

        // Does this skill belong to this table?
        var belongs = false;
        for (var j = 0; j < array_length(table_data.skills); j++)
        {
            var listed = table_data.skills[j];
            var base_clean = string_replace_all(listed, " (X)", "");

            if (key == listed || key == base_clean || string_pos(base_clean, key) == 1)
            {
                belongs = true;
                break;
            }
        }
        if (!belongs)
            continue;

        var rank = get_skill_rank(cc, key);
        // Owned skills start at rank 0 → that is 1 purchase
        var purchases = rank + 1;

        // Free ranks (do not refund discount for these)
        var free_count = 0;
        if (variable_struct_exists(cc, "free_skill_ranks")
            && variable_struct_exists(cc.free_skill_ranks, key))
            free_count += cc.free_skill_ranks[$ key];

        if (variable_struct_exists(cc, "free_slot_ranks")
            && variable_struct_exists(cc.free_slot_ranks, key))
            free_count += cc.free_slot_ranks[$ key];

        var paid = purchases - free_count;
        if (paid <= 0)
            continue;

        show_debug_message("  " + key + " rank=" + string(rank)
            + " purchases=" + string(purchases)
            + " free=" + string(free_count)
            + " paid=" + string(paid));

        refunded += paid;
    }

    if (refunded > 0)
    {
        cc.generation_slots_remaining += refunded;
        show_debug_message("Skill discount +" + string(refunded) + " for table " + table_name);
    }
    else
    {
        show_debug_message("  no refund issued");
    }
}

function reclaim_skill_table_discount(cc, table_name)
{
    if (!variable_struct_exists(global.knowledge_table_data, table_name))
        return;

    var table_data = global.knowledge_table_data[$ table_name];
    if (!variable_struct_exists(table_data, "skills"))
        return;

    if (!variable_struct_exists(cc, "skill_ranks"))
        return;

    var reclaimed = 0;
    var keys = variable_struct_get_names(cc.skill_ranks);

    for (var i = 0; i < array_length(keys); i++)
    {
        var key = keys[i];

        var belongs = false;
        for (var j = 0; j < array_length(table_data.skills); j++)
        {
            var listed = table_data.skills[j];
            var base_clean = string_replace_all(listed, " (X)", "");

            if (key == listed || key == base_clean || string_pos(base_clean, key) == 1)
            {
                belongs = true;
                break;
            }
        }
        if (!belongs)
            continue;

        var rank = get_skill_rank(cc, key);
        var purchases = rank + 1;

        var free_count = 0;
        if (variable_struct_exists(cc, "free_skill_ranks")
            && variable_struct_exists(cc.free_skill_ranks, key))
            free_count += cc.free_skill_ranks[$ key];

        if (variable_struct_exists(cc, "free_slot_ranks")
            && variable_struct_exists(cc.free_slot_ranks, key))
            free_count += cc.free_slot_ranks[$ key];

        var paid = purchases - free_count;
        if (paid <= 0)
            continue;

        reclaimed += paid;
    }

    if (reclaimed > 0)
    {
        cc.generation_slots_remaining -= reclaimed;
        show_debug_message("Skill discount reclaimed -" + string(reclaimed) + " for table " + table_name);
    }
}

function attempt_talent_rank_up(cc, talent_name, table)
{
    show_debug_message("RANK UP attempt: " + talent_name);

    if (!variable_struct_exists(global.talent_data, talent_name))
    {
        show_debug_message("  FAIL: talent_data missing for " + talent_name);
        return;
    }

    var talent = global.talent_data[$ talent_name];
    var current = get_talent_rank(cc, talent_name);
    show_debug_message("  current rank: " + string(current) + "  ranked: " + string(talent.ranked));

    // Binary talents can only ever reach rank 0
    if (!talent.ranked && current >= 0)
    {
        show_debug_message("  FAIL: binary already owned");
        return;
    }

	// Restricted species talent choice first
if (talent_is_species_choice_option(cc, talent_name)
    && variable_struct_exists(cc, "species_talent_choice_remaining")
    && cc.species_talent_choice_remaining > 0
    && current < 0)
{
    cc.species_talent_choice_remaining--;
    set_talent_rank(cc, talent_name, 0);
    if (!array_contains(cc.free_slot_talents, talent_name))
        array_push(cc.free_slot_talents, talent_name);
    show_debug_message("Species talent choice: " + talent_name);
    return;
}
	
    // Free slots
    if (current < 0
    && !species_talent_choices_are_restricted(cc)
    && variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation, "knowledge_talents")
            && variable_struct_exists(species.creation.knowledge_talents, "choices"))
        {
            var remaining = species.creation.knowledge_talents.choices.count;
            show_debug_message("  free slots: " + string(remaining));
            if (remaining > 0)
            {
                species.creation.knowledge_talents.choices.count--;
                set_talent_rank(cc, talent_name, 0);
                if (!array_contains(cc.free_slot_talents, talent_name))
                    array_push(cc.free_slot_talents, talent_name);
                show_debug_message("  SUCCESS: used free slot");
                return;
            }
        }
    }

    // Character points
    var owns_table = table_is_owned(cc, table);
    var cost = owns_table ? 1 : 2;
    show_debug_message("  owns table: " + string(owns_table) + "  cost: " + string(cost) + "  slots left: " + string(cc.generation_slots_remaining));

    if (cc.generation_slots_remaining < cost)
    {
        show_debug_message("  FAIL: not enough slots");
        return;
    }

    cc.generation_slots_remaining -= cost;
    if (current < 0)
        set_talent_rank(cc, talent_name, 0);
    else
        set_talent_rank(cc, talent_name, current + 1);

    show_debug_message("  SUCCESS: rank now " + string(get_talent_rank(cc, talent_name)));
}

function attempt_talent_rank_down(cc, talent_name)
{
    var current = get_talent_rank(cc, talent_name);
    if (current < 0) return;

    var is_free = array_contains(cc.free_slot_talents, talent_name);

    if (is_free && current == 0)
	{
	    set_talent_rank(cc, talent_name, -1);
	    var index = array_index_of(cc.free_slot_talents, talent_name);
	    if (index != -1)
	        array_delete(cc.free_slot_talents, index, 1);

	    if (talent_is_species_choice_option(cc, talent_name)
	        && variable_struct_exists(cc, "species_talent_choice_remaining"))
	    {
	        cc.species_talent_choice_remaining++;
	    }
	    else if (variable_struct_exists(cc, "locked_species"))
	    {
	        var species = global.species_data[$ cc.locked_species];
	        if (!species_talent_choices_are_restricted(cc)
	            && variable_struct_exists(species.creation, "knowledge_talents")
	            && variable_struct_exists(species.creation.knowledge_talents, "choices"))
	        {
	            species.creation.knowledge_talents.choices.count++;
	        }
	    }
	}
    else
    {
        // Refund character points
        var owns_table = false;
        if (variable_struct_exists(global.talent_data, talent_name))
        {
            var talent = global.talent_data[$ talent_name];
            if (variable_struct_exists(talent, "table"))
                owns_table = table_is_owned(cc, talent.table);
        }
        var refund = owns_table ? 1 : 2;

        cc.generation_slots_remaining += refund;

        if (current == 0)
            set_talent_rank(cc, talent_name, -1);
        else
            set_talent_rank(cc, talent_name, current - 1);
    }
}


function draw_talents_column(cc, L, talents_x = undefined)
{
    if (talents_x == undefined)
        talents_x = L.center_x + 660;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // ===== LAYOUT =====
    var col_width = 280;
    var max_rows_per_col = 16;
    var row_h = 26;
    var row_gap = 6;
    var box_w = 260;
    var total_cols = 2;

    // Double-width panel
    var panel_w = col_width * total_cols + 40;
    var panel_x = talents_x - panel_w * 0.5;
    var panel_y = 305;
    var panel_h = 600;

    // Outer panel
    draw_set_color(c_black);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

    // Header
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(talents_x, 318, "TALENTS");

    // Free Talent slots
    var remaining = 0;
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation, "knowledge_talents")
            && variable_struct_exists(species.creation.knowledge_talents, "choices"))
            remaining = species.creation.knowledge_talents.choices.count;
    }
    draw_set_color(c_aqua);
    draw_text(talents_x, 342, "Free Talent Slots: " + string(remaining));
	
	draw_set_color(c_ltgray);
if (cc.selected_table != "")
    draw_text(talents_x, 358, "Current Table: " + cc.selected_table);
else
    draw_text(talents_x, 358, "Current Table: —");

draw_set_halign(fa_left);

    // Early exits
    if (cc.selected_table == "" || !cc.generation.tables_locked)
    {
        draw_set_halign(fa_center);
        draw_set_color(c_ltgray);
        draw_text(talents_x, 380, "(Lock tables first, then select a table)");
        draw_set_halign(fa_left);
        return;
    }

    if (!variable_struct_exists(global.knowledge_table_data, cc.selected_table))
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];
    if (!variable_struct_exists(table_data, "talents"))
        return;

    var display_y = 385;
    var all_entries = [];
    var seen = {};

    // Fixed talents
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation, "knowledge_talents")
            && variable_struct_exists(species.creation.knowledge_talents, "fixed"))
        {
            var fixed = species.creation.knowledge_talents.fixed;
            for (var i = 0; i < array_length(fixed); i++)
            {
                var t_name = fixed[i];
                if (!variable_struct_exists(seen, t_name)
                    && array_contains(table_data.talents, t_name))
                {
                    array_push(all_entries, { name: t_name, is_fixed: true });
                    seen[$ t_name] = true;
                }
            }
        }
    }

    // Table talents
    for (var i = 0; i < array_length(table_data.talents); i++)
    {
        var t_name = table_data.talents[i];
        if (!variable_struct_exists(seen, t_name))
        {
            array_push(all_entries, { name: t_name, is_fixed: false });
            seen[$ t_name] = true;
        }
    }
	
	var tch = get_species_talent_choices(cc);
if (tch != undefined && variable_struct_exists(tch, "options") && is_array(tch.options))
{
    for (var i = 0; i < array_length(tch.options); i++)
    {
        var t_name = tch.options[i];
        if (!variable_struct_exists(seen, t_name))
        {
            array_push(all_entries, { name: t_name, is_fixed: false, is_choice_opt: true });
            seen[$ t_name] = true;
        }
    }
}

    // ===== DRAW ENTRIES (2 columns) =====
    var start_x = talents_x - (total_cols * col_width) * 0.5 + 10;

    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;

        var draw_x = start_x + col * col_width;
        var draw_y = display_y + row * (row_h + row_gap);

        var rank = get_talent_rank(cc, entry.name);
        var is_hovered = (cc.hovered_talent == entry.name);
        var is_fixed = entry.is_fixed;
        var is_free = array_contains(cc.free_slot_talents, entry.name);
		var is_choice_opt = talent_is_species_choice_option(cc, entry.name);
var has_choice_left = variable_struct_exists(cc, "species_talent_choice_remaining")
    && cc.species_talent_choice_remaining > 0;

        // Background
        if (is_hovered)
            draw_set_color(make_color_rgb(60, 55, 25));
        else if (is_fixed)
            draw_set_color(make_color_rgb(20, 50, 25));
        else if (is_free)
            draw_set_color(make_color_rgb(20, 50, 60));
		else if (is_choice_opt && has_choice_left)
		    draw_set_color(make_color_rgb(255, 105, 180));
		else if (is_free)
		    draw_set_color(make_color_rgb(20, 50, 60));
        else
            draw_set_color(make_color_rgb(28, 28, 28));
			

        draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + row_h, false);

        // Border
        if (is_hovered)
            draw_set_color(c_yellow);
        else if (is_fixed)
            draw_set_color(c_lime);
        else if (is_free)
            draw_set_color(c_aqua);
        else
            draw_set_color(c_dkgray);

        draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + row_h, true);

        // Text
        if (is_hovered)
            draw_set_color(c_yellow);
        else if (is_fixed)
            draw_set_color(c_lime);
        else if (is_free)
            draw_set_color(c_aqua);
        else
            draw_set_color(c_white);

        var label = entry.name;
        if (rank >= 0)
        {
            var talent = global.talent_data[$ entry.name];
            if (talent != undefined && talent.ranked)
                label += " (" + string(rank) + ")";
            else
                label += " (Owned)";
        }
        else
        {
            label += " (U)";
        }

        draw_text(draw_x + 6, draw_y + 3, label);

        // Hover
        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + box_w, draw_y + row_h))
		{
            cc.hovered_talent = entry.name;
			}
    }
}


function handle_talent_list(cc, L, mx, my, clicked, right_clicked, talents_x = undefined)
{
    if (cc.selected_table == "" || !cc.generation.tables_locked)
        return;

    if (!variable_struct_exists(global.knowledge_table_data, cc.selected_table))
        return;

    var table_data = global.knowledge_table_data[$ cc.selected_table];
    if (!variable_struct_exists(table_data, "talents"))
        return;

    // Use the same x that draw uses
    if (talents_x == undefined)
        talents_x = L.center_x + 660;

    var col_width = 280;
    var max_rows_per_col = 16;
    var row_h = 26;
    var row_gap = 6;
    var box_w = 260;
    var total_cols = 2;
    var display_y = 385;
    var start_x = talents_x - (total_cols * col_width) * 0.5 + 10;

    // ===== BUILD SAME LIST AS DRAW =====
    var all_entries = [];
    var seen = {};

    // Fixed talents from species
    if (variable_struct_exists(cc, "locked_species"))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species.creation, "knowledge_talents")
            && variable_struct_exists(species.creation.knowledge_talents, "fixed"))
        {
            var fixed = species.creation.knowledge_talents.fixed;
            for (var i = 0; i < array_length(fixed); i++)
            {
                var t_name = fixed[i];
                if (!variable_struct_exists(seen, t_name)
                    && array_contains(table_data.talents, t_name))
                {
                    array_push(all_entries, { name: t_name, is_fixed: true });
                    seen[$ t_name] = true;
                }
            }
        }
    }

    // Table talents
    for (var i = 0; i < array_length(table_data.talents); i++)
    {
        var t_name = table_data.talents[i];
        if (!variable_struct_exists(seen, t_name))
        {
            array_push(all_entries, { name: t_name, is_fixed: false });
            seen[$ t_name] = true;
        }
    }
	
	var tch = get_species_talent_choices(cc);
if (tch != undefined && variable_struct_exists(tch, "options") && is_array(tch.options))
{
    for (var i = 0; i < array_length(tch.options); i++)
    {
        var t_name = tch.options[i];
        if (!variable_struct_exists(seen, t_name))
        {
            array_push(all_entries, { name: t_name, is_fixed: false, is_choice_opt: true });
            seen[$ t_name] = true;
        }
    }
}

    // ===== CLICK / HOVER =====
    for (var i = 0; i < array_length(all_entries); i++)
    {
        var entry = all_entries[i];
        var col = i div max_rows_per_col;
        var row = i mod max_rows_per_col;

        var draw_x = start_x + col * col_width;
        var draw_y = display_y + row * (row_h + row_gap);

        if (point_in_rectangle(mx, my, draw_x, draw_y, draw_x + box_w, draw_y + row_h))
        {
            cc.hovered_talent = entry.name;

            if (entry.is_fixed)
                return; // cannot buy/sell fixed talents

            if (clicked)
                attempt_talent_rank_up(cc, entry.name, cc.selected_table);
            else if (right_clicked)
                attempt_talent_rank_down(cc, entry.name);

            return;
        }
    }
}


function draw_talent_tooltip(cc)
{
    if (!variable_struct_exists(cc, "hovered_talent"))
        return;

    if (cc.hovered_talent == undefined || cc.hovered_talent == "")
        return;

    if (!variable_struct_exists(global.talent_data, cc.hovered_talent))
        return;

    var talent = global.talent_data[$ cc.hovered_talent];
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // ===== BUILD TEXT =====
    var tooltip_text = cc.hovered_talent + "\n\n";

    // Type
    if (variable_struct_exists(talent, "ranked") && talent.ranked)
        tooltip_text += "Type: Ranked\n";
    else
        tooltip_text += "Type: Unranked\n";

    // Difficulty
    var diff_name = "Unknown";
    if (variable_struct_exists(talent, "difficulty"))
    {
        if (talent.difficulty == global.SKILL_SIMPLE)
            diff_name = "SIMPLE";
        else if (talent.difficulty == global.SKILL_INTERMEDIATE)
            diff_name = "INTERMEDIATE";
        else if (talent.difficulty == global.SKILL_ADVANCED)
            diff_name = "ADVANCED";
    }
    tooltip_text += "Difficulty: " + diff_name + "\n\n";

    // Description
    if (variable_struct_exists(talent, "description"))
        tooltip_text += talent.description;
    else
        tooltip_text += "No description.";

    // ===== SIZE (expands with content) =====
    var tooltip_w = 360;
    var line_sep = 20;
    var pad = 15;
    var tooltip_h = string_height_ext(tooltip_text, line_sep, tooltip_w - pad * 2) + pad * 2;

    // Keep on screen
    var box_x = mx + 20;
    var box_y = my + 20;
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    if (box_x + tooltip_w > gui_w - 8)
        box_x = mx - tooltip_w - 20;
    if (box_y + tooltip_h > gui_h - 8)
        box_y = my - tooltip_h - 20;
    if (box_y < 8)
        box_y = 8;
    if (box_x < 8)
        box_x = 8;

    // ===== DRAW =====
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + tooltip_w, box_y + tooltip_h, false);

    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + tooltip_w, box_y + tooltip_h, true);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_text_ext(box_x + pad, box_y + pad, tooltip_text, line_sep, tooltip_w - pad * 2);
}



function draw_generation_help_box()
{
    var box_x = 20;
    var box_y = 20;
    var box_w = 360;

    var text =
        "GENERATION TIPS\n\n"
        + "- Lock tables, then pick one to browse\n"
        + "- Left click skill/talent = buy rank\n"
        + "- Right click = refund rank\n"
        + "- Owned tables cost 1 slot per rank\n"
        + "- Unowned tables cost 2 slots\n"
        + "- Free skill/talent slots spend first\n"
        + "- CDT / Gold also use slots\n\n"
        + "R = Random spend remaining points";

    var pad = 12;
    var line_sep = 18;
    var box_h = string_height_ext(text, line_sep, box_w - pad * 2) + pad * 2;

    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_ltgray);
    draw_text_ext(box_x + pad, box_y + pad, text, line_sep, box_w - pad * 2);
}



function generation_random_spend(cc)
{
    if (!is_struct(cc)) return;
    if (!variable_struct_exists(cc, "generation")) return;

    // Prefer locked tables so skill/talent costs stay at 1
    if (!cc.generation.tables_locked)
        cc.generation.tables_locked = true;

    var tables = get_all_knowledge_tables();
    if (array_length(tables) == 0) return;

    // Ensure a selected table
    if (cc.selected_table == "" || cc.selected_table == undefined)
        cc.selected_table = tables[irandom(array_length(tables) - 1)];

    var safety = 200; // prevent infinite loops

    while (cc.generation_slots_remaining > 0 && safety > 0)
    {
        safety--;

        var roll = irandom(99);
        var spent = false;

        // 15% — CDT
        if (roll < 15 && cc.generation_slots_remaining > 0)
        {
            var current_cdt = get_current_cdt(cc);
            if (current_cdt + 1 <= get_cdt_cap(cc))
            {
                cc.generation.cdt_bonus++;
                cc.generation_slots_remaining--;
                spent = true;
            }
        }
        // 15% — Gold
        else if (roll < 30 && cc.generation_slots_remaining > 0)
        {
            cc.generation.gold_bonus += 20;
            cc.generation_slots_remaining--;
            spent = true;
        }
        // 15% — buy an extra table (if affordable)
        else if (roll < 45 && cc.generation_slots_remaining >= 2)
        {
            var t = tables[irandom(array_length(tables) - 1)];
            if (!table_is_owned(cc, t)
                && array_index_of(cc.generation.fixed_tables, t) == -1)
            {
                array_push(cc.generation.purchased_tables, t);
                cc.generation_slots_remaining -= 2;
                refund_skill_table_discount(cc, t);
                refund_talent_table_discount(cc, t);
                spent = true;
            }
        }
        // 35% — random skill rank on selected / random owned table
        else if (roll < 80)
        {
            var skill_table = cc.selected_table;
            if (!table_is_owned(cc, skill_table))
            {
                // pick a random owned table if possible
                var owned = [];
                for (var i = 0; i < array_length(tables); i++)
                    if (table_is_owned(cc, tables[i]))
                        array_push(owned, tables[i]);
                if (array_length(owned) > 0)
                    skill_table = owned[irandom(array_length(owned) - 1)];
            }

            if (variable_struct_exists(global.knowledge_table_data, skill_table))
            {
                var td = global.knowledge_table_data[$ skill_table];
                if (variable_struct_exists(td, "skills") && array_length(td.skills) > 0)
                {
                    var sname = td.skills[irandom(array_length(td.skills) - 1)];
                    var before = cc.generation_slots_remaining;
                    // Skip required-spec bases for auto (popup would block)
                    var sdata = global.skill_data[$ sname];
                    if (sdata == undefined)
                        sdata = global.skill_data[$ string_replace_all(sname, " (X)", "")];
                    var is_spec_req = (sdata != undefined
                        && variable_struct_exists(sdata, "specialization")
                        && sdata.specialization.required);

                    if (!is_spec_req)
                    {
                        attempt_skill_rank_up(cc, sname, string_replace_all(sname, " (X)", ""), skill_table);
                        if (cc.generation_slots_remaining < before)
                            spent = true;
                    }
                }
            }
        }
        // 20% — random talent
        else
        {
            var talent_table = cc.selected_table;
            if (variable_struct_exists(global.knowledge_table_data, talent_table))
            {
                var td = global.knowledge_table_data[$ talent_table];
                if (variable_struct_exists(td, "talents") && array_length(td.talents) > 0)
                {
                    var tname = td.talents[irandom(array_length(td.talents) - 1)];
                    var before = cc.generation_slots_remaining;
                    attempt_talent_rank_up(cc, tname, talent_table);
                    if (cc.generation_slots_remaining < before)
                        spent = true;
                }
            }
        }

        // If this roll couldn't spend, try a forced cheap skill next loop
        if (!spent && cc.generation_slots_remaining > 0)
        {
            // last resort: gold is always valid
            cc.generation.gold_bonus += 20;
            cc.generation_slots_remaining--;
        }
    }

    show_debug_message("Random spend done. Slots left: " + string(cc.generation_slots_remaining));
}


function get_species_skill_choices(cc)
{
    if (!variable_struct_exists(cc, "locked_species")) return undefined;
    if (!variable_struct_exists(global.species_data, cc.locked_species)) return undefined;
    var sp = global.species_data[$ cc.locked_species];
    if (!variable_struct_exists(sp.creation, "knowledge_skills")) return undefined;
    if (!variable_struct_exists(sp.creation.knowledge_skills, "choices")) return undefined;
    return sp.creation.knowledge_skills.choices;
}

function get_species_talent_choices(cc)
{
    if (!variable_struct_exists(cc, "locked_species")) return undefined;
    if (!variable_struct_exists(global.species_data, cc.locked_species)) return undefined;
    var sp = global.species_data[$ cc.locked_species];
    if (!variable_struct_exists(sp.creation, "knowledge_talents")) return undefined;
    if (!variable_struct_exists(sp.creation.knowledge_talents, "choices")) return undefined;
    return sp.creation.knowledge_talents.choices;
}

function name_matches_option(entry_name, option_name)
{
    var a = string_replace_all(entry_name, " (X)", "");
    var b = string_replace_all(option_name, " (X)", "");
    return (entry_name == option_name || a == b || entry_name == b || a == option_name);
}

function skill_is_species_choice_option(cc, skill_key)
{
    var ch = get_species_skill_choices(cc);
    if (ch == undefined || !variable_struct_exists(ch, "options")) return false;
    for (var i = 0; i < array_length(ch.options); i++)
        if (name_matches_option(skill_key, ch.options[i]))
            return true;
    return false;
}

function talent_is_species_choice_option(cc, talent_key)
{
    var ch = get_species_talent_choices(cc);
    if (ch == undefined || !variable_struct_exists(ch, "options")) return false;
    for (var i = 0; i < array_length(ch.options); i++)
        if (name_matches_option(talent_key, ch.options[i]))
            return true;
    return false;
}

function generation_init_species_choices(cc)
{
    if (variable_struct_exists(cc, "species_choices_initialized")
        && cc.species_choices_initialized)
        return;

    cc.species_skill_choice_required = 0;
    cc.species_skill_choice_remaining = 0;
    cc.species_talent_choice_required = 0;
    cc.species_talent_choice_remaining = 0;

    if (variable_struct_exists(cc, "locked_species")
        && variable_struct_exists(global.species_data, cc.locked_species))
    {
        var sp = global.species_data[$ cc.locked_species];

        if (variable_struct_exists(sp.creation, "knowledge_skills")
            && variable_struct_exists(sp.creation.knowledge_skills, "choices")
            && variable_struct_exists(sp.creation.knowledge_skills.choices, "count"))
        {
            var n = sp.creation.knowledge_skills.choices.count;
            cc.species_skill_choice_required = n;
            cc.species_skill_choice_remaining = n;
        }

        if (variable_struct_exists(sp.creation, "knowledge_talents")
            && variable_struct_exists(sp.creation.knowledge_talents, "choices")
            && variable_struct_exists(sp.creation.knowledge_talents.choices, "count"))
        {
            var n = sp.creation.knowledge_talents.choices.count;
            cc.species_talent_choice_required = n;
            cc.species_talent_choice_remaining = n;
        }
    }

    cc.species_choices_initialized = true;
}




function species_skill_choices_are_restricted(cc)
{
    var ch = get_species_skill_choices(cc);
    return (ch != undefined
        && variable_struct_exists(ch, "options")
        && is_array(ch.options)
        && array_length(ch.options) > 0);
}

function species_talent_choices_are_restricted(cc)
{
    var ch = get_species_talent_choices(cc);
    return (ch != undefined
        && variable_struct_exists(ch, "options")
        && is_array(ch.options)
        && array_length(ch.options) > 0);
}


function get_species_choice_skill_for_specialization(cc, skill_key)
{
    // =====================================================
    // 1. Direct species-choice skill
    // =====================================================

    if (skill_is_species_choice_option(cc, skill_key))
        return skill_key;


    // =====================================================
    // 2. Look through skills with specializations
    // =====================================================

    var skill_names = variable_struct_get_names(global.skill_data);

    for (var i = 0; i < array_length(skill_names); i++)
    {
        var parent_key = skill_names[i];
        var skill_data = global.skill_data[$ parent_key];

        if (!variable_struct_exists(skill_data, "specialization"))
            continue;

        if (!variable_struct_exists(
            skill_data.specialization,
            "choices"
        ))
            continue;


        var choices = skill_data.specialization.choices;

        // Make sure choices is an array
        if (!is_array(choices))
            continue;


        // =================================================
        // 3. Check each specialization
        // =================================================

        for (var j = 0; j < array_length(choices); j++)
        {
            var specialization_name = choices[j];

            var specialized_key =
                string_replace_all(
                    parent_key,
                    "(X)",
                    "(" + specialization_name + ")"
                );

            if (specialized_key == skill_key)
            {
                // =================================================
                // 4. Parent must actually be a species-choice skill
                // =================================================

                if (skill_is_species_choice_option(cc, parent_key))
                    return parent_key;

                return undefined;
            }
        }
    }


    // =====================================================
    // No species-choice parent found
    // =====================================================

    return undefined;
}