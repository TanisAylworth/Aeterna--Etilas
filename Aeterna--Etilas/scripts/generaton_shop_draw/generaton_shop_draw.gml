function generation_shop_draw(step)
{
    var cc = global.char_creation;
    var L = generation_layout(cc);

    // safety init
    if (!variable_struct_exists(cc, "generation_hover"))
    {
        cc.generation_hover = {
            cdt_minus: false,
            cdt_plus: false,
            gold_minus: false,
            gold_plus: false
        };
    }

    var sw = display_get_gui_width();

    // =================================================
    // HEADER
    // =================================================
    draw_set_halign(fa_center);

    draw_text(L.center_x, 40, "CHARACTER GENERATION");

    draw_text(
        L.center_x,
        70,
        "Remaining Slots: "
        + string(cc.generation_slots_remaining)
        + " / "
        + string(cc.generation_slots_total)
    );

    // =================================================
    // GLOBAL PANEL LAYOUT OFFSETS
    // =================================================
    var title_y  = L.top_y;
    var cost_y   = L.top_y + 22;
    var btn_y    = L.top_y + 55;
    var value_y  = L.top_y + 95;

    var half_w = L.panel_w * 0.5;

    // =================================================
    // CENTER POSITIONS
    // =================================================
    var cdt_x  = L.center_x - L.panel_spacing;
    var gold_x = L.center_x + L.panel_spacing;

    // =================================================
    // ================= CDT PANEL ======================
    // =================================================
    draw_set_halign(fa_center);

    draw_text(cdt_x, title_y, "CDT");

    draw_text(
        cdt_x,
        cost_y,
        "Cost: 1 Slots → +1 CDT"
    );
	
    var cdt_minus_l = cdt_x - half_w;
    var cdt_minus_r = cdt_x - L.btn_gap;

    var cdt_plus_l  = cdt_x + L.btn_gap;
    var cdt_plus_r  = cdt_x + half_w;

    draw_set_color(cc.generation_hover.cdt_minus ? c_yellow : c_gray);
    draw_rectangle(cdt_minus_l, btn_y, cdt_minus_r, btn_y + L.btn_h, false);

    draw_set_color(c_black);
    draw_text((cdt_minus_l + cdt_minus_r) * 0.5, btn_y + 7, "-");

    draw_set_color(cc.generation_hover.cdt_plus ? c_yellow : c_gray);
    draw_rectangle(cdt_plus_l, btn_y, cdt_plus_r, btn_y + L.btn_h, false);

    draw_set_color(c_black);
    draw_text((cdt_plus_l + cdt_plus_r) * 0.5, btn_y + 7, "+");

    draw_set_color(c_white);
    draw_text(
        cdt_x,
        value_y,
        "Bonus: +" + string(cc.generation.cdt_bonus)
    );
	
		// =========================
	// CDT CAP DISPLAY
	// =========================

	var cdt_cap = get_cdt_cap(cc);

	draw_set_halign(fa_center);
	draw_set_color(c_white);

	draw_text(
        cdt_x,
        value_y + 40,
	    "Limit: " + string(cdt_cap)
	);

	draw_set_color(c_white);

    // =================================================
    // ================= GOLD PANEL =====================
    // =================================================
    draw_set_halign(fa_center);

    draw_text(gold_x, title_y, "GOLD");

    draw_text(
        gold_x,
        cost_y,
        "Cost: 1 Slot → + 20 Gold Pieces"
    );

    var g_btn_y = btn_y;

    var g_minus_l = gold_x - half_w;
    var g_minus_r = gold_x - L.btn_gap;

    var g_plus_l  = gold_x + L.btn_gap;
    var g_plus_r  = gold_x + half_w;

    draw_set_color(cc.generation_hover.gold_minus ? c_yellow : c_gray);
    draw_rectangle(g_minus_l, g_btn_y, g_minus_r, g_btn_y + L.btn_h, false);

    draw_set_color(c_black);
    draw_text((g_minus_l + g_minus_r) * 0.5, g_btn_y + 7, "-");

    draw_set_color(cc.generation_hover.gold_plus ? c_yellow : c_gray);
    draw_rectangle(g_plus_l, g_btn_y, g_plus_r, g_btn_y + L.btn_h, false);

    draw_set_color(c_black);
    draw_text((g_plus_l + g_plus_r) * 0.5, g_btn_y + 7, "+");

    draw_set_color(c_white);
    draw_text(
        gold_x,
        value_y,
        "Starting Gold: " + string(cc.generation.gold_bonus)
    );

    // =================================================
    // COLUMNS
    // =================================================
    var col_w = 250;
    var col_gap = 90;
    var yy = 320;

    var tables_x  = L.center_x - col_w - col_gap;
    var skills_x  = L.center_x;
    var talents_x = L.center_x + col_w + col_gap;

    draw_set_halign(fa_center);

    // =================================================
// TABLES
// =================================================

draw_set_halign(fa_center);
draw_text(tables_x, yy, "TABLES");

draw_set_halign(fa_left);

var sp = cc.locked_species;
var tables = [];

if (!is_undefined(sp))
{
    if (variable_struct_exists(global.species_data, sp))
    {
        var species = global.species_data[$ sp];

        if (variable_struct_exists(species, "creation"))
        {
            if (variable_struct_exists(species.creation, "knowledge_tables"))
            {
                if (variable_struct_exists(species.creation.knowledge_tables, "options"))
                {
                    tables = species.creation.knowledge_tables.options;
                }
            }
        }
    }
}

var start_y = 360;
var spacing = 22;

for (var i = 0; i < array_length(tables); i++)
{
    var t = tables[i];

    var row_y = start_y + (i * spacing);

    // selected?
    var selected = false;

    for (var j = 0; j < array_length(cc.generation.tables); j++)
    {
        if (cc.generation.tables[j] == t)
        {
            selected = true;
            break;
        }
    }

    draw_set_color(selected ? c_yellow : c_white);

    draw_text(
        tables_x - 100,
        row_y,
        t
    );
}

draw_set_color(c_white);
	
	
	
    draw_text(skills_x,  yy, "SKILLS");
    draw_text(talents_x, yy, "TALENTS");

    draw_set_halign(fa_left);
	
	
	
}