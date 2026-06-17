function generation_shop_draw(step)
{
    var cc = global.char_creation;
    var L = generation_layout(cc);

var tables_x  = L.center_x - L.panel_spacing;
var skills_x  = L.center_x;
var talents_x = L.center_x + L.panel_spacing;

var yy = L.top_y;


// =====================================
    // SAFETY
    // =====================================

    if (!variable_struct_exists(cc, "selected_table"))
        cc.selected_table = "";

    if (!variable_struct_exists(cc, "selected_skill"))
        cc.selected_skill = "";

    if (!variable_struct_exists(cc, "skill_ranks"))
        cc.skill_ranks = {};
		
	if (!variable_struct_exists(cc, "hovered_table"))
    cc.hovered_table = "";

if (!variable_struct_exists(cc, "hovered_skill"))
    cc.hovered_skill = "";	
		
		
show_debug_message(
    "GEN EXISTS: "
    + string(variable_struct_exists(cc, "generation"))
);

show_debug_message(
    "HAS SELECTED TABLE: " +
    string(variable_struct_exists(cc, "selected_table"))
);

show_debug_message(
    "HAS GENERATION INIT: " +
    string(variable_struct_exists(cc, "generation_initialized"))
);

var all_tables = get_all_knowledge_tables();

show_debug_message(
    "TABLE COUNT: "
    + string(array_length(all_tables))
);

if (variable_struct_exists(cc, "generation"))
{
    show_debug_message(
        "TABLE CHOICES EXISTS: "
        + string(
            variable_struct_exists(
                cc.generation,
                "table_choices_remaining"
            )
        )
    );
}

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
        "Remaining Character Points: "
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

show_debug_message("GEN STRUCT:");
show_debug_message(string(variable_struct_exists(cc.generation, "cdt_bonus")));
show_debug_message(string(variable_struct_exists(cc.generation, "gold_bonus")));
show_debug_message(string(variable_struct_exists(cc.generation, "table_choices_remaining")));

    draw_set_color(c_white);
    draw_text(
        cdt_x,
        value_y,
        "Bonus: +" + string(cc.generation.cdt_bonus)
    );
	
		// =========================
	// CDT CAP DISPLAY
	// =========================

	

	draw_set_halign(fa_center);
	draw_set_color(c_white);

	// =========================
// CURRENT CDT DISPLAY
// =========================

var species_cdt = 0;

var sp = cc.locked_species;

if (!is_undefined(sp)
&& variable_struct_exists(global.species_data, sp))
{
    species_cdt = global.species_data[$ sp].stats.cdt;
}

var toughness_cdt = get_toughness_cdt_bonus(cc);

var current_cdt =
    species_cdt
    + toughness_cdt
    + cc.generation.cdt_bonus;

var cdt_limit = get_cdt_cap(cc);

draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text(
    cdt_x,
    value_y + 40,
    "Current CDT: " + string(current_cdt)
);

draw_text(
    cdt_x,
    value_y + 60,
    "Limit: " + string(cdt_limit)
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
draw_set_color(c_white);

draw_text(tables_x, yy, "TABLES");

draw_set_halign(fa_left);

var tables = get_all_knowledge_tables();

draw_text(
    tables_x - 110,
    yy + 25,
    "Choices Remaining: "
    + string(cc.generation.table_choices_remaining)
);

draw_text(
    tables_x - 110,
    yy + 45,
    "Additional Tables Cost 2 Slots"
);

var start_y = yy + 80;

var list_bottom =
    start_y
    + (array_length(tables) * 36);

var confirm_x = tables_x - 120;
var confirm_y = list_bottom + 20;
var confirm_w = 240;
var confirm_h = 30;

var confirm_hover =
    point_in_rectangle(
        device_mouse_x_to_gui(0),
        device_mouse_y_to_gui(0),
        confirm_x,
        confirm_y,
        confirm_x + confirm_w,
        confirm_y + confirm_h
    );






if (
    variable_struct_exists(
        cc.generation,
        "tables_locked"
    )
    && cc.generation.tables_locked
)
{
    draw_set_color(
        confirm_hover
        ? c_lime
        : c_green
    );
}
else
{
    draw_set_color(
        confirm_hover
        ? c_gray
        : c_dkgray
    );
}

draw_rectangle(
    confirm_x,
    confirm_y,
    confirm_x + confirm_w,
    confirm_y + confirm_h,
    false
);

draw_set_color(c_white);

draw_text(
    confirm_x + 10,
    confirm_y + 7,
    (
    variable_struct_exists(
        cc.generation,
        "tables_locked"
    )
    && cc.generation.tables_locked
)
    ? "UNLOCK TABLES"
	: "CONFIRM TABLES"
);



for (var i = 0; i < array_length(tables); i++)
{
    var table = tables[i];

    var row_y = start_y + (i * 36);
	
	

    var is_fixed =
        array_index_of(
            cc.generation.fixed_tables,
            table
        ) != -1;

    var is_choice =
        array_index_of(
            cc.generation.choice_tables,
            table
        ) != -1;

    var is_purchased =
        array_index_of(
            cc.generation.purchased_tables,
            table
        ) != -1;
		
		
		var btn_x = tables_x - 120;
var btn_y = row_y;
var btn_w = 240;
var btn_h = 30;

if (!variable_struct_exists(cc, "hovered_table"))
{
    cc.hovered_table = "";
}

if (cc.hovered_table == table)
{
    draw_set_color(c_yellow);

    draw_rectangle(
        btn_x - 2,
        btn_y - 2,
        btn_x + btn_w + 2,
        btn_y + btn_h + 2,
        false
    );

    draw_set_color(c_white);
}

    var btn_x = tables_x - 120;
    var btn_y = row_y;
    var btn_w = 240;
    var btn_h = 30;

    var hovered =
        point_in_rectangle(
            device_mouse_x_to_gui(0),
            device_mouse_y_to_gui(0),
            btn_x,
            btn_y,
            btn_x + btn_w,
            btn_y + btn_h
        );

    // =============================
    // BUTTON COLOR
    // =============================

    if (is_fixed)
    {
        draw_set_color(c_green);
    }
    else if (is_choice)
    {
        draw_set_color(c_lime);
    }
    else if (is_purchased)
    {
        draw_set_color(c_olive);
    }
    else if (hovered)
    {
        draw_set_color(c_gray);
    }
    else
    {
        draw_set_color(c_dkgray);
    }

    draw_rectangle(
        btn_x,
        btn_y,
        btn_x + btn_w,
        btn_y + btn_h,
        false
    );

    draw_set_color(c_white);

    var suffix = "";

    if (is_fixed)
        suffix = " (Fixed)";
    else if (is_choice)
        suffix = " (Choice)";
    else if (is_purchased)
        suffix = " (Purchased)";

    draw_text(
        btn_x + 8,
        btn_y + 7,
        table + suffix
    );
	
	
}

draw_set_color(c_white);
	
	
	
    draw_text(skills_x,  yy, "SKILLS");
	
	if (cc.selected_table != "")
{
    if (variable_struct_exists(
        global.knowledge_table_data,
        cc.selected_table))
    {
        var table =
            global.knowledge_table_data[$ cc.selected_table];

        for (var i = 0; i < array_length(table.skills); i++)
		{
		    var skill_name = table.skills[i];

		    var rank = get_skill_rank(cc, skill_name);

		    var draw_y = yy + 50 + i * 25;
draw_set_color(c_white);
if (cc.hovered_skill == skill_name)
{
    draw_set_color(c_yellow);

    

    
}


draw_text(
    skills_x - 120,
    draw_y,
    skill_name + " (" + string(rank) + ")"
);

draw_set_color(c_white);
		}
    }
}

if (variable_struct_exists(cc, "hovered_skill"))
{
    if (cc.hovered_skill != "")
    {
        if (variable_global_exists("skill_data"))
        {
            if (variable_struct_exists(global.skill_data, cc.hovered_skill))
            {
                var skill = global.skill_data[$ cc.hovered_skill];
				
				var info =
    get_skill_check_result(
        cc,
        skill
    );
	
	
	
	var rank =
    get_skill_rank(
        cc,
        skill.name
    );
	
	var attr_list = "";

var checks =
    get_skill_check_nodes(skill);

for (var i = 0; i < array_length(checks); i++)
{
    var node = checks[i];

    attr_list +=
        node.attribute;

    if (node.modifier >= 0)
    {
        attr_list +=
            " +" +
            string(node.modifier);
    }
    else
    {
        attr_list +=
            " " +
            string(node.modifier);
    }

    if (i < array_length(checks) - 1)
    {
        attr_list += "\n";
    }
}

var total_check =
    info.total + rank;





	
	var rank =
    get_skill_rank(
        cc,
        skill.name
    );

var total_check =
    info.total + rank;

var check_text =
    "Check: " +
    string(total_check) +
    " (" +
    info.attribute +
    " " +
    string(
        get_final_attribute(
            cc,
            info.attribute
        )
    );
	
if (info.modifier >= 0)
{
    check_text +=
        " + Mod +" +
        string(info.modifier);
}
else
{
    check_text +=
        " + Mod " +
        string(info.modifier);
}	
	



check_text +=
    " + Rank " +
    string(rank) +
    ")";

                var mx = device_mouse_x_to_gui(0);
                var my = device_mouse_y_to_gui(0);

                tooltip_text =
				    skill.name + "\n\n" +
				    "Table: " + skill.table + "\n" +
				    check_text + "\n\n" +
				    "Attributes:\n" +
				    attr_list + "\n\n" +
				    "Difficulty: " +
				    skill_difficulty_name(skill.difficulty) +
				    "\n\n" +
				    skill.description;

                var tooltip_w = 350;

                var tooltip_h =
                    string_height_ext(
                        tooltip_text,
                        20,
                        tooltip_w - 20
                    ) + 20;

                var box_x = mx + 16;
                var box_y = my + 16;

                var gui_w = display_get_gui_width();
                var gui_h = display_get_gui_height();

                if (box_x + tooltip_w > gui_w)
                {
                    box_x = mx - tooltip_w - 16;
                }

                if (box_y + tooltip_h > gui_h)
                {
                    box_y = my - tooltip_h - 16;
                }

                // Filled background
draw_set_color(c_black);

draw_rectangle(
    box_x,
    box_y,
    box_x + tooltip_w,
    box_y + tooltip_h,
    false
);

// White border
draw_set_color(c_white);

draw_rectangle(
    box_x,
    box_y,
    box_x + tooltip_w,
    box_y + tooltip_h,
    true
);

                // Text
                draw_set_color(c_white);

                draw_text_ext(
                    box_x + 10,
                    box_y + 10,
                    tooltip_text,
                    20,
                    tooltip_w - 20
                );
            }
        }
    }
}
	
	
    draw_text(talents_x, yy, "TALENTS");

    draw_set_halign(fa_left);
	
	
	
}