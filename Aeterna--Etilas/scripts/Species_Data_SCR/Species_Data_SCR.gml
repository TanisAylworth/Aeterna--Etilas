function Species_Data_SCR()
{
    global.species_list = ["muttish_human", "holdstadtish_human"];

    global.species_data = {};

    // Add new species easily here
    add_species("muttish_human", {
        name: "Muttish Human",
        description: "Prolific and universal. They are everywhere and do everything well enough. Muttish Humans lack a specific nation or homeland due to their mixed origins, but their versatility allows them to thrive anywhere. As their name suggests, they are mutts of various human species and cultures. Their build and appearance range wildly across the human spectrum, with no standout physical traits. While they lack specialized advantages, their adaptability and well-rounded nature make them the most common and flexible of all human peoples.",
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
                    options: ["Professional", "Laborer", "Clerical", "Roguery", "Warfare", "Arcane", "Occult", "Survival"]
                }
            },
            knowledge_skills: {
                choices: {
                    count: 6,
                    options: []
                }
            },
            knowledge_talents: {
                choices: {
                    count: 1,
                    options: []
                }
            }
        }
    });

    add_species("holdstadtish_human", {
        name: "Holdstadtish Human",
        description: "Men that make up the western portion of Etilas. These people have a culture of strict honor and valor. They are warriors through and through, with a very military-oriented society and deep respect for warfare.Holdstadtish society values discipline, courage, and martial excellence above all else. Their rigid code of honor governs nearly every aspect of life, from personal conduct to national politics. While this makes them formidable soldiers and steadfast allies, it can also make them rigid and uncompromising in their worldview.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 2,
                endurance: 2,
				dexterity: 1,
                leadership: 1,
                perception: -1,
				intelligence: -3,
                reflexes: 1,
                charm: -3,
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
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Etiquette", rank: 1 },
                    { name: "Tactics", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
            knowledge_talents: {
                fixed: ["None"],
                choices: { count: 0, options: [] }
            }
        }
    });
}

// Helper to add species
function add_species(key, data)
{
    global.species_data[$ key] = data;
}