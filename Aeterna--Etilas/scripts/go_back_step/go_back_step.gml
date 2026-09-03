function go_back_step(cc)
{
    if (!is_struct(cc)) return;
    if (!variable_struct_exists(cc, "steps") || !variable_struct_exists(cc, "step_index"))
        return;
    
    if (cc.step_index <= 0)
    {
        show_debug_message("go_back_step: already on first step");
        return;
    }
    
    var from_id = cc.steps[cc.step_index].id;
    cc.step_index--;
    var to_id = cc.steps[cc.step_index].id;
    var step = cc.steps[cc.step_index];
    
    show_debug_message("BACK " + from_id + " -> " + to_id + " (index " + string(cc.step_index) + ")");
    
    // Optional: reopen briefing when revisiting a step
    briefing_on_enter_step(cc);
    
    // Init ONLY the step we entered
    switch (step.type)
    {
        case "single_select":
            break;
            
        case "roll_assign":
            break;
            
        case "generation_shop":
            generation_shop_init(cc);
            break;
            
        case "equipment":
             break;
    }
}