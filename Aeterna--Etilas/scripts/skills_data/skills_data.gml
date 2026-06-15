function skills_data(){
global.skill_data = {};

global.skill_data[$ "Animal Handling"] =
{
    name : "Animal Handling",

    table : "Survival",

    check :
    {
        attribute : "Willpower",
        modifier : -1
    },

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the care and maintenance of animals. Penalties to the roll are based on the creature's RA to the caretaker. Used in calming or handling an otherwise unruly creature."
};

global.skill_data[$ "Tracking"] =
{
    name : "Tracking",
    table : "Survival",

    check :
    {
        attribute : "Perception",
        modifier : 0
    },

    difficulty : global.SKILL_SIMPLE,

    description :
        "Follow tracks and signs left behind by creatures."
};
}