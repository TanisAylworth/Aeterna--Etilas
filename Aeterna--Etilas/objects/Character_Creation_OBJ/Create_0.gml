// ===============================
// INIT GLOBAL DATA FIRST
// ===============================
Species_Data_SCR();
Attribute_data();
get_all_knowledge_tables();
show_debug_message("Character Creation Create Event");

show_debug_message("INIT DATA COMPLETE");


// ===============================
// CHARACTER CREATION STATE
// ===============================
global.char_creation = {
    // -------------------------------
    // STEP SYSTEM CORE
    // -------------------------------
    step_index: 0,
    last_step_id: "",

    steps: [

        {
            id: "species",
            title: "Choose Species",
            type: "single_select",
            next: "attributes"
        },

        {
            id: "attributes",
            title: "Assign Attributes",
            type: "roll_assign",
            rolls: 10,
            next: "generation"
        },

        {
            id: "generation",
            title: "Character Generation",
            type: "generation_shop",

            // generation config
            slots_base: 20,
            int_bonus: true,

            categories: [
                "tables",
                "skills",
                "talents",
                "cdt",
                "gold"
            ],

            next: "finalize"
        },

        {
            id: "finalize",
            title: "Finalize Character",
            type: "finalize"
        }
    ],


    // -------------------------------
    // SPECIES STATE
    // -------------------------------
    species: undefined,
    locked_species: undefined,
    confirmed_species: -1,


    // -------------------------------
    // ATTRIBUTE SYSTEM
    // -------------------------------
    assigned: {},
    selected_index: -1,


    // -------------------------------
    // GENERATION SYSTEM (WILL BE INITIALIZED ON ENTER)
    // -------------------------------
    generation_initialized: false,
    generation_slots_total: 0,
    generation_slots_remaining: 0,

	
	
	generation:
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

        table_choices_remaining: 0
		
		
		
    },



    // -------------------------------
    // TEMP / UI STATE
    // -------------------------------
    selections: {
        knowledge_tables: [],
        skills: []
    },

    temp_pool: [],


    // -------------------------------
    // TOOLTIP SYSTEM
    // -------------------------------
    tooltip: {
        active: false,
        text: "",
        x: 0,
        y: 0
		
		
		
    }
	
	
	

};


