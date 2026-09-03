function step_update(cc)
{
    if (!is_struct(cc)) exit;
    if (!variable_struct_exists(cc, "steps")) exit;
    if (!variable_struct_exists(cc, "step_index")) exit;
    if (cc.step_index < 0 || cc.step_index >= array_length(cc.steps))
        exit;
    
    // Must be first — blocks entire switch while popup is open
    if (briefing_update(cc))
        return;
    
    var step = cc.steps[cc.step_index];
    if (!is_struct(step)) exit;
    if (!variable_struct_exists(step, "type")) exit;
    
    switch (step.type)
    {
        case "single_select":
            species_step_update(step);
        break;
        
        case "roll_assign":
            attribute_step_update(cc);
        break;
        
        case "generation_shop":
            generation_step_update(cc);
        break;
        
        case "equipment_shop":
            equipment_shop_update(cc);
        break;
    }
}