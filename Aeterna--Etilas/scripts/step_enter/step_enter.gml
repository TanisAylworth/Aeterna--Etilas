function step_enter(cc)
{
    var step = cc.steps[cc.step_index];

    if (step.id == cc.last_step_id) return;

    cc.last_step_id = step.id;

    show_debug_message("ENTER STEP: " + step.id);

    switch (step.type)
    {
        

        case "roll_assign":
            attribute_step_init(cc);
            break;
			
		case "generation_shop":
            generation_shop_init(cc);
            break;
    }
}