function attribute_step_init(cc)
{
    if (!is_struct(cc)) return;
    if (variable_struct_exists(cc, "attribute_initialized") && cc.attribute_initialized)
        return;


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
	
	
	    // ==========================================
    // SPECIES BONUS SETUP
    // ==========================================
    cc.species_bonus_remaining = 0;
    if (!is_undefined(cc.locked_species) && variable_struct_exists(global.species_data, cc.locked_species))
    {
        var species = global.species_data[$ cc.locked_species];
        if (variable_struct_exists(species, "creation") && variable_struct_exists(species.creation, "attribute_adjustments"))
        {
            var adj = species.creation.attribute_adjustments;
            var type = variable_struct_exists(adj, "type") ? string_lower(string(adj.type)) : "";
            if (type == "choice" && variable_struct_exists(adj, "count"))
            {
                cc.species_bonus_remaining = adj.count;
            }
        }
    }
}