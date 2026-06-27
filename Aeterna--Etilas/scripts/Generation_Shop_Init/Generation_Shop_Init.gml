function generation_shop_init(cc)
{
    if (variable_struct_exists(cc, "generation_initialized") && cc.generation_initialized)
        exit;

    // =====================================================
    // DEFAULTS & SAFETY
    // =====================================================
    if (!variable_struct_exists(cc, "skill_ranks"))          cc.skill_ranks = {};
    if (!variable_struct_exists(cc, "hovered_table"))        cc.hovered_table = "";
    if (!variable_struct_exists(cc, "hovered_skill"))        cc.hovered_skill = "";
    if (!variable_struct_exists(cc, "selected_table"))       cc.selected_table = "";
    if (!variable_struct_exists(cc, "pending_skill"))        cc.pending_skill = "";
    if (!variable_struct_exists(cc, "pending_specializations")) cc.pending_specializations = [];
    if (!variable_struct_exists(cc, "specialization_popup")) cc.specialization_popup = false;

    if (!variable_global_exists("SKILL_SIMPLE"))      skill_constants_init();
    if (!variable_global_exists("skill_data"))        skills_data();
    if (!variable_global_exists("knowledge_table_data")) knowledge_tables_data();
	
	
	
	// =====================================================
	// GENERATION HOVER (Critical for Draw Event)
	// =====================================================
	if (!variable_struct_exists(cc, "generation_hover"))
	{
	    cc.generation_hover = {
	        cdt_minus: false,
	        cdt_plus: false,
	        gold_minus: false,
	        gold_plus: false
	    };
	}
	

    // =====================================================
    // GENERATION STATE
    // =====================================================
    cc.generation = {
        tables: [],
        skills: [],
        talents: [],
        cdt_bonus: 0,
        gold_bonus: 0,
        fixed_tables: [],
        choice_tables: [],
        purchased_tables: [],
        tables_locked: false,
        table_choices_remaining: 0
    };

    cc.generation_hover = {
        cdt_minus: false,
        cdt_plus: false,
        gold_minus: false,
        gold_plus: false
    };

    // =====================================================
    // LOAD SPECIES DATA
    // =====================================================
    var species = undefined;
    var sp = cc.locked_species;
    if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
        species = global.species_data[$ sp];

    if (!is_undefined(species))
    {
        cc.available_tables  = _normalize_knowledge(species.creation.knowledge_tables);
        cc.available_skills  = _normalize_knowledge(species.creation.knowledge_skills);
        cc.available_talents = _normalize_knowledge(species.creation.knowledge_talents);

        // Fixed tables
        if (variable_struct_exists(species.creation.knowledge_tables, "fixed"))
            cc.generation.fixed_tables = array_copy_simple(species.creation.knowledge_tables.fixed);

        // Always grant General table
        if (array_index_of(cc.generation.fixed_tables, "General") == -1)
            array_push(cc.generation.fixed_tables, "General");

        // Free choice tables
        if (variable_struct_exists(species.creation.knowledge_tables, "choices"))
            cc.generation.table_choices_remaining = species.creation.knowledge_tables.choices.count;
    }

    // =====================================================
    // SLOT CALCULATION
    // =====================================================
    var base_slots = cc.steps[cc.step_index].slots_base;
    var int_bonus = get_final_attribute(cc, "Intelligence");
    cc.generation_slots_total = base_slots + max(0, int_bonus);
    cc.generation_slots_remaining = cc.generation_slots_total;

	    // Make sure tables_locked exists
    if (!variable_struct_exists(cc.generation, "tables_locked"))
        cc.generation.tables_locked = false;

    cc.generation_initialized = true;
    show_debug_message("=== GENERATION SHOP INITIALIZED SUCCESSFULLY ===");
}