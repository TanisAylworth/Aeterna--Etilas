

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
];
var cc = global.char_creation;

if (!is_struct(cc)) exit;
if (!variable_struct_exists(cc, "steps")) exit;

var step = cc.steps[cc.step_index];

switch(step.type)
{
    case "roll_assign":

        attribute_step_init(cc);
        attribute_step_update(cc);

        break;
}


// CONFIRM SPECIES BUTTON

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (cc.step_index == 0 && cc.locked_species != undefined){
    if (mouse_check_button_pressed(mb_left)){
        if (point_in_rectangle(mx, my, 1600, 900, 1850, 980))
        {
            cc.confirmed_species = cc.locked_species;
            cc.species = cc.locked_species;

            cc.step_index += 1;
        }
    }
}