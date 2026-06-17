function Species_Data_SCR()
{
    global.species_list = [
        "muttish_human",
        "holdstadtish_human"
    ];

    global.species_data = {

    // =====================================================
    // MUTTISH HUMAN
    // =====================================================
    muttish_human: {

        name: "Muttish Human",

        description:
            "Prolific and universal. Well-rounded but not exceptional.",

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

            abilities: [],
            negatives: [],
            traits: ["medium", "universal"],

            hit_locations: {
                data: {
                    head: [1],
                    torso: [2,3,4],
                    left_arm: [5],
                    right_arm: [6],
                    left_leg: [7,8],
                    right_leg: [9,10]
                },
                order: ["head","torso","right_arm","left_arm","left_leg","right_leg"]
            }
        },

        creation: {

            attribute_adjustments: {
                type: "choice",
                count: 2,
                amount: 1
            },

            knowledge_tables: {
                choices: {
                    count: 3,
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
                }
            },

            knowledge_skills: {
                choices: {
                    count: 4,
                    options: []
                }
            },

            knowledge_talents: {
                choices: {
                    count: 1,
                    options: []
                }
            },

            cultural_knowledge_skills: {
                choices: {
                    count: 4,
                    options: []
                }
            },

            cultural_knowledge_talents: {
                choices: {
                    count: 1,
                    options: []
                }
            }
        }
    },

    // =====================================================
    // HOLDSTADTISH HUMAN
    // =====================================================
    holdstadtish_human: {

        name: "Holdstadtish Human",

        description:
            "Men that make up the western portion of Etilas. These people have a culture of strict honor and valor. They are warriors through and through with a very military oriented society and respect for warfare.",

        stats: {

            cdt: 8,

            attributes: {
                strength: 1,
                endurance: 1,
				leadership: 1,
				perception: -1,
				reflexes: -1,
				charm: -1,
            },

            abilities: [],
            negatives: ["strict code","stiff"],
            traits: ["martial_focus"],

            hit_locations: {
                data: {
                    head: [1],
                    torso: [2,3,4],
                    left_arm: [5],
                    right_arm: [6],
                    left_leg: [7,8],
                    right_leg: [9,10]
                },
                order: ["head","torso","right_arm","left_arm","left_leg","right_leg"]
            }
        },

        creation: {

            attribute_adjustments: {
                type: "fixed",
                values: {
                    strength: 1,
	                endurance: 1,
					leadership: 1,
					perception: -1,
					reflexes: -1,
					charm: -1,
                }
            },

            knowledge_tables: {
			    fixed: ["Warfare", "Professional"],
			    choices: {
			        count: 0,
			        options: []
			    }
			},

            knowledge_skills: {
			    fixed: [],
			    choices: {
			        count: 2,
			        options: ["Etiquette", "Tactics"]
			    }
			},

            knowledge_talents: {
			    fixed: ["None"],
			    choices: {
			        count: 0,
			        options: []
			    }
			},
        }
    }

    };
}
