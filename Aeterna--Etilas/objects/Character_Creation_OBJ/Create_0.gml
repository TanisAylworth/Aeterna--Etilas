// ===============================
// INIT GLOBAL DATA FIRST
// ===============================

Species_Data_SCR();
Attribute_data();
init_attributes();
var ui_scale_x = display_get_width() / 1920;
var ui_scale_y = display_get_height() / 1080;
show_debug_message("INIT DATA COMPLETE");


// ===============================
// CHARACTER CREATION STATE
// ===============================

global.char_creation = {
    step_index: 0,
    species: undefined,
	locked_species: undefined,
	confirmed_species: -1,
    assigned: {},
    selections: {
        knowledge_tables: [],
        skills: []
    },
    temp_pool: [],
    selected_index: -1,
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
        slots_base: 20,
        int_bonus: true,
        categories:
        [
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
    ]
};


// ===============================
// DEBUG VALIDATION
// ===============================




global.char_creation.locked_species = undefined;


global.char_creation.tooltip = {
    active: false,
    text: "",
    x: 0,
    y: 0
};


