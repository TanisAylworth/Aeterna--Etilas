
// Step Event


var cc = global.char_creation;

// Modal briefing: eat the whole frame of UI input
if (briefing_update(global.char_creation)) exit;   // or return; — do NOT call step_update / step_enter at all
if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;

var step = cc.steps[cc.step_index];

// lifecycle (safe now)
step_enter(cc);
step_update(cc);