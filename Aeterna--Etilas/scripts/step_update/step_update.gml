function step_update(cc)
{
    if (!is_struct(cc)) exit;
    if (!variable_struct_exists(cc, "steps")) exit;
    if (!variable_struct_exists(cc, "step_index")) exit;

    if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps))
        exit;

    var step = cc.steps[cc.step_index];

    if (!is_struct(step)) exit;
    if (!variable_struct_exists(step, "type")) exit;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    switch (step.type)
    {
        case "single_select":
            species_step_update(step);

            if (step.id == "species")
			{
			    if (cc.locked_species != undefined)
			    {
			        var btn_w = 260;
			        var btn_h = 60;

			        var btn_x = (display_get_gui_width() - btn_w) * 0.5;
			        var btn_y = display_get_gui_height() - 100;

			        if (mouse_check_button_pressed(mb_left))
			        {
			            if (point_in_rectangle(
			                mx, my,
			                btn_x, btn_y,
			                btn_x + btn_w,
			                btn_y + btn_h
			            ))
			            {
			                cc.confirmed_species = cc.locked_species;
			                cc.species = cc.locked_species;

			                go_to_next_step(cc);
			            }
			        }
			    }
			}
        break;

        case "roll_assign":

		    attribute_step_update(cc);

		    

break;

        case "generation_shop":
            generation_step_update(cc);
        break;
    }
}