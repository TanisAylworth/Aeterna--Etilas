function generation_step_update(cc)
{
    var L = generation_layout(cc);

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var clicked = mouse_check_button_pressed(mb_left);

    // =================================================
    // SHARED COORDS (MUST MATCH DRAW)
    // =================================================

    var cdt_x  = L.center_x - L.panel_spacing;
    var gold_x = L.center_x + L.panel_spacing;

    var btn_y = L.top_y + 55;
    var half_w = L.panel_w * 0.5;

    // =================================================
    // CDT HITBOXES
    // =================================================

    var cdt_minus_l = cdt_x - half_w;
    var cdt_minus_r = cdt_x - L.btn_gap;

    var cdt_plus_l = cdt_x + L.btn_gap;
    var cdt_plus_r = cdt_x + half_w;

    var cdt_h = L.btn_h;

    cc.generation_hover.cdt_minus =
        point_in_rectangle(
            mx,
            my,
            cdt_minus_l,
            btn_y,
            cdt_minus_r,
            btn_y + cdt_h
        );

    cc.generation_hover.cdt_plus =
        point_in_rectangle(
            mx,
            my,
            cdt_plus_l,
            btn_y,
            cdt_plus_r,
            btn_y + cdt_h
        );

    // =================================================
    // GOLD HITBOXES
    // =================================================

    var g_minus_l = gold_x - half_w;
    var g_minus_r = gold_x - L.btn_gap;

    var g_plus_l = gold_x + L.btn_gap;
    var g_plus_r = gold_x + half_w;

    cc.generation_hover.gold_minus =
        point_in_rectangle(
            mx,
            my,
            g_minus_l,
            btn_y,
            g_minus_r,
            btn_y + cdt_h
        );

    cc.generation_hover.gold_plus =
        point_in_rectangle(
            mx,
            my,
            g_plus_l,
            btn_y,
            g_plus_r,
            btn_y + cdt_h
        );

    // =================================================
    // CDT / GOLD CLICKS
    // =================================================

    if (clicked)
    {
        if (cc.generation_hover.cdt_minus
        && cc.generation.cdt_bonus > 0)
        {
            cc.generation.cdt_bonus--;
            cc.generation_slots_remaining++;
        }

        if (cc.generation_hover.cdt_plus
        && cc.generation_slots_remaining > 0)
        {
            var species_cdt =
                global.species_data[$ cc.locked_species].stats.cdt;

            var toughness_cdt =
                get_toughness_cdt_bonus(cc);

            var current_cdt =
                species_cdt
                + toughness_cdt
                + cc.generation.cdt_bonus;

            if (current_cdt + 1 <= get_cdt_cap(cc))
            {
                cc.generation.cdt_bonus++;
                cc.generation_slots_remaining--;
            }
        }

        if (cc.generation_hover.gold_minus
        && cc.generation.gold_bonus > 0)
        {
            cc.generation.gold_bonus -= 20;
            cc.generation_slots_remaining++;
        }

        if (cc.generation_hover.gold_plus
        && cc.generation_slots_remaining > 0)
        {
            cc.generation.gold_bonus += 20;
            cc.generation_slots_remaining--;
        }
    }

    // =================================================
    // KNOWLEDGE TABLE BUTTONS
    // =================================================
	var col_w = 250;
var col_gap = 90;
var yy = 320;

var tables_x = L.center_x - col_w - col_gap;

var confirm_x = tables_x - 110;
var start_y = yy + 80;

var list_bottom =
    start_y
    + (array_length(get_all_knowledge_tables()) * 36);

var confirm_y = list_bottom + 20;
var confirm_w = 240;
var confirm_h = 30;

// =====================================
// CONFIRM / UNLOCK TABLES
// =====================================

if (clicked)
{
    if (point_in_rectangle(
        mx,
        my,
        confirm_x,
        confirm_y,
        confirm_x + confirm_w,
        confirm_y + confirm_h))
    {
        // Unlock
        if (cc.generation.tables_locked)
        {
            cc.generation.tables_locked = false;
            return;
        }

        // Require all free table picks
        if (cc.generation.table_choices_remaining > 0)
        {
            show_debug_message(
                "Must select all free tables first."
            );
            return;
        }

        // Lock tables
        cc.generation.tables_locked = true;

        return;
    }
}


if (clicked && !cc.generation.tables_locked)
{
    var tables = get_all_knowledge_tables();

    var col_w = 250;
    var col_gap = 90;
    var yy = 320;

    var tables_x = L.center_x - col_w - col_gap;
    var start_y = yy + 80;

    for (var i = 0; i < array_length(tables); i++)
    {
        var table = tables[i];

        var btn_x = tables_x - 120;
        var table_y = start_y + (i * 36);
        var btn_w = 240;
        var btn_h = 30;

        if (!point_in_rectangle(
            mx,
            my,
            btn_x,
            table_y,
            btn_x + btn_w,
            table_y + btn_h))
        {
            continue;
        }

        show_debug_message(
            "TABLE BUTTON HIT: " + table
        );

        var fixed_idx =
            array_index_of(
                cc.generation.fixed_tables,
                table
            );

        var choice_idx =
            array_index_of(
                cc.generation.choice_tables,
                table
            );

        var purchased_idx =
            array_index_of(
                cc.generation.purchased_tables,
                table
            );

        if (fixed_idx != -1)
        {
            return;
        }

        if (choice_idx != -1)
        {
            array_delete(
                cc.generation.choice_tables,
                choice_idx,
                1
            );

            cc.generation.table_choices_remaining++;

            return;
        }

        if (purchased_idx != -1)
        {
            array_delete(
                cc.generation.purchased_tables,
                purchased_idx,
                1
            );

            cc.generation_slots_remaining += 2;

            return;
        }

        if (cc.generation.table_choices_remaining > 0)
        {
            array_push(
                cc.generation.choice_tables,
                table
            );

            cc.generation.table_choices_remaining--;

            return;
        }

        if (cc.generation_slots_remaining >= 2)
        {
            array_push(
                cc.generation.purchased_tables,
                table
            );

            cc.generation_slots_remaining -= 2;

            return;
        }
    }
}

}