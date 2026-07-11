function attribute_step_init(cc)
{
    if (!is_struct(cc)) return;
    if (variable_struct_exists(cc, "attribute_initialized") && cc.attribute_initialized)
        return;

    // ... your existing init code ...

    // DO NOT SET locked_species HERE
    // Remove any line that does cc.locked_species = something

    

    // ==========================================
    // ATTRIBUTE LIST
    // ==========================================
    global.ATTRIBUTES =
    [
        "Strength",
        "Dexterity",
        "Endurance",
        "Reflexes",
        "Intelligence",
        "Perception",
        "Willpower",
        "Charm",
        "Toughness",
        "Leadership"
    ];

    // ==========================================
    // STATE INIT
    // ==========================================
    cc.history = [];
    cc.assigned = {};

    cc.base_pool = generate_roll_pool();
    cc.roll_pool = array_copy_simple(cc.base_pool);

    sanitize_roll_pool(cc);

    // ==========================================
    // UI STATE
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;

    cc.species_bonus_map = {};
    cc.species_bonus_remaining = 0;

    cc.confirm_btn =
    {
        w : 260,
        h : 60,
        x : 0,
        y : 0
    };

    cc.ready_to_confirm = false;
    cc.undo_version = 2;

    
    // ==========================================
    // FINISH
    // ==========================================
    cc.attribute_initialized = true;

    show_debug_message("ATTRIBUTE INIT COMPLETE");
    show_debug_message("Species = " + string(cc.locked_species));
    show_debug_message("Bonus Choices = " + string(cc.species_bonus_remaining));
	cc.attribute_initialized = true;
    show_debug_message("ATTRIBUTE INIT COMPLETE for species: " + string(cc.locked_species));
}