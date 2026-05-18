function generation_shop_init(cc)
{
    if (variable_struct_exists(cc, "generation_initialized"))
    {
        if (cc.generation_initialized)
            return;
    }

    cc.generation_initialized = true;

    // =========================================
    // SLOT CALCULATION
    // =========================================

    var base_slots = 20;

    var int_bonus = get_final_attribute(cc, "Intelligence");

    cc.generation_slots_total =
        base_slots + max(0, int_bonus);

    cc.generation_slots_remaining =
        cc.generation_slots_total;

    // =========================================
    // PURCHASE STORAGE
    // =========================================

    cc.generation = {};

    cc.generation.tables = [];
    cc.generation.skills = [];
    cc.generation.talents = [];

    cc.generation.cdt_bonus = 0;
    cc.generation.gold_bonus = 0;

    // =========================================
    // AVAILABLE OPTIONS
    // =========================================

    var sp = cc.locked_species;
    var species = global.species_data[$ sp];

    cc.available_tables =
        species.creation.knowledge_tables;

    cc.available_skills =
        species.creation.knowledge_skills;

    cc.available_talents =
        species.creation.knowledge_talents;
}