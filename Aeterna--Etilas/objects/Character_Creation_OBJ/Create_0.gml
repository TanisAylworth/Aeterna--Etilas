// ===============================
// INIT GLOBAL DATA FIRST
// ===============================

Species_Data_SCR();
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
            rolls: 6,
            next: "knowledge_tables"
        },

        {
            id: "knowledge_tables",
            title: "Choose Knowledge Tables",
            type: "multi_select_limited",
            choices: 3,
            resolver: "get_species_knowledge_tables",
            next: "skills"
        },

        {
            id: "skills",
            title: "Choose Skills",
            type: "multi_select_limited",
            choices: 4,
            resolver: "get_available_skills",
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

show_debug_message("CREATE RUN");

if (is_struct(global.char_creation)) {
    show_debug_message("CHAR CREATION OK");
}

if (is_array(global.char_creation.steps)) {
    show_debug_message("STEPS OK: " + string(array_length(global.char_creation.steps)));
}


global.char_creation.locked_species = undefined;


global.char_creation.tooltip = {
    active: false,
    text: "",
    x: 0,
    y: 0
};