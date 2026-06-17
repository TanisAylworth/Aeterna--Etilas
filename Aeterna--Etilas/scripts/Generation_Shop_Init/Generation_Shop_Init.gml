function generation_shop_init(cc)
{
    // =====================================================
    // PREVENT RE-INIT
    // =====================================================
    if (variable_struct_exists(cc, "generation_initialized"))
    {
        if (cc.generation_initialized) exit;
    }
if (!variable_struct_exists(cc, "hovered_table"))
    cc.hovered_table = "";

	show_debug_message(
    "INIT FLAG: " +
    string(variable_struct_exists(cc, "generation_initialized"))
);
    var sp = cc.locked_species;
    // =====================================================
    // SAFE SPECIES FETCH
    // =====================================================
    var species = undefined;

    if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
    {
        species = global.species_data[$ sp];
    }
	
	
	
	
	 // NEW FIELDS FIRST
    if (!variable_struct_exists(cc, "skill_ranks"))
        cc.skill_ranks = {};

   if (!variable_struct_exists(cc, "hovered_skill"))
    cc.hovered_skill = "";
	
	if (!variable_global_exists("SKILL_SIMPLE"))
{
    skill_constants_init();
}

if (!variable_global_exists("skill_data"))
{
    skills_data();
}



    if (!variable_struct_exists(cc, "selected_table"))
        cc.selected_table = "";

    if (!variable_struct_exists(cc, "selected_skill"))
        cc.selected_skill = "";
		
		
		if (!variable_global_exists("knowledge_table_data"))
			{
			    knowledge_tables_data();
			}
			
			if (!variable_global_exists("skill_data"))
{
    skills_data();
}




    // THEN EARLY EXIT
    if (variable_struct_exists(cc, "generation_initialized"))
    {
        if (cc.generation_initialized)
            exit;
    }

    // =====================================================
    // NORMALIZED DATA HELPERS
    // =====================================================
    function _normalize_knowledge(node)
    {
        var out =
        {
            fixed: [],
            choices:
            {
                count: 0,
                options: []
            }
        };

        if (is_undefined(node))
            return out;

        // already standardized
        if (variable_struct_exists(node, "fixed"))
            out.fixed = node.fixed;

        if (variable_struct_exists(node, "choices"))
        {
            var c = node.choices;

            if (is_struct(c))
            {
                if (variable_struct_exists(c, "count"))
                    out.choices.count = c.count;

                if (variable_struct_exists(c, "options"))
                    out.choices.options = c.options;
            }
            else if (is_real(c))
            {
                out.choices.count = c;
            }
        }

        // legacy options-only format
        if (variable_struct_exists(node, "options"))
        {
            out.choices.options = node.options;
        }

        // raw array fallback
        if (is_array(node))
        {
            out.fixed = node;
        }

        return out;
    }

    // =====================================================
    // GENERATION STATE
    // =====================================================
    cc.generation =
    {
        // purchases
        tables: [],
        skills: [],
        talents: [],

        // generation resources
        cdt_bonus: 0,
        gold_bonus: 0,

        // table tracking
        fixed_tables: [],
        choice_tables: [],
        purchased_tables: [],
		tables_locked : false,

        table_choices_remaining: 0
    };
	
	cc.selected_table = "";

    // =====================================================
    // SAFE DEFAULTS
    // =====================================================
    cc.available_tables =
    {
        fixed: [],
        choices:
        {
            count: 0,
            options: []
        }
    };

    cc.available_skills =
    {
        fixed: [],
        choices:
        {
            count: 0,
            options: []
        }
    };

    cc.available_talents =
    {
        fixed: [],
        choices:
        {
            count: 0,
            options: []
        }
    };

    // =====================================================
    // LOAD SPECIES DATA
    // =====================================================
    if (!is_undefined(species))
    {
        // -------------------------
        // normalized species data
        // -------------------------
        cc.available_tables =
            _normalize_knowledge(
                species.creation.knowledge_tables
            );

        cc.available_skills =
            _normalize_knowledge(
                species.creation.knowledge_skills
            );

        cc.available_talents =
            _normalize_knowledge(
                species.creation.knowledge_talents
            );

        // -------------------------
        // fixed tables
        // -------------------------
        if (variable_struct_exists(
            species.creation.knowledge_tables,
            "fixed"))
        {
            cc.generation.fixed_tables =
                array_copy_simple(
                    species.creation.knowledge_tables.fixed
                );
        }
		// Always grant General
if (array_index_of(
        cc.generation.fixed_tables,
        "General"
    ) == -1)
{
    array_push(
        cc.generation.fixed_tables,
        "General"
    );
}
        // -------------------------
        // table choices
        // -------------------------
        if (variable_struct_exists(
            species.creation.knowledge_tables,
            "choices"))
        {
            cc.generation.table_choices_remaining =
                species.creation.knowledge_tables.choices.count;
        }
    }

    // =====================================================
    // SLOT CALCULATION
    // =====================================================
    var base_slots = cc.steps[cc.step_index].slots_base;
    var int_bonus = get_final_attribute(cc, "Intelligence");

    cc.generation_slots_total =
        base_slots + max(0, int_bonus);

    cc.generation_slots_remaining =
        cc.generation_slots_total;

   

    // =====================================================
    // COMPLETE
    // =====================================================
    cc.generation_initialized = true;

    show_debug_message(
        "GENERATION INIT → CLEAN STANDARDIZED PIPELINE READY"
    );
	
	
	show_debug_message("GENERATION INIT COMPLETE");
show_debug_message("HAS CDT: " + string(variable_struct_exists(cc.generation, "cdt_bonus")));
show_debug_message("HAS GOLD: " + string(variable_struct_exists(cc.generation, "gold_bonus")));
show_debug_message("HAS TABLES: " + string(variable_struct_exists(cc.generation, "table_choices_remaining")));
}