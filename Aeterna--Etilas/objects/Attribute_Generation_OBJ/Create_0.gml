// obj_char_creation Create

randomize();

global.char_creation = {
    roll_pool: generate_roll_pool(),
    assigned: {},
    selected_roll_index: -1
};

global.char_creation.history = [];

// initialize attribute slots
global.ATTRIBUTES = [
    "strength",
    "dexterity",
    "endurance",
    "willpower",
    "perception",
    "intelligence",
    "reflexes",
    "toughness",
    "leadership",
    "charm"
];

for (var i = 0; i < array_length(global.ATTRIBUTES); i++) {
    var attr = global.ATTRIBUTES[i];
    variable_struct_set(global.char_creation.assigned, attr, undefined);
}


var test = generate_roll_pool();
show_debug_message("ROLL TEST: " + string(test));
