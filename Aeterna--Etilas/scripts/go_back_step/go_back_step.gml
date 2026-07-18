function go_back_step(cc)
{
    if (!is_struct(cc))
        return;

    // Nothing to go back to
    if (array_length(cc.step_history) <= 0)
        return;


    // Return to previous step
    cc.step_index = array_pop(cc.step_history);


    show_debug_message(
        "BACK TO STEP: " 
        + string(cc.steps[cc.step_index].id)
    );


    // Reinitialize the step
    switch(cc.steps[cc.step_index].type)
    {
        case "single_select":
            
        break;


        case "roll_assign":
            attribute_step_init(cc);
        break;


        case "generation_shop":
            generation_shop_init(cc);
        break;


        case "finalize":
            finalize_step_init(cc);
        break;
    }
}