function species_step_update(step)
{
    var cc = global.char_creation;
	show_debug_message("SPECIES UPDATE RUNNING");
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // =====================================================
// SPECIES LIST LAYOUT (MUST MATCH DRAW)
// =====================================================
var box_w = 220;
var box_h = 35;
var spacing = 8;
var max_rows_per_col = 12;
var col_width = box_w + 30;

var species_count = array_length(global.species_list);
var num_cols = ceil(species_count / max_rows_per_col);
var rows_per_col = ceil(species_count / num_cols);

var list_x = (display_get_gui_width() - (num_cols * col_width)) * 0.5;
var start_y = 180;

    cc.hovered_species = undefined;

    // -----------------------------
// SPECIES LIST INTERACTION
// -----------------------------
var species_count = array_length(global.species_list);
var num_cols = ceil(species_count / max_rows_per_col);
var rows_per_col = ceil(species_count / num_cols);

for (var i = 0; i < species_count; i++)
{
    var species_id = global.species_list[i];

    var col = i div rows_per_col;
    var row = i mod rows_per_col;

    var xx = list_x + (col * col_width);
    var yy = start_y + (row * (box_h + spacing));

    if (point_in_rectangle(mx, my, xx, yy, xx + box_w, yy + box_h))
    {
        cc.hovered_species = species_id;

        if (mouse_check_button_pressed(mb_left))
        {
            cc.locked_species = species_id;

            // Reset species bonuses
            cc.species_bonus_map = {};
            cc.species_bonus_remaining = 0;

            var data = global.species_data[$ species_id];

            if (variable_struct_exists(data, "creation")
            && variable_struct_exists(data.creation, "attribute_adjustments"))
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
}

    // -----------------------------
    // CONFIRM BUTTON (ONLY AFTER SELECTION)
    // -----------------------------
    if (!is_undefined(cc.locked_species))
    {
        if (mouse_check_button_pressed(mb_left)
        && point_in_rectangle(mx, my, 1600, 900, 1850, 980))
        {
            cc.confirmed_species = cc.locked_species;
            cc.species = cc.locked_species;

            go_to_next_step(cc);
        }
    }
}