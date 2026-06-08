function skills_data(){
global.skill_data = {};

global.skill_data[$ "Animal Handling"] =
{
    table : "Survival",

    check :
    {
        attribute : "Willpower",
        modifier : -1
    },

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the care and maintenance of animals..."
};
}