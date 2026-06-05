function species_step_update(step)
{
    var cc = global.char_creation;
	show_debug_message("SPECIES UPDATE RUNNING");
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var count = array_length(global.species_list);

    var box_w = 200;
    var box_h = 30;
    var spacing = 10;

    var vw = display_get_gui_width();
    var list_x = (vw - box_w) * 0.5;

    var total_h = count * box_h + (count - 1) * spacing;
    var start_y = (display_get_gui_height() - total_h) * 0.5;

    cc.hovered_species = undefined;

    // -----------------------------
    // SPECIES LIST INTERACTION
    // -----------------------------
    for (var i = 0; i < count; i++)
    {
        var species_id = global.species_list[i];

        var yy = start_y + i * (box_h + spacing);

        if (point_in_rectangle(mx, my, list_x, yy, list_x + box_w, yy + box_h))
        {
            cc.hovered_species = species_id;

            if (mouse_check_button_pressed(mb_left))
            {
                cc.locked_species = species_id;
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