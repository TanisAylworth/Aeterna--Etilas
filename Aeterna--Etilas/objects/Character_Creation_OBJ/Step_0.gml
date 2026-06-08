
// Step Event
show_debug_message("STEP RUNNING");

var cc = global.char_creation;

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;

var step = cc.steps[cc.step_index];

// lifecycle (safe now)
step_enter(cc);
step_update(cc);