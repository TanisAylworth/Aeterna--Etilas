var cc = global.char_creation;
global.char_creation.tooltip.active = false;

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;
if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps)) exit;
var step = cc.steps[cc.step_index];


var cc = global.char_creation;

global.char_creation.tooltip.active = false;

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;
if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps)) exit;

var step = cc.steps[cc.step_index];

switch (step.type)
{
    case "single_select":
        draw_species_select(step);
        break;

    case "roll_assign":
        attribute_step_draw(cc);
        break;

    case "generation_shop":
        generation_shop_init(cc);
		generation_shop_update(step);
        break;
}


// TOOLTIP
draw_tooltip();
clear_tooltip();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// CONFIRM BUTTON
if (step.id == "species")
{
    if (cc.locked_species != undefined)
    {
        var hovering = point_in_rectangle(mx, my, 1600, 900, 1850, 980);
		
        draw_set_color(hovering ? c_lime : c_green);
		
        draw_rectangle(1600, 900, 1850, 980, false);


        draw_text_colour(1650, 940, "Confirm Species",c_white,c_white,c_white,c_white,1);
    }
}

