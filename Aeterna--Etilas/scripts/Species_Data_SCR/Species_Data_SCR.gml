function Species_Data_SCR()
{
    global.species_list = [
    "muttish_human",
    "holdstadtish_human",
    "corintish_human",
    "hoofskull",
    "galish",
    "galheston",
    "galgaharad",
    "galnim",
    "xiba_xida",
    "xiba_xisu",
    "votalli_ctai",
    "votalli_ctal",
    "lowlind_gnome",
    "higland_gnome",
    "durendim_lagrundun",
    "durendim_hagrundun",
    "skireen_icelindish",
    "skireen_feldlindish",
    "goblin",
    "orc",
    "hobs",
    "orrol",
    "gnoll",
    "nezumi",
    "kobold",
    "minos",
    "fae_fairy",
    "felinim"
];

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
                    strength: 2,
	                endurance: 2,
					dexterity: 1,
	                leadership: 1,
	                perception: -1,
					intelligence: -3,
	                reflexes: 1,
	                charm: -3,
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


    add_species("corintish_human", {
        name: "Corintish Human",
        description: "These people inhabit the southern central region of Etilas just North of Sun’s Rise. These are scholarly people with a focus on the gathering and discovery of knowledge.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -1,
                dexterity: 1,
                endurance: 0,
                reflexes: 0,
                intelligence: 2,
                perception: 0,
                willpower: -1,
                charm: 0,
                toughness: -1,
                leadership: 0
            },
            abilities: [],
            negatives: ["Curious"],
            traits: ["medium", "free_thinking"],
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
                    intelligence: 2,
                    dexterity: 1,
                    strength: -1,
                    toughness: -1,
                    willpower: -1
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Read and Write (Common)", rank: 3 },
                    { name: "Ancient History", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("hoofskull", {
        name: "HoofSkull",
        description: "These people inhabit the recently taken Minotaur capital. After a prosperous rise from poverty they wish to declare themselves independent from Holdstadt and are adept at naval war and ambush.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 0,
                dexterity: 1,
                endurance: 1,
                reflexes: 0,
                intelligence: -1,
                perception: 0,
                willpower: 0,
                charm: -1,
                toughness: 1,
                leadership: -1
            },
            abilities: ["Ash Landers", "Trauma"],
            negatives: ["Unkempt", "Bad Reputation"],
            traits: [],
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
                    dexterity: 1,
                    toughness: 1,
                    endurance: 1,
                    charm: -1,
                    leadership: -1,
                    intelligence: -1
                }
            },
            knowledge_tables: {
                fixed: ["Laborer", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Seamanship", rank: 1 },
                    { name: "Survival (Wastes)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

        add_species("galish", {
        name: "Galish",
        description: "The Galish are a short bipedal nature attuned folk. They have slender and very angular frames, and stand about 4-4½ feet tall. Though they are slender they make up in bulk for speed. They are a fickle people and can hop from idea to idea nigh instantly and are incredibly quick to lose interest in things. As they age they become more disinterested with the world around them but with that comes a difference in temperament. They become more sagely and patient with thought.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -1,
                dexterity: 2,
                endurance: 0,
                reflexes: 1,
                intelligence: 0,
                perception: 0,
                willpower: -1,
                charm: 1,
                toughness: -1,
                leadership: -1
            },
            abilities: ["Nature Meld"],
            negatives: ["Fickle", "Untrustworthy"],
            traits: ["small", "infravision", "unaging", "keen_senses"],
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
                    dexterity: 2,
                    reflexes: 1,
                    charm: 1,
                    strength: -1,
                    toughness: -1,
                    leadership: -1,
                    willpower: -1
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Lore (Nature)", rank: 3 },
                    { name: "Animal Handling", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("galheston", {
        name: "GalHeston",
        description: "The GalHeston tribe of the Galish is predominantly made of older members of Galish society and they believe it is wise to uphold their treaties with the other races in Etilas. They are often viewed as more trustworthy but they seem oblivious to the danger being caused by their cousins the Galgaharad.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -1,
                dexterity: 0,
                endurance: 0,
                reflexes: 1,
                intelligence: 1,
                perception: -2,
                willpower: 2,
                charm: 0,
                toughness: -1,
                leadership: 0
            },
            abilities: ["Nature Meld"],
            negatives: ["Fickle"],
            traits: ["small", "infravision", "unaging", "keen_senses"],
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
                    intelligence: 1,
                    reflexes: 1,
                    willpower: 2,
                    strength: -1,
                    perception: -2,
                    toughness: -1
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Diplomacy", rank: 2 },
                    { name: "Survival (Forest)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("galgaharad", {
        name: "GalGaHarad",
        description: "The GalGaHarad tribe of the Galish are predominantly younger Galish who follow their tribe leader GalGaHarad Helminier. He has made a public declaration that the other sentient beings of this realm are the reason that their Goddess Nai allowed the invasion to occur.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 0,
                dexterity: 2,
                endurance: -1,
                reflexes: 2,
                intelligence: 0,
                perception: 2,
                willpower: -2,
                charm: -2,
                toughness: -1,
                leadership: 0
            },
            abilities: ["Nature Meld"],
            negatives: ["Fickle", "Untrustworthy"],
            traits: ["small", "infravision", "unaging", "keen_senses"],
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
                    dexterity: 2,
                    reflexes: 2,
                    perception: 2,
                    willpower: -2,
                    charm: -2,
                    toughness: -1,
                    endurance: -1
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Wild Fighting", rank: 1 },
                    { name: "Survival (Forest)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("galnim", {
        name: "Galnim",
        description: "These People are a new race to Etilas and are the half breeds of Humans and Galish. They share the best of both races including the Galish’s Infravision and the Human’s ubiquity, however their ties to the Galish still hold some of the negative connotations.",
        stats: {
            cdt: 6, // Average - will be overridden by parent CDT in creation
            attributes: {}, // Combined from parents
            abilities: ["Half Breed"],
            negatives: ["Half Breed", "Despised"],
            traits: ["hideable_features", "long_lived", "infravision", "stunty"],
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
                type: "parent_combined"
            },
            knowledge_tables: {
                type: "parent_combined",
                count: 1
            },
            knowledge_skills: {
                type: "parent_combined",
                count: 1
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

add_species("xiba_xida", {
        name: "Xi Da",
        description: "The Xi Da are the dark-furred Xiba who were the first to leave the cave and 'abandon' the sun’s watch. They are smaller than their cousins but can fly and are much more adept at interacting with other races.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 0,
                dexterity: 2,
                endurance: -2,
                reflexes: 1,
                intelligence: 0,
                perception: 2,
                willpower: 0,
                charm: 0,
                toughness: 0,
                leadership: -1
            },
            abilities: ["Screech", "Echolocation"],
            negatives: ["Blind"],
            traits: ["small", "winged"],
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
                    dexterity: 2,
                    perception: 2,
                    reflexes: 1,
                    endurance: -2,
                    leadership: -1
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Roguery"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Artistic Ability (X)", rank: 3 },
                    { name: "Bargain", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("xiba_xisu", {
        name: "Xi Su",
        description: "The Xi Su are often called Sun bats and are the folk that reportedly claim to have raised the sun into the sky and now protect its resting place. They are much larger and more powerful and have much lighter fur colors.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 1,
                dexterity: -1,
                endurance: 2,
                reflexes: -1,
                intelligence: 0,
                perception: 0,
                willpower: 0,
                charm: 0,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Screech", "Echolocation"],
            negatives: ["Blind"],
            traits: ["winged"],
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
                    endurance: 2,
                    dexterity: -1,
                    reflexes: -1
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Religion", rank: 3 },
                    { name: "Blind Fighting", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
	
	    add_species("votalli_ctai", {
        name: "C’Tai",
        description: "These Vo’Tali are nothing less than impressive. Each standing heads over a full grown man and built with muscle and covered in a thick protective scale hide. These creatures are formidable warriors with the ferocity of pure natural instinct.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 3,
                dexterity: -1,
                endurance: 0,
                reflexes: 0,
                intelligence: -5,
                perception: 1,
                willpower: 0,
                charm: -1,
                toughness: 2,
                leadership: 0
            },
            abilities: ["Scaled"],
            negatives: ["Slaves to Shamans"],
            traits: ["large", "fang_and_claw", "infravision"],
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
                    strength: 3,
                    toughness: 2,
                    perception: 1,
                    dexterity: -1,
                    charm: -1,
                    intelligence: -5
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Swamp)", rank: 1 },
                    { name: "Wild Fighting", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("votalli_ctal", {
        name: "C’Tal",
        description: "These Vo’Tali are direct opposites of their genetic cousins. They are much smaller and much smarter, acting as religious figures and shamanic guides for tribes.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                intelligence: 0,
                perception: 2,
                willpower: -2,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Chameleon Skin"],
            negatives: ["Shifty"],
            traits: ["small", "fang_and_claw", "infravision", "venomous"],
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
                    dexterity: 4,
                    reflexes: 4,
                    perception: 2,
                    strength: -2,
                    toughness: -2,
                    endurance: -2,
                    willpower: -2,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Religion", rank: 1 },
                    { name: "Survival (Swamp)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("lowlind_gnome", {
        name: "Lowlind Gnome",
        description: "These Gnomes are well known for their ability to innovate and create machines and feats of engineering. They own the territory of Gold Vale which is a merchant utopia of crafts and inventions.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 1,
                endurance: 0,
                reflexes: 0,
                intelligence: 2,
                perception: 0,
                willpower: 0,
                charm: 0,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Low Light Vision", "Ingenious"],
            negatives: ["ScatterBrained"],
            traits: ["tiny_small"],
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
                    intelligence: 2,
                    dexterity: 1,
                    strength: -2,
                    toughness: -1
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Professional"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Read and Write (X)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("higland_gnome", {
        name: "HigLand Gnome",
        description: "These Gnomes evolved to live underground meaning they are much smaller than their average size usually in the lower percentile however their eyes can see in the dark almost perfectly.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 1,
                endurance: 1,
                reflexes: 1,
                intelligence: 1,
                perception: 0,
                willpower: 0,
                charm: -3,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Dark Vision", "Underground GPS"],
            negatives: [],
            traits: ["tiny"],
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
                    dexterity: 1,
                    endurance: 1,
                    reflexes: 1,
                    intelligence: 1,
                    charm: -3
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Fast Talking", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
	
	    add_species("durendim_lagrundun", {
        name: "Lagrundun",
        description: "These Duren are extremely reclusive and are borderline racist. They despise other races for no real reason other than not being Duren. They are short standing at max 5ft but are strong and stout and industrious.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 2,
                dexterity: -1,
                endurance: 2,
                reflexes: -1,
                intelligence: 0,
                perception: 0,
                willpower: 0,
                charm: -4,
                toughness: 2,
                leadership: 0
            },
            abilities: ["Dark Vision", "Stoneborn"],
            negatives: ["Belligerent", "Light Sensitive"],
            traits: ["stout"],
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
                    strength: 2,
                    toughness: 2,
                    endurance: 2,
                    dexterity: -1,
                    reflexes: -1,
                    charm: -4
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Close Quarters Combat", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("durendim_hagrundun", {
        name: "Hagrundun",
        description: "These Duren have accepted an Oath of Exile from the Mountain Homes and are now left on the surface world. They have an amazing Wanderlust and need to explore the over world.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 1,
                dexterity: -1,
                endurance: 2,
                reflexes: -1,
                intelligence: 0,
                perception: 0,
                willpower: 0,
                charm: 0,
                toughness: 1,
                leadership: 0
            },
            abilities: ["Stoneborn"],
            negatives: ["Exiled", "Wanderlust"],
            traits: ["stout"],
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
                    toughness: 1,
                    endurance: 2,
                    dexterity: -1,
                    reflexes: -1
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (X)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("skireen_icelindish", {
        name: "IceLindish",
        description: "These Skireen hail from the far frozen north. They have traveled a far distance to Etilas following their wanderlust and want for adventure. They are much more built then their cousins the Feldlindish.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 0,
                dexterity: 1,
                endurance: 0,
                reflexes: 1,
                intelligence: 0,
                perception: 0,
                willpower: -1,
                charm: 0,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Thick Feathers", "Flight"],
            negatives: ["Bird Bones"],
            traits: ["talons_and_beak"],
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
                    dexterity: 1,
                    reflexes: 1,
                    willpower: -1,
                    toughness: -1
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Professional"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Arctic)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("skireen_feldlindish", {
        name: "Feldlindish",
        description: "These Skireen are much smaller than the other two but make up for in their size with incredible speeds. They suffer the same wanderlust as their cousins but also sport an exotically colored plumage.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -4,
                dexterity: 4,
                endurance: -4,
                reflexes: 6,
                intelligence: 0,
                perception: 4,
                willpower: -4,
                charm: 2,
                toughness: -6,
                leadership: 0
            },
            abilities: ["Flight", "Eagle Eyes", "Twitch Reflexes", "Agile Flyer"],
            negatives: ["Bird Bones", "Beautiful Plumage"],
            traits: ["talons_and_beak", "no_molting"],
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
                    dexterity: 4,
                    reflexes: 6,
                    perception: 4,
                    charm: 2,
                    strength: -4,
                    toughness: -6,
                    willpower: -4,
                    endurance: -4
                }
            },
            knowledge_tables: {
                fixed: ["Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (X)", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Spot", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
	
	    // Goblin and subspecies
    add_species("goblin", {
        name: "Goblin",
        description: "These small canine humanoids are prolific they inhabit all locations. They are not conventionally intelligent but are certainly crafty. They are very small standing at the tallest 3’.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 2,
                endurance: 0,
                reflexes: 2,
                intelligence: -2,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Pack Tactics", "Natural Camouflage", "Scent"],
            negatives: ["Skittish"],
            traits: ["infravision", "tiny_small", "fang_and_claw"],
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
                    dexterity: 2,
                    reflexes: 2,
                    perception: 3,
                    strength: -2,
                    toughness: -2,
                    willpower: -3,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Home Terrain)", rank: 1 },
                    { name: "Ambush", rank: 1 },
                    { name: "Hunting", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("waste_goblin", {
        name: "Waste Goblin",
        description: "Goblins from the ash wastes of Holdstadt. They are much more enduring and have pallid grey skin. They have adapted to not needing much food or water, are avid diggers, and amazing ambush predators.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 2,
                endurance: 3,
                reflexes: 2,
                intelligence: -2,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Overwhelming Swarm", "Natural Camouflage", "Scent", "Burrow"],
            negatives: ["Skittish", "Hated"],
            traits: ["infravision", "tiny", "fang_and_claw"],
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
                    dexterity: 2,
                    reflexes: 2,
                    endurance: 3,
                    perception: 3,
                    strength: -2,
                    toughness: -2,
                    willpower: -3,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Waste)", rank: 1 },
                    { name: "Ambush", rank: 1 },
                    { name: "Hunting", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("forest_goblin", {
        name: "Forest Goblin",
        description: "These goblins are green skinned and brown furred. They live in the canopies of trees and regularly use their height advantage to ambush unsuspecting passerbys.",
        stats: {
            cdt: 4,
            attributes: {
                strength: 2,
                dexterity: 2,
                endurance: 0,
                reflexes: 2,
                intelligence: -2,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Pack Tactics", "Natural Camouflage", "Scent"],
            negatives: ["Skittish"],
            traits: ["infravision", "tiny", "fang_and_claw"],
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
                    strength: 2,
                    dexterity: 2,
                    reflexes: 2,
                    perception: 3,
                    willpower: -3,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Forest)", rank: 1 },
                    { name: "Ambush", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Climbing", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("plains_goblin", {
        name: "Plains Goblin",
        description: "These goblins are light brown skinned and furred. They are the most known goblin type for using tools. They build camps with palisades and use manufactured weapons.",
        stats: {
            cdt: 4,
            attributes: {
                strength: 0,
                dexterity: 2,
                endurance: -2,
                reflexes: 2,
                intelligence: 0,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 2
            },
            abilities: ["Pack Tactics", "Natural Camouflage", "Scent"],
            negatives: ["Bold"],
            traits: ["infravision", "tiny_small", "fang_and_claw"],
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
                    dexterity: 2,
                    reflexes: 2,
                    perception: 3,
                    leadership: 2,
                    endurance: -2,
                    willpower: -3,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Roguery", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidate", rank: 1 },
                    { name: "Ambush", rank: 1 },
                    { name: "Bargain", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("cave_goblin", {
        name: "Cave Goblin",
        description: "These goblins are all but blind and have vestigial large white eyes and pale skin. They are amazing navigators and stone workers.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 2,
                endurance: 0,
                reflexes: 2,
                intelligence: -2,
                perception: 5,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Pack Tactics", "Natural Camouflage", "Tremor Sight"],
            negatives: ["Skittish", "Blind"],
            traits: ["infravision", "tiny_small", "fang_and_claw"],
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
                    dexterity: 2,
                    reflexes: 2,
                    perception: 5,
                    strength: -2,
                    toughness: -2,
                    willpower: -3,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Cave)", rank: 1 },
                    { name: "Ambush", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Blind Fighting", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
    // (I can add the other Goblin subspecies if you want them as separate entries)

    add_species("orc", {
        name: "Orc",
        description: "These stunted pig folk are universally a bad sign. They are shorter than the average man but incredibly durable and strong.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 2,
                dexterity: -2,
                endurance: 2,
                reflexes: 0,
                intelligence: -2,
                perception: 0,
                willpower: 0,
                charm: -2,
                toughness: 2,
                leadership: 0
            },
            abilities: ["Scent", "Rough Hide"],
            negatives: ["Filthy Pigs"],
            traits: ["carnivorous", "stout", "tusked"],
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
                    strength: 2,
                    toughness: 2,
                    endurance: 2,
                    dexterity: -2,
                    intelligence: -2,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Warfare", "Laborer"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("hobs", {
        name: "Hobs",
        description: "These are Half Breed creatures between Orcs and something else. Hobs are generally abused by both sides of the family and thus are very tough and used to taking beatings.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 0,
                dexterity: -2,
                endurance: 0,
                reflexes: -2,
                intelligence: 0,
                perception: 0,
                willpower: 4,
                charm: -4,
                toughness: 4,
                leadership: 0
            },
            abilities: ["Rough and Tumble"],
            negatives: ["Ugly", "Submissive"],
            traits: ["tusks", "claws", "low_light_vision"],
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
                    toughness: 4,
                    willpower: 2,
                    charm: -4,
                    reflexes: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Turtle", rank: 1 },
                    { name: "Taunt", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

        add_species("orrol", {
        name: "Orrol",
        description: "These are half breeds between trolls and orcs. They are massive troll-sized orc hybrids that have the best qualities of both parent. They have the strength and build of an orc and the size and stealth of a troll.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 3,
                dexterity: 2,
                endurance: 0,
                reflexes: 0,
                intelligence: -2,
                perception: 2,
                willpower: -2,
                charm: -4,
                toughness: 2,
                leadership: 0
            },
            abilities: ["Black Fur", "Scent"],
            negatives: ["Oiled Coat", "Monstrous", "Smelly", "Dull"],
            traits: ["large", "infravision"],
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
                    strength: 3,
                    dexterity: 2,
                    perception: 2,
                    toughness: 2,
                    charm: -4,
                    willpower: -2,
                    intelligence: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Roguery"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Sneak", rank: 1 },
                    { name: "Hide", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("gnoll", {
        name: "Gnoll",
        description: "Gnolls are large bipedal hyena like beings of pure narcissism. They are raised in brutal abusive family units where the dominant parent rules with an iron fist.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 2,
                dexterity: 2,
                endurance: 0,
                reflexes: 2,
                intelligence: 0,
                perception: 0,
                willpower: -2,
                charm: -2,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Wicked Laugh", "Blood Scent"],
            negatives: ["Hated", "Narcissist"],
            traits: ["infravision", "fang_and_claw"],
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
                    strength: 2,
                    dexterity: 2,
                    reflexes: 2,
                    willpower: -2,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidate", rank: 1 },
                    { name: "Taunt", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("nezumi", {
        name: "Nezumi",
        description: "These creatures hail from far west. They are small rat like humanoids which has won them no degree of discrimination. Most of the Nezumi that have crossed now live in poverty and are more or less forced to be criminals.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
                dexterity: 2,
                endurance: 0,
                reflexes: 2,
                intelligence: 0,
                perception: 2,
                willpower: -2,
                charm: -2,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Sensitive Tail", "Low Light Vision"],
            negatives: ["Vermin"],
            traits: ["small", "tooth_and_claw"],
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
                    dexterity: 2,
                    reflexes: 2,
                    perception: 2,
                    strength: -2,
                    willpower: -2,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Roguery", "Laborer"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Awareness", rank: 1 },
                    { name: "Stealth", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("kobold", {
        name: "Kobold",
        description: "These small draconic reptiles are said to be ancestors of the great dragons of Etilas. They are small, cunning, and proud of their draconic heritage.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -3,
                dexterity: 3,
                endurance: 0,
                reflexes: 3,
                intelligence: 0,
                perception: 2,
                willpower: -2,
                charm: -2,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Evolution"],
            negatives: [],
            traits: ["infravision", "fang_and_claw", "tiny"],
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
                    dexterity: 3,
                    reflexes: 3,
                    perception: 2,
                    strength: -3,
                    willpower: -2,
                    charm: -2
                }
            },
            knowledge_tables: {
                fixed: ["Laborer", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Mining", rank: 1 },
                    { name: "Survival (Underground)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("minos", {
        name: "Minos",
        description: "These creatures are intelligent and have societies much like the Gnolls. They are massive bull man hybrids known for their incredible strength and durability.",
        stats: {
            cdt: 12,
            attributes: {
                strength: 4,
                dexterity: -1,
                endurance: 0,
                reflexes: 0,
                intelligence: 0,
                perception: 0,
                willpower: 0,
                charm: -1,
                toughness: 0,
                leadership: 0
            },
            abilities: [],
            negatives: ["Brassen Horde"],
            traits: ["scent", "carnivorous", "gore"],
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
                    strength: 4,
                    toughness: 3,
                    dexterity: -1,
                    charm: -1,
                    intelligence: -1
                }
            },
            knowledge_tables: {
                fixed: ["Warfare", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Rage", rank: 1 },
                    { name: "Intimidation", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

    add_species("fae_fairy", {
        name: "Fairy",
        description: "The Fairies are minute beings resembling humanoids with insect wings. Standing no more than 4 inches tall these creatures seem harmless but they are unnaturally strong and have a host of natural powers.",
        stats: {
            cdt: 2,
            attributes: {
                strength: -2,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                intelligence: 2,
                perception: 2,
                willpower: -8,
                charm: 2,
                toughness: -2,
                leadership: -8
            },
            abilities: ["Nature Meld", "Shape Change", "Lullaby", "Glamour", "Nature Empathy"],
            negatives: ["Whimsical", "Distrust"],
            traits: ["flight", "minute", "true_sight"],
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
                    dexterity: 4,
                    reflexes: 4,
                    intelligence: 2,
                    perception: 2,
                    charm: 2,
                    strength: -2,
                    toughness: -2,
                    willpower: -8,
                    leadership: -8
                }
            },
            knowledge_tables: {
                fixed: ["Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Lore (Nature)", rank: 3 },
                    { name: "Lore (Druidry)", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

	    add_species("felinim", {
        name: "Felinim",
        description: "The Felinim originate from the Western Continent. They are renowned swordsman and avid pirates. They are agile and strong but are not very enduring. Their whimsical nature doesn’t make them good leaders though.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 1,
                dexterity: 2,
                endurance: -2,
                reflexes: 2,
                intelligence: 0,
                perception: 2,
                willpower: -1,
                charm: 2,
                toughness: -3,
                leadership: -1
            },
            abilities: ["Retractable Claws", "Roar"],
            negatives: ["Rare", "Distractible", "Cat Nap"],
            traits: ["low_light_vision", "scent", "tail", "carnivore", "thick_fur"],
            hit_locations: {
                data: {
                    head: [1],
                    torso: [2,3,4],
                    left_arm: [4],
                    right_arm: [5],
                    tail: [6],
                    left_leg: [7,8],
                    right_leg: [9,10]
                },
                order: ["head","torso","right_arm","left_arm","tail","left_leg","right_leg"]
            }
        },
        creation: {
            attribute_adjustments: {
                type: "fixed",
                values: {
                    dexterity: 2,
                    reflexes: 2,
                    perception: 2,
                    charm: 2,
                    strength: 1,
                    toughness: -3,
                    willpower: -1,
                    leadership: -1
                }
            },
            knowledge_tables: {
                fixed: ["Warfare", "Roguery"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidate", rank: 0 },
                    { name: "Spot", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
	
}
// Helper to add species
function add_species(key, data)
{
    global.species_data[$ key] = data;
}