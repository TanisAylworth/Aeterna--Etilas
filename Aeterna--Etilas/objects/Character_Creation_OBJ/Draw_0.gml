var cc = global.char_creation;

// Draw Event

draw_set_color(make_color_rgb(35, 35, 35));
draw_rectangle(
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height(),
    false
);

global.char_creation.tooltip.active = false;

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;
if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps)) exit;

var step = cc.steps[cc.step_index];


switch (step.type)
{
    case "single_select":
        draw_species_select(step);
		briefing_on_enter_step(cc);
        break;

    case "roll_assign":
        attribute_step_draw(cc);
        break;

    case "generation_shop":
        generation_shop_draw(step);
        break;
		
	case "equipment_shop":
	equipment_shop_draw(cc);
	break;
}

// TOOLTIP
draw_tooltip();
clear_tooltip();

//Briefings

briefing_draw(global.char_creation);







