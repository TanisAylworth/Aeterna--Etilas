function equipment_step_init(cc)
{
    if (variable_struct_exists(cc, "equipment_initialized") && cc.equipment_initialized)
        return;

    var start_gold = 0;
    if (variable_struct_exists(cc, "generation")
        && variable_struct_exists(cc.generation, "gold_bonus"))
        start_gold = cc.generation.gold_bonus;

    cc.equipment = {
    gold: start_gold,
    owned: {},
    selected_column: "",
    selected_category: "",      // main category (e.g. "Small Blades")
    selected_subcategory: "",   // ← NEW (e.g. "Daggers")
    hovered_category: "",
    hovered_item: ""
};

    cc.equipment_initialized = true;
    show_debug_message("Equipment init — gold: " + string(start_gold));
}