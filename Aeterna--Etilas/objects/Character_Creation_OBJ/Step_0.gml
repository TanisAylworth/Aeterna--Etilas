

global.char_creation.steps = [

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
        next: "skills"
    },

    {
        id: "skills",
        title: "Choose Skills",
        type: "multi_select_limited",
        choices: 4,
        next: "finalize"
    }
];


