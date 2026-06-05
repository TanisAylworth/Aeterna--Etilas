function generation_shop_init(cc)
{
    // =====================================================
    // PREVENT RE-INIT
    // =====================================================
    if (variable_struct_exists(cc, "generation_initialized"))
    {
        if (cc.generation_initialized) exit;
    }

    var sp = cc.locked_species;

    // =====================================================
    // SAFE SPECIES FETCH
    // =====================================================
    var species = undefined;

    if (!is_undefined(sp) && variable_struct_exists(global.species_data, sp))
    {
        species = global.species_data[$ sp];
    }

    // =====================================================
    // NORMALIZED DATA HELPERS
    // =====================================================
    function _normalize_knowledge(node)
    {
        var out = {
            fixed: [],
            choices: {
                count: 0,
                options: []
            }
        };

        if (is_undefined(node)) return out;

        // CASE 1: already standardized
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
            else if (is_array(c))
            {
                // fallback: old format like "choices: 4"
                out.choices.count = c;
            }
            else if (is_real(c))
            {
                out.choices.count = c;
            }
        }

        // CASE 2: legacy "options only"
        if (variable_struct_exists(node, "options"))
        {
            out.choices.options = node.options;
        }

        // CASE 3: raw array fallback
        if (is_array(node))
        {
            out.fixed = node;
        }

        return out;
    }

    // =====================================================
    // AVAILABLE DATA (SAFE DEFAULTS)
    // =====================================================
    cc.available_tables  = [];
    cc.available_skills  = [];
    cc.available_talents = [];

    if (!is_undefined(species))
    {
        cc.available_tables  = _normalize_knowledge(species.creation.knowledge_tables);
        cc.available_skills  = _normalize_knowledge(species.creation.knowledge_skills);
        cc.available_talents = _normalize_knowledge(species.creation.knowledge_talents);
    }

    // =====================================================
    // GENERATION STATE RESET
    // =====================================================
    cc.generation =
    {
        tables: [],
        skills: [],
        talents: [],
        cdt_bonus: 0,
        gold_bonus: 0
    };

    // =====================================================
    // CDT CAP SAFE INIT
    // =====================================================
    cc.generation.cdt_bonus = 0;
    cc.generation.gold_bonus = 0;

    var base_slots = cc.steps[cc.step_index].slots_base;
    var int_bonus  = get_final_attribute(cc, "Intelligence");

    cc.generation_slots_total = base_slots + max(0, int_bonus);
    cc.generation_slots_remaining = cc.generation_slots_total;

    cc.generation_initialized = true;

    show_debug_message("GENERATION INIT → CLEAN STANDARDIZED PIPELINE READY");
}