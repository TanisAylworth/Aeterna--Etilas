var cc = global.char_creation;

// Draw Event
show_debug_message("DRAW RUNNING");

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
        generation_shop_draw(step);
        break;
}

// TOOLTIP
draw_tooltip();
clear_tooltip();







