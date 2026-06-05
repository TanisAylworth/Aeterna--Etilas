function go_to_next_step(cc)
{
    cc.step_index++;
	show_debug_message("CURRENT STEP: " + cc.steps[cc.step_index].id);
    show_debug_message("STEP INDEX NOW: " + string(cc.step_index));

    if (cc.step_index >= array_length(cc.steps))
    {
        cc.step_index = array_length(cc.steps) - 1;
        show_debug_message("END OF STEPS REACHED");
    }
}