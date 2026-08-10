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
        owned: {},              // item_id → qty
        selected_column: "",    // "weapons" | "armor" | "gear"
        selected_category: "",  // e.g. "Swords", "Light", "Adventuring"
        hovered_category: "",
        hovered_item: ""
    };

    cc.equipment_initialized = true;
    show_debug_message("Equipment init — gold: " + string(start_gold));
}