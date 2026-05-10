function Species_Data_SCR() {

    global.species_list = [
        "muttish_human",
		"holdstadtish_human"
    ];

    global.species_data = {

    muttish_human: {

    // =====================================
    // IDENTITY
    // =====================================

    name: "Muttish Human",

    description:
        "Prolific and universal. They are everywhere and do everything well enough. Muttish Humans are most notably able to interact with all other races but don’t have many advantages but they are well rounded and versatile. The Muttish are as their name suggests Mutts of various human species and cultures from around the world giving them no discernible stand out qualities.",


    // =====================================
    // PERMANENT RACIAL STATS
    // =====================================

    stats: {

        cdt: 6,

        attributes: {
            strength: 0,
            dexterity: 0,
            endurance: 0,
            reflexes: 0,
            intelligence: 0,
            perception: 0,
            willpower: 0,
            charm: 0,
            toughness: 0,
            leadership: 0
        },

        abilities: [
            "None"
        ],

        negatives: [
            "None"
        ],

        traits: [
            "Medium",
            "Universal"
        ]
    },


    // =====================================
    // CHARACTER CREATION RULES
    // =====================================

    creation: {

        attribute_adjustments: {
	    type: "choice",
	    choices: 2,
	    amount: 1
	},

        knowledge_tables: {

            choices: 3,

            options: [
                "Professional",
                "Laborer",
                "Clerical",
                "Roguery",
                "Warfare",
                "Arcane",
                "Occult",
                "Survival"
            ]
        },

        knowledge_skills: {
            choices: 4
        },

        knowledge_talents: {
            choices: 1
        },

        cultural_knowledge_skills: {
            choices: 4
		},

        cultural_knowledge_talents: {
            choices: 1
		},

        hit_locations: {
		data: {
        head: [1],
        torso: [2,3,4],
        left_arm: [5],
        right_arm: [6],
        left_leg: [7,8],
        right_leg: [9,10]
		    },

		    order: [
		        "head",
		        "torso",
		        "right_arm",
		        "left_arm",
		        "left_leg",
				"right_leg"
		    ]
		},

        abilities: [
            "None"
        ],

        negatives: [
            "None"
        ],

        traits: [
            "Medium",
			"Universal"
        ]
		
	}
		
    },

    holdstadtish_human: {

    name: "Holdstadtish Human",

    description:
        "Massive descendants of ancient titans possessing immense physical strength.",


    // =========================
    // PERMANENT STATS
    // =========================

    stats: {

        cdt: 16,

        attributes: {
            strength: 4,
            dexterity: -2,
            endurance: 2
        },

        abilities: [
            "War Roar"
        ],

        negatives: [
            "Slow Reflexes"
        ],

        traits: [
            "Large",
            "Darkvision"
        ],
		
		 hit_locations: {
		data: {
        head: [1],
        torso: [2,3,4],
        left_arm: [5],
        right_arm: [6],
        left_leg: [7,8],
        right_leg: [9,10]
		    },

		    order: [
		        "head",
		        "torso",
		        "right_arm",
		        "left_arm",
		        "left_leg",
				"right_leg"
		    ]
		}
		
		
    },


    // =========================
    // CHARACTER CREATION RULES
    // =========================

    creation: {

        attribute_adjustments: {
		    type: "fixed",
		    values: {
		        strength: 4,
		        dexterity: -2,
		        endurance: 2
		    }
		},

        knowledge_tables: {
            choices: 1,
            options: [
                "Clan Traditions"
            ]
        },

        knowledge_skills: {
            choices: 1,
            options: [
                "Intimidation"
            ]
        },

        knowledge_talents: {
            choices: 1,
            options: [
                "Mountain Born"
            ]
        },
		
		 hit_locations: {
		data: {
        head: [1],
        torso: [2,3,4],
        left_arm: [5],
        right_arm: [6],
        left_leg: [7,8],
        right_leg: [9,10]
		    },

		    order: [
		        "head",
		        "torso",
		        "right_arm",
		        "left_arm",
		        "left_leg",
				"right_leg"
		    ]
		},
		
		traits: [
            "Large",
            "Darkvision"
        ],
		
    }
}

};
}