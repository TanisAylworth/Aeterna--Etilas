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
	    // Free slot tracking
    if (!variable_struct_exists(cc, "free_slot_skills"))
        cc.free_slot_skills = [];
	if (!variable_struct_exists(cc, "free_slot_ranks"))
        cc.free_slot_ranks = {};
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
    // LOAD FIXED SPECIES SKILLS
    // =====================================================
    if (!is_undefined(species) && variable_struct_exists(species.creation, "knowledge_skills"))
    {
        var skill_data = species.creation.knowledge_skills;
        if (variable_struct_exists(skill_data, "fixed"))
        {
            // Persistent fixed skills tracking (struct)
            if (!variable_struct_exists(cc, "fixed_skills"))
                cc.fixed_skills = {};

            var fixed_skills = skill_data.fixed;
            for (var i = 0; i < array_length(fixed_skills); i++)
            {
                var s = fixed_skills[i];
                var skill_name = s.name;
                var rank = variable_struct_exists(s, "rank") ? s.rank : 1;
               
                // Add to skill ranks
                if (!variable_struct_exists(cc.skill_ranks, skill_name))
                    cc.skill_ranks[$ skill_name] = rank;
                else
                    cc.skill_ranks[$ skill_name] = max(cc.skill_ranks[$ skill_name], rank);
               
                // Add to free slot tracking
                if (!array_contains(cc.free_slot_skills, skill_name))
                    array_push(cc.free_slot_skills, skill_name);
               
                // Store initial fixed rank
                cc.fixed_skills[$ skill_name] = rank;
               
                show_debug_message("Added fixed species skill: " + skill_name + " (Rank " + string(rank) + ")");
            }
        }
    }

    
// =====================================================
// SLOT CALCULATION DEBUG
// =====================================================

var test_int = get_final_attribute(cc, "Intelligence");

show_debug_message("=== SLOT DEBUG ===");
show_debug_message("Base INT: " + string(cc.assigned.Intelligence));
show_debug_message("Final INT: " + string(test_int));
show_debug_message("Species: " + string(cc.locked_species));

cc.generation_slots_total = get_intelligence_slots(cc);
cc.generation_slots_remaining = cc.generation_slots_total;

show_debug_message("POINT TOTAL: " + string(cc.generation_slots_total));
	    // Make sure tables_locked exists
    if (!variable_struct_exists(cc.generation, "tables_locked"))
        cc.generation.tables_locked = false;

    cc.generation_initialized = true;
    show_debug_message("=== GENERATION SHOP INITIALIZED SUCCESSFULLY ===");
	
	
	            
	
}