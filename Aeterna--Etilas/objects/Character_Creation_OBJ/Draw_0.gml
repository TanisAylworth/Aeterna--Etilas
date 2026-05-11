var cc = global.char_creation;
global.char_creation.tooltip.active = false;

// CLEAR FIRST


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
        draw_attribute_step(step);
        break;

    case "multi_select_limited":
        draw_multi_select(step);
        break;
}
show_debug_message(global.trait_data);
// DRAW TOOLTIP LAST
draw_tooltip();
clear_tooltip();