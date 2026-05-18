function attribute_step_init(cc)
{
    if (variable_struct_exists(cc, "attribute_initialized") && cc.attribute_initialized)
        exit;

    randomize();

    // -------------------------
    // CORE STRUCTS
    // -------------------------
    if (!variable_struct_exists(cc, "roll_pool"))
        cc.roll_pool = generate_roll_pool();

    if (!variable_struct_exists(cc, "assigned"))
        cc.assigned = {}; // IMPORTANT: DO NOT prefill attributes

    if (!variable_struct_exists(cc, "history"))
        cc.history = [];

    cc.selected_roll_index = -1;

    if (!variable_struct_exists(cc, "locked_species"))
        cc.locked_species = undefined;

    // -------------------------
    // ATTRIBUTE LIST
    // -------------------------
    global.ATTRIBUTES = [
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

    // -------------------------
    // SPECIES BONUS SYSTEM
    // -------------------------
    if (!variable_struct_exists(cc, "species_bonus_map"))
        cc.species_bonus_map = {};

    if (!variable_struct_exists(cc, "species_bonus_remaining"))
        cc.species_bonus_remaining = 0;

    cc.attribute_initialized = true;

    show_debug_message("ATTRIBUTE INIT COMPLETE");
}