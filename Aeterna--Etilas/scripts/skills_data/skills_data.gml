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

    difficulty : global.SKILL_INTERMEDIATE,

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

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for offering bribes to sway the decision making process of a group or individuals. Note this is not a catch all. Penalties are based on RA of the target."
};


global.skill_data[$ "Crowd Working"] =
{
    name : "Crowd Working",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : +2
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for interacting with a crowd to push them into a desired emotional direction works in tandem with some bard songs. Penalties are based on the size and RA of the crowd."
};

global.skill_data[$ "Dancing"] =
{
    name : "Dancing",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Dexterity",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the artful display of dancing. Penalties are based on dancing conditions such as surface and lighting."
};




global.skill_data[$ "Wagoneering"] =
{
    name : "Wagoneering",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Willpower",
		            modifier : -2
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill that tests the ability to maneuver wagons under stress."
};


global.skill_data[$ "Drinking"] =
{
    name : "Drinking",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Endurance",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for competitive drinking. Each test is increasingly more difficult increasing the penalty by 1 each test. 3 consecutive fails means you have blacked out."

};


global.skill_data[$ "Eating"] =
{
    name : "Eating",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Endurance",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for competitive eating. Each test increases the penalty by 1 with 3 consecutive failed tests resulting in vomiting."

};


global.skill_data[$ "Etiquette"] =
{
    name : "Etiquette",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for providing appropriate cultural actions during interactions to show respect."

};


global.skill_data[$ "Firebuilding w/ Kit"] =
{
    name : "Firebuilding w/ Kit",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Dexterity",
		            modifier : 0
		        },
				
				{
		            attribute : "Intelligence",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for starting fires assuming you have a tinder box or firebuilding kit."

};


global.skill_data[$ "Fire Control"] =
{
    name : "Fire Control",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Perception",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for maximizing or minimizing damage caused by a raging flame."

};



global.skill_data[$ "Caching"] =
{
    name : "Caching",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Perception",
		            modifier : -2
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for hiding something for safe keeping. Unlike Hide caching is long term. Specifically refers to items. Also required for relocating the object at a later date."

};



global.skill_data[$ "Navigation"] =
{
    name : "Navigation",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Intelligence",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for finding one’s location and determining the correct direction to follow to reach a destination."

};

global.skill_data[$ "Observation"] =
{
    name : "Observation",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Intelligence",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for using Intelligence to deduce information from a scene. A method used in detecting out of place small details be it scratches on the floor or a person of interest in a crowd."

};


global.skill_data[$ "Persuasion"] =
{
    name : "Persuasion",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for convincing someone to perform an act or believe something they normally wouldn’t within reason. This is contested against the target’s logic test."

};



global.skill_data[$ "Rope Use"] =
{
    name : "Rope Use",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Dexterity",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the proper application of rope for various purposes."

};


global.skill_data[$ "Singing"] =
{
    name : "Singing",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for performing vocally. Can be used for Bardic Performances."

};


global.skill_data[$ "Riding (X)"] =
{
    name : "Riding",

    table : "General",
	
	specialization :
    {
        required : true,

        choices :
        [
            "Horses",
            "Camels",
            "Dogs",
            "Boars",
            "Goats",
            "Swamp Crocs"
        ]
    },

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Dexterity",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for tracking prowess with a weapon."

};


global.skill_data[$ "Whistling"] =
{
    name : "Whistling",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : -1
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for producing tones using one’s lips. Can be used for Bardic Performances."

};



global.skill_data[$ "First Aid"] =
{
    name : "First Aid",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Willpower",
		            modifier : 0
		        },
				
				{
		            attribute : "Intelligence",
		            modifier : +2
		        }
				
		    ]
			
			
			
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for the rendering of immediate medical attention. Can staunch bleeding, and prolong the onset of death but does not stabilize only provided a bonus to death saves equal to degrees of success."

};


global.skill_data[$ "Local History"] =
{
    name : "Local History",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Intelligence",
		            modifier : 0
		        },
				
				
				{
		            attribute : "Charm",
		            modifier : +1
		        },
				
				
				{
		            attribute : "Perception",
		            modifier : -2
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for gleaning or recalling recent events from eavesdropping or important contextual clues as to why something is important. "

};



global.skill_data[$ "Musical Instrument (X)"] =
{
    name : "Musical Instrument",

    table : "General",
	
	specialization :
    {
        required : true,

        choices :
        [
            "Lute",
            "Flute",
            "Lyre",
            "Drum",
            "Pan Flute",
            "Triangle"
        ]
    },

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Charm",
		            modifier : -1
		        }
		    ]
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill for producing tones using one’s lips. Can be used for Bardic Performances."

};



global.skill_data[$ "Intimidation"] =
{
    name : "Intimidation",

    table : "General",

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Strength",
		            modifier : +2
		        },
				
				{
		            attribute : "Charm",
		            modifier : -1
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for influencing someone through physical presence."

};


global.skill_data[$ "Swimming"] =
{
    name : "Swimming",

    table : "General",

    check :
		{
		    mode : "size",
		    size_attributes:
	        {
	            tiny:    { attribute: "Dexterity", modifier: 0 },
	            small:   { attribute: "Dexterity", modifier: 0 },
	            medium:  { attribute: "Strength",  modifier: 0 },
	            large:   { attribute: "Strength",  modifier: 0 },
	            huge:    { attribute: "Strength",  modifier: 0 }
	        }
		},

    difficulty : global.SKILL_SIMPLE,

    description :
        "A skill at maintaining positive buoyancy in the water. Success means you float. Failure means you sink and begin drowning. Endurance tests are made as if the creature is being suffocated. You receive a penalty to the swim check equal to the weight penalty of your gear."

};


global.skill_data[$ "Climbing"] =
{
    name: "Climbing",
    table: "General",
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for scaling terrain. This cannot be performed on sheer surfaces like walls.",
    default_attribute: "Strength",
	
    check:
    {
        mode: "size",
        size_attributes:
        {
            tiny:    { attribute: "Dexterity", modifier: 0 },
            small:   { attribute: "Dexterity", modifier: 0 },
            medium:  { attribute: "Strength",  modifier: 0 },
            large:   { attribute: "Strength",  modifier: 0 },
            huge:    { attribute: "Strength",  modifier: 0 }
        }
    }
};


global.skill_data[$ "Weapon Skill (X)"] =
{
    name : "Weapon Skill",

    table : "General",
	
	specialization :
    {
        required : true,

        choices :
        [
            "Knives",
            "Daggers",
            "Swords",
            "Axes",
            "Clubs",
            "Polearms"
        ]
    },

    check :
		{
		    mode : "best",

		    attributes :
		    [
		        {
		            attribute : "Dexterity",
		            modifier : 0
		        }
		    ]
		},

    difficulty : global.SKILL_INTERMEDIATE,

    description :
        "A skill for tracking prowess with a weapon."

};


#endregion


}