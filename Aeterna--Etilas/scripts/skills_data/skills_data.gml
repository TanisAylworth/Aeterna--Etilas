function skills_data(){
global.skill_data = {};


#region General
global.skill_data[$ "Animal Handling"] =
{
    name : "Animal Handling",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Willpower",
		            modifier : -1
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the care and maintenance of animals. Penalties to the roll are based on the creature's RA to the caretaker, and the animal's ruliness. Used in calming or handling an otherwise unruly creature."
};

global.skill_data[$ "Sailing"] =
{
    name : "Sailing",
    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Endurance",
		            modifier : -2
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for one’s ability to handle tasks aboard a ship. Setting rigging, climbing masts, and rowing are all difficult tasks for the uninitiated. Penalties are based on sailing conditions and time frame."
};


global.skill_data[$ "Bribery"] =
{
    name : "Bribery",
    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : -2
		        },

		        {
		            attribute : "Perception",
		            modifier : -2
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for offering bribes to sway the decision making process of a group or individuals. Note this is not a catch all. Penalties are based on RA of the target."
};


#endregion


}