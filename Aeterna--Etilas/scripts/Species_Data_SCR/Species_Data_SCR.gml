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
    //"galnim",
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
        description: "Prolific and ubiquitous, Muttish Humans can be found throughout Etilas and beyond, thriving in nearly every environment and occupation. They have no singular homeland, instead emerging from generations of intermingling between the many human peoples and cultures. Their varied ancestry gives them an enormous range of builds, features, and appearances, with no defining physical traits of their own. Though lacking the specialized advantages of other human peoples, their versatility and adaptability make them the most common and flexible of all humans.",
        stats: {
            cdt: 8,
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
                    count: 8,
                    options: []
                }
            },
            knowledge_talents: {
                fixed: ["Language (Common)",],
				choices: {
                    count: 2,
                    options: []
                }
            }
        }
    });

    add_species("holdstadtish_human", {
        name: "Holdstadtish Human",
        description: "The Holdstadtish inhabit the western portion of Etilas and are defined by strict honor, valor, and martial excellence. Their society is deeply shaped by warfare, with discipline, courage, loyalty, and service instilled from an early age. Their rigid code of honor governs everything from personal conduct to national politics, and a warrior's reputation reflects upon both themselves and their people. This devotion has made them formidable soldiers and steadfast allies, but their adherence to tradition can also make them rigid and uncompromising toward those who do not share their values.",
        stats: {
            cdt: 10,
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
                    { name: "Etiquette", rank: 2 },
                    { name: "Tactics", rank: 2 },
                    { name: "Running", rank: 0 },
                    { name: "Maintenance", rank: 1 },
                    { name: "Lore (Holdstadt)", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
            knowledge_talents: {
                fixed: ["Martial Training", "Language (Common)",],
                choices: { count: 0, options: [] }
            }
        }
    });

    add_species("corintish_human", {
        name: "Corintish Human",
        description: "The Corintish inhabit the southern central region of Etilas, just north of Sun’s Rise. They are among the most educated people in the known world, with a culture devoted to the pursuit and preservation of knowledge. Their cities are filled with colleges, libraries, and academies, and education is widely respected. Scholars, teachers, and researchers hold considerable social prestige, while the sharing of knowledge is viewed as a responsibility to future generations.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -1,
                dexterity: 1,
                endurance: 0,
                reflexes: 1,
                intelligence: 2,
                perception: 1,
                willpower: -1,
                charm: 1,
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
                    strength: -1,
                dexterity: 1,
                reflexes: 1,
                intelligence: 2,
                perception: 1,
                willpower: -1,
                charm: 1,
                toughness: -1,
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Ancient History", rank: 1 },
					{ name: "Local History", rank: 2 },
					{ name: "Lore (Corinth)", rank: 1 },
					{ name: "Lore (Etilas)", rank: 1 },
					{ name: "Artistic Ability (Painting)", rank: 2 },
					{ name: "Intuition", rank: 2 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Read and Write (Common)", "Language (Common)",], choices: { count: 0, options: [] } }
        }
    });

    add_species("hoofskull", {
        name: "HoofSkull Human",
        description: "These rough, dark-skinned humans inhabit the recently conquered Minotaur capital, where generations of hardship have given way to prosperity. Their newfound wealth has fostered a fierce sense of independence, with growing calls to break from Holdstadt. Their history has also shaped their warfare, making them skilled in naval combat, coastal raids, and ambushes. They favor patience, concealment, and striking from unexpected positions rather than meeting enemies head-on.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 1,
                dexterity: 1,
                endurance: 3,
                reflexes: 0,
                intelligence: -2,
                perception: 0,
                willpower: 1,
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
                    strength: 1,
                dexterity: 1,
                endurance: 3,
                intelligence: -2,
                willpower: 1,
                charm: -1,
                toughness: 1,
                leadership: -1
                }
            },
            knowledge_tables: {
                fixed: ["Laborer", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Sailing", rank: 1 },
					{ name: "Hide", rank: 2 },
					{ name: "Dirty Tricks", rank: 1 },
                    { name: "Survival (Wastes)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Endurance", "Alertness", "Ambush", "Language (Common)",], choices: { count: 0, options: [] } }
        }
    });

    add_species("galish", {
        name: "Galish",
        description: "The Galish are short, bipedal, nature-attuned people with slender, angular frames, standing four to four and a half feet tall. Though slight, they possess surprising bulk and resilience. Galish are notoriously fickle, quickly jumping between interests and losing interest almost as fast. This restlessness fades with age, and older Galish become detached, patient, and contemplative, gaining the wisdom and temperament of a sage.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -2,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                intelligence: 0,
                perception: 3,
                willpower: -3,
                charm: 2,
                toughness: -2,
                leadership: -3
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
                    strength: -2,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                perception: 3,
                willpower: -3,
                charm: 2,
                toughness: -2,
                leadership: -3
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Lore (Nature)", rank: 3 },
                    { name: "Herbalism", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Animal Handling", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Language (Galish)",], choices: { count: 0, options: [] } }
        }
    });

    add_species("galheston", {
        name: "GalHeston",
        description: "The GalHeston are a tribe of predominantly older Galish who strongly uphold their treaties with the other races of Etilas. Their age and experience have earned them a reputation for wisdom, patience, and trustworthiness, making them reliable mediators and allies. However, their faith in diplomacy has left them seemingly oblivious to the growing threat posed by their cousins, the GalGaHarad.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -2,
                dexterity: 4,
                endurance: -3,
                reflexes: 4,
                intelligence: 2,
                perception: 3,
                willpower: -1,
                charm: 2,
                toughness: -3,
                leadership: -4
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
                    strength: -2,
                dexterity: 4,
                endurance: -3,
                reflexes: 4,
                intelligence: 2,
                perception: 3,
                willpower: -1,
                charm: 2,
                toughness: -3,
                leadership: -4
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Diplomacy", rank: 2 },
                    { name: "Meditate", rank: 2 },
                    { name: "Leadership", rank: 6 },
                    { name: "Ancient History", rank: 2 },
                    { name: "Survival (Forest)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Language (Common)", "Language (Galish)", ], choices: { count: 0, options: [] } }
        }
    });

    add_species("galgaharad", {
        name: "GalGaHarad",
        description: "The GalGaHarad are a tribe of predominantly younger Galish who follow their charismatic leader, GalGaHarad Helminier. Helminier claims that the other peoples of the realm provoked the Goddess Nai and caused her to allow the invasion. His teachings have fueled resentment toward outsiders and inspired a growing movement that rejects the treaties and coexistence upheld by their elders.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 0,
                dexterity: 3,
                endurance: 0,
                reflexes: 3,
                intelligence: -3,
                perception: 4,
                willpower: -4,
                charm: 0,
                toughness: -2,
                leadership: -4
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
                
                dexterity: 3,
                reflexes: 3,
                intelligence: -3,
                perception: 4,
                willpower: -4,
                toughness: -2,
                leadership: -4
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Tactics", rank: 1 },
                    { name: "Hide", rank: 1 },
                    { name: "Sneak", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Survival (Forest)", rank: 3 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Wild Fighting", ], choices: { count: 0, options: [] } }
        }
    });

   //add_species("galnim", {
   //     name: "Galnim",
   //     description: "These People are a new race to Etilas and are the half breeds of Humans and Galish. They share the best of both races including the Galish’s Infravision and the Human’s ubiquity, however their ties to the Galish still hold some of the negative connotations.",
   //     stats: {
   //         cdt: 6, // Average - will be overridden by parent CDT in creation
   //         attributes: {}, // Combined from parents
   //         abilities: ["Half Breed"],
   //         negatives: ["Half Breed", "Despised"],
   //         traits: ["hideable_features", "long_lived", "infravision", "stunty"],
   //         hit_locations: {
   //             data: {
   //                 head: [1],
   //                 torso: [2,3,4],
   //                 left_arm: [5],
   //                 right_arm: [6],
   //                 left_leg: [7,8],
   //                 right_leg: [9,10]
   //             },
   //             order: ["head","torso","right_arm","left_arm","left_leg","right_leg"]
   //         }
   //     },
   //     creation: {
   //         attribute_adjustments: {
   //             type: "parent_combined"
   //         },
   //         knowledge_tables: {
   //             type: "parent_combined",
   //             count: 1
   //         },
   //         knowledge_skills: {
   //             type: "parent_combined",
   //             count: 1
   //         },
	//		knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
   //     }
   // });

add_species("xiba_xida", {
        name: "Xi Da",
        description: "The Xi Da are dark-furred Xiba who were the first of their people to leave the cave, “abandoning” the watch of the sun. Smaller than their cousins, they possess wings and are far more adept at interacting with other races. Their long separation from the cave has made them accustomed to the wider world, allowing them to serve as traders, travelers, and intermediaries between the Xiba and other peoples.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -4,
                dexterity: 6,
                endurance: -2,
                reflexes: 4,
                intelligence: 0,
                perception: 2,
                willpower: 0,
                charm: 0,
                toughness: 0,
                leadership: -3
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
                    strength: -4,
                dexterity: 6,
                endurance: -2,
                reflexes: 4,
                perception: 2,
                leadership: -3
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Roguery"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Artistic Ability (Sculpting)", rank: 3 },
                    { name: "Bargain", rank: 2 },
                    { name: "Appraisal", rank: 2 },
                    { name: "Navigation", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Language (Xiba), Language (Common)"], choices: { count: 0, options: [] } }
        }
    });

add_species("xiba_xisu", {
        name: "Xi Su",
        description: "The Xi Su, often called Sun Bats, are Xiba who claim to have raised the sun into the sky and now protect it. They are considerably larger and more powerful than their Xi Da cousins, with much lighter fur reflecting their association with the sun. They are deeply devoted to this sacred duty, viewing the protection of the sun and its resting place as both a religious obligation and a defining part of their identity.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 2,
                dexterity: 2,
                endurance: 2,
                reflexes: 2,
                intelligence: -2,
                perception: 0,
                willpower: 2,
                charm: -3,
                toughness: 2,
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
                    strength: 2,
                dexterity: 2,
                endurance: 2,
                reflexes: 2,
                intelligence: -2,
                willpower: 2,
                charm: -3,
                toughness: 2,
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Religion", rank: 3 },
                    { name: "Weapon Skill (Polearms)", rank: 3 },
                    { name: "Lore (Sol)", rank: 1 },
                    { name: "Lore (Xiba)", rank: 1 },
                    { name: "Ancient History", rank: 1 },
                    { name: "Intimidate", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Blind Fighting", "Endurance"], choices: { count: 0, options: [] } }
        }
    });
	
add_species("votalli_ctai", {
        name: "C’Tai",
        description: "The Vo’Tali are imposing creatures, standing well above a full-grown man with powerful frames covered in thick, protective scales. They are fearsome warriors, combining immense strength with the raw ferocity of natural instinct. Their primal nature makes them relentless and dangerous opponents in battle.",
        stats: {
            cdt: 14,
            attributes: {
                strength: 6,
                dexterity: -4,
                endurance: 4,
                reflexes: -2,
                intelligence: -6,
                perception: 1,
                charm: -4,
                toughness: 6,
                leadership: -4
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
                   strength: 6,
                dexterity: -4,
                endurance: 4,
                reflexes: -2,
                intelligence: -6,
                perception: 1,
                willpower: 0,
                charm: -4,
                toughness: 6,
                leadership: -4
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Swamp)", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 4 },
                    { name: "Hunting", rank: 3 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Wild Fighting", "Endurance", "Rage", "Rage Power (Berserker)", "Grapple"], choices: { count: 0, options: [] } }
        }
    });

add_species("votalli_ctal", {
        name: "C’Tal",
        description: "The C'Tal are the smaller and more intelligent counterparts to their genetic cousins, shaped by thought rather than instinct. While their larger kin are known for physical might and ferocity, the C'Tal serve as religious figures, shamans, and spiritual guides. They preserve ancient traditions and knowledge, acting as healers, counselors, and interpreters of the natural and spiritual world. Their wisdom grants them considerable influence within their tribes.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -4,
                dexterity: 6,
                endurance: -2,
                reflexes: 6,
                intelligence: 0,
                perception: 4,
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
                    strength: -4,
                dexterity: 6,
                endurance: -2,
                reflexes: 6,
                perception: 4,
                willpower: -2,
                charm: -2,
                toughness: -2,
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Religion", rank: 3 },
                    { name: "Lore (Kithsai)", rank: 1 },
                    { name: "Herbalism", rank: 2 },
                    { name: "Oratory", rank: 1 },
                    { name: "Deception", rank: 1 },
                    { name: "Prestidigitation", rank: 1 },
                    { name: "Survival (Swamp)", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Perception",], choices: { count: 0, options: [] } }
        }
    });

add_species("lowlind_gnome", {
        name: "Lowlind Gnome",
        description: "These Gnomes stand at a vairance of 2' - 4' tall and are well known for their ability to innovate and create machines and feats of engineering. They own the territory of Gold Vale which is a merchant utopia of crafts and inventions.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -2,
                dexterity: 1,
                endurance: 1,
                reflexes: 0,
                intelligence: 4,
                perception: 0,
                willpower: -4,
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
                    strength: -2,
                dexterity: 1,
                endurance: 1,
                intelligence: 4,
                willpower: -4,
                }
            },
            knowledge_tables: {
                fixed: ["Clerical", "Professional"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Engineering", rank: 1 },
					{ name: "Appraisal", rank: 1 },
					{ name: "Diplomacy", rank: 1 },
					{ name: "Firearm Use", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Read and Write (Gnomish)", "Language (Gnomish)"], choices: { count: 0, options: [] } }
        }
    });

add_species("higland_gnome", {
        name: "HigLand Gnome",
        description: "These Gnomes evolved to live deep underground, resulting in smaller bodies that typically fall within the lower range of Gnomish stature. Their compact size allows them to navigate the cramped tunnels and passages of their subterranean homes with ease. Their most notable adaptation is their exceptional eyesight, allowing them to see in near-total darkness with remarkable clarity. Accustomed to life without natural light, they are equally comfortable navigating the deepest caverns as they are the surface world.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 1,
                dexterity: 1,
                endurance: 1,
                reflexes: 1,
                intelligence: 2,
                perception: -2,
                willpower: 0,
                charm: -3,
                toughness: 0,
                leadership: -2
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
                    strength: 1,
                dexterity: 1,
                endurance: 1,
                reflexes: 1,
                intelligence: 2,
                perception: -2,
                charm: -3,
                leadership: -2
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Clerical"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Fast Talking", rank: 1 },
					{ name: "Engineering", rank: 3 },
					{ name: "Firearm Use", rank: 1 },
					{ name: "Geology", rank: 1 },
					{ name: "Mining", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Read and Write (Gnomish)", "Language (Gnomish)"], choices: { count: 0, options: [] } }
        }
    });
	
add_species("durendim_lagrundun", {
        name: "Lagrundun",
        description: "These Duren are an extremely reclusive people, rarely welcoming outsiders into their communities and viewing other races with deep suspicion. Their distrust often borders on outright prejudice, with little justification beyond the simple belief that those who are not Duren are inherently lesser or unworthy of trust. Short and stout, rarely exceeding five feet in height, they possess surprising strength and endurance for their size. Despite their isolation, the Duren are highly industrious and take great pride in hard work, craftsmanship, and self-sufficiency.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 3,
                dexterity: -1,
                endurance: 3,
                reflexes: -2,
                intelligence: -2,
                perception: 0,
                willpower: 0,
                charm: -4,
                toughness: 4,
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
                    strength: 3,
                dexterity: -1,
                endurance: 3,
                reflexes: -2,
                intelligence: -2,
                charm: -4,
                toughness: 4,
                }
            },
            knowledge_tables: {
                fixed: ["Professional", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Weapon Skill (Axes)", rank: 3 },
					{ name: "Blacksmithing", rank: 3 },
					{ name: "Maintainence", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Close Quarters Combat",], choices: { count: 0, options: [] } }
        }
    });

add_species("durendim_hagrundun", {
        name: "Hagrundun",
        description: "These Duren have accepted an Oath of Exile from the Mountain Homes, forcing them to leave their subterranean homeland and live upon the surface world. Far from viewing their exile as a punishment, they have developed an intense wanderlust and a fascination with the world beyond the mountains. They eagerly explore unfamiliar lands, seeking new places, peoples, and experiences, though their sheltered upbringing often leaves them unprepared for the dangers of the surface.",
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
                    { name: "Navigation", rank: 1 },
					{ name: "Weapon Skill (Axes)", rank: 3 },
					{ name: "Blacksmithing", rank: 3 },
					{ name: "Maintainence", rank: 1 },
					{ name: "Diplomacy", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

add_species("skireen_icelindish", {
        name: "IceLindish",
        description: "These Skireen hail from the frozen far north, having traveled great distances to Etilas in pursuit of wanderlust and adventure. They are larger and more powerfully built than their Feldlindish cousins, shaped by the harsh environment of their northern homeland. Their love of exploration drives them to seek new lands, experiences, and challenges far from home.",
        stats: {
            cdt: 8,
            attributes: {
                strength: 0,
                dexterity: 2,
                endurance: 2,
                reflexes: 2,
                intelligence: -3,
                perception: 2,
                willpower: -2,
                charm: 0,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Thick Feathers", "Winged"],
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
                
                dexterity: 2,
                endurance: 2,
                reflexes: 2,
                intelligence: -3,
                perception: 2,
                willpower: -2,
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Professional"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Arctic)", rank: 2 },
					{ name: "Navigation", rank: 2 },
					{ name: "Tracking", rank: 2 },
					{ name: "Weapon Skill (Bows)", rank: 1 },
					{ name: "Weapon SKill (Polearms)", rank: 2 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Endurance", "Perception"], choices: { count: 0, options: [] } }
        }
    });

add_species("skireen_feldlindish", {
        name: "Feldlindish",
        description: "These Skireen are smaller than their cousins, but make up for their size with incredible speed and agility. They share the same wanderlust and love of adventure, traveling far from their homeland in search of new experiences. Their most striking feature is their exotic, brightly colored plumage, which sets them apart from the other Skireen.",
        stats: {
            cdt: 6,
            attributes: {
                strength: -6,
                dexterity: 8,
                endurance: -4,
                reflexes: 8,
                intelligence: -2,
                perception: 6,
                willpower: -8,
                charm: 6,
                toughness: -6,
                leadership: -6
            },
            abilities: ["Winged", "Keen Eyes", "Twitch Reflexes", "Agile Flyer"],
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
                    strength: -6,
                dexterity: 8,
                endurance: -4,
                reflexes: 8,
                intelligence: -2,
                perception: 6,
                willpower: -8,
                charm: 6,
                toughness: -6,
                leadership: -6
                }
            },
            knowledge_tables: {
                fixed: ["Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Plains)", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Spot", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Weapon Skill (Bows)", rank: 2 },
                    { name: "Weapon Skill (Polearms)", rank: 1 },
					
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });
	
	    // Goblin and subspecies
add_species("goblin", {
        name: "Goblin",
        description: "These small canine humanoids are prolific, inhabiting nearly every environment and settlement. Standing no more than three feet tall, they lack conventional intelligence but more than compensate with remarkable cunning and resourcefulness. Their ability to improvise and exploit opportunities allows them to thrive almost anywhere.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -4,
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
                    strength: -4,
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
                    { name: "Sneak", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 2 },
					
                ],
                choices: { count: 1, options: ["Survival (X)"] }
            },
			knowledge_talents: { fixed: ["Ambush"], choices: { count: 0, options: [] } }
        }
    });

add_species("waste_goblin", {
        name: "Waste Goblin",
        description: "These Goblins hail from the Ash Wastes of Holdstadt, where harsh conditions have shaped them into exceptionally enduring survivors. Their pallid grey skin and efficient metabolism allow them to survive on little food or water, while their skill at digging provides shelter and hidden routes through the wastes. They are also formidable ambush predators, using the barren terrain and underground passages to conceal themselves before striking unsuspecting prey.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -4,
                dexterity: 2,
                endurance: 3,
                reflexes: 2,
                intelligence: -4,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                leadership: 0
            },
            abilities: ["Overwhelming Swarm", "Natural Camouflage"],
            negatives: ["Skittish", "Hated"],
            traits: ["infravision", "tiny", "fang_and_claw", "Scent", "Burrow"],
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
                    strength: -4,
                dexterity: 2,
                endurance: 3,
                reflexes: 2,
                intelligence: -4,
                perception: 3,
                willpower: -3,
                charm: -2,
                toughness: -2,
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Survival (Waste)", rank: 1 },
					{ name: "Hunting", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 2 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Ambush"], choices: { count: 0, options: [] } }
        }
    });

add_species("forest_goblin", {
        name: "Forest Goblin",
        description: "These Goblins have green skin and brown fur, living among the canopies of dense forests. Agile and adept at moving through the treetops, they use their elevated position to conceal themselves and ambush unsuspecting travelers below. Their mastery of the canopy makes them elusive predators and dangerous inhabitants of the forest.",
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
            abilities: ["Pack Tactics", "Natural Camouflage"],
            negatives: ["Skittish"],
            traits: ["infravision", "tiny", "fang_and_claw", "Scent"],
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
                    strength: -2,
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
                    { name: "Sneak", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 2 },
                    { name: "Climbing", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Ambush"], choices: { count: 0, options: [] } }
        }
    });

add_species("plains_goblin", {
        name: "Plains Goblin",
        description: "These Goblins have light brown skin and fur and are the most renowned of their kind for their use of tools and crafted equipment. They build organized camps protected by palisades and make extensive use of manufactured weapons, demonstrating a level of ingenuity and organization uncommon among other Goblin peoples.",
        stats: {
            cdt: 4,
            attributes: {
                strength: -2,
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
					strength: -2,
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
                    { name: "Sneak", rank: 1 },
                    { name: "Hunting", rank: 1 },
                    { name: "Tracking", rank: 1 },
                    { name: "Weapon Skill (Polearms)", rank: 0 },
                    { name: "Weapon Skill (Bows)", rank: 0 },
                    { name: "Bargain", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Ambush"], choices: { count: 0, options: [] } }
        }
    });

add_species("cave_goblin", {
        name: "Cave Goblin",
        description: "These Goblins are nearly blind, possessing large, white vestigial eyes and pale skin. Despite their poor vision, they are exceptional navigators, relying on other senses to navigate their surroundings. They are also skilled stoneworkers, with a particular talent for shaping and building with stone.",
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
                    { name: "Mining", rank: 1 },
                    { name: "Navigation", rank: 1 },
                    { name: "Artistic Ability (Sculpting)", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 2 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Ambush", "Blind Fighting"], choices: { count: 0, options: [] } }
        }
    });
    // (I can add the other Goblin subspecies if you want them as separate entries)

add_species("orc", {
        name: "Orc",
        description: "These stunted pig folk are universally regarded as a bad omen. Shorter than the average man, they possess remarkable strength and durability, making them surprisingly formidable despite their diminutive stature. Their appearance alone is often enough to inspire unease, and their arrival is rarely seen as a sign of good fortune.",
        stats: {
            cdt: 10,
            attributes: {
                strength: 4,
                dexterity: -2,
                endurance: 4,
                reflexes: 0,
                intelligence: -4,
                perception: -2,
                willpower: 0,
                charm: -4,
                toughness: 2,
                leadership: 0
            },
            abilities: [],
            negatives: ["Filthy Pigs"],
            traits: ["carnivorous", "stout", "tusked","Scent", "Rough Hide"],
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
                dexterity: -2,
                endurance: 4,
                intelligence: -4,
                perception: -2,
                charm: -4,
                toughness: 2,
                }
            },
            knowledge_tables: {
                fixed: ["Warfare", "Laborer"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidation", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 1 },
                    { name: "Cooking", rank: 1 },
                ],
                choices: { count: 3, options: ["Weapon Skill (X)"] }
            },
			knowledge_talents: { fixed: ["Endurance", "Grapple"], choices: { count: 0, options: [] } }
        }
    });

add_species("hobs", {
        name: "Hobs",
        description: "These Hobs are half-breeds born from Orcs and other peoples, often rejected and mistreated by both sides of their heritage. Their difficult upbringing has made them exceptionally tough and resilient, accustomed to hardship and physical abuse from an early age. Though often regarded with contempt, Hobs are survivors who endure punishment that would break others.",
        stats: {
            cdt: 14,
            attributes: {
                strength: 2,
                dexterity: -2,
                endurance: 6,
                reflexes: -2,
                intelligence: -2,
                perception: -2,
                willpower: 4,
                charm: -4,
                toughness: 6,
                leadership: -6
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
                strength: 2,
                dexterity: -2,
                endurance: 6,
                reflexes: -2,
                intelligence: -2,
                perception: -2,
                willpower: 4,
                charm: -4,
                toughness: 6,
                leadership: -6
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Weapon Skill (Shield)", rank: 1 },
                    { name: "Perception", rank: 3 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Turtle", "Endurance"], choices: { count: 0, options: [] } }
        }
    });

add_species("orrol", {
        name: "Orrol",
        description: "These massive hybrids are the offspring of Trolls and Orcs, combining the strongest traits of both. They possess the powerful build and strength of an Orc alongside the immense size and surprising stealth of a Troll. Their formidable physique makes them natural hunters and warriors, capable of moving with an unsettling quietness despite their enormous stature.",
        stats: {
            cdt: 12,
            attributes: {
                strength: 5,
                dexterity: 3,
                endurance: 1,
                reflexes: 1,
                intelligence: -3,
                perception: 2,
                willpower: -4,
                charm: -6,
                toughness: 2,
                leadership: 0
            },
            abilities: ["Black Fur"],
            negatives: ["Oiled Coat", "Monstrous", "Smelly", "Dull"],
            traits: ["large", "infravision", "Scent"],
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
                    strength: 5,
                dexterity: 3,
                endurance: 1,
                reflexes: 1,
                intelligence: -3,
                perception: 2,
                willpower: -4,
                charm: -6,
                toughness: 2,
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Roguery"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Sneak", rank: 1 },
                    { name: "Hide", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Ambush", "Sneak Attack", "Back Stab"], choices: { count: 0, options: [] } }
        }
    });

add_species("gnoll", {
        name: "Gnoll",
        description: "Gnolls are large, bipedal hyena-like beings defined by fierce narcissism and domineering personalities. They are raised within brutal family units where the strongest parent rules through fear and violence, teaching their young that dominance is the foundation of respect and survival. This upbringing produces a people who are fiercely self-centered, aggressive, and constantly driven to establish their superiority over others.",
        stats: {
            cdt: 12,
            attributes: {
                strength: 6,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                intelligence: 0,
                perception: 0,
                willpower: -4,
                charm: -6,
                toughness: 0,
                leadership: 0
            },
            abilities: ["Wicked Laugh"],
            negatives: ["Hated", "Narcissist"],
            traits: ["infravision", "fang_and_claw", "Blood Scent"],
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
                    strength: 6,
                dexterity: 4,
                endurance: -2,
                reflexes: 4,
                willpower: -4,
                charm: -6,
                }
            },
            knowledge_tables: {
                fixed: ["Survival", "Warfare"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidate", rank: 3 },
                    { name: "Weapon Skill (Unarmed)", rank: 3 },
                    { name: "Taunt", rank: 1 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Grapple"], choices: { count: 0, options: [] } }
        }
    });

add_species("nezumi", {
        name: "Nezumi",
        description: "These small, rat-like humanoids hail from the far west and have faced widespread discrimination since arriving in Etilas. Most Nezumi live in poverty, with prejudice and limited opportunities forcing many into lives of crime and survival on the fringes of society.",
        stats: {
            cdt: 6,
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
                    { name: "Sneak", rank: 1 },
                    { name: "Hide", rank: 1 },
                    { name: "Pick Pocket", rank: 1 },
                    { name: "Open Locks", rank: 1 },
                    { name: "Climbing", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Awareness"], choices: { count: 0, options: [] } }
        }
    });

add_species("kobold", {
        name: "Kobold",
        description: "These small draconic reptiles are believed to be the ancestors of Etilas’s great dragons. Cunning and proud, they hold their draconic heritage in high regard despite their diminutive size. They are fiercely protective of their lineage and often consider themselves superior to other small reptilian peoples.",
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
                charm: 0,
                toughness: 0,
                leadership: -4
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
                    strength: -3,
                dexterity: 3,
                reflexes: 3,
                perception: 2,
                willpower: -2,
                leadership: -4
                }
            },
            knowledge_tables: {
                fixed: ["Laborer", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Mining", rank: 1 },
                    { name: "Survival (Underground)", rank: 1 },
                    { name: "Engineering", rank: 1 },
                    { name: "Weapon Skill (Unarmed)", rank: 1 },
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["Close Quarters Fighting"], choices: { count: 0, options: [] } }
        }
    });

add_species("minos", {
        name: "Minos",
        description: "These massive bull-headed humanoids are highly intelligent and possess organized societies thriving off of slavery where the strong rule the weak. Renowned for their incredible strength and durability, they are imposing figures capable of enduring tremendous punishment. Their size and physical power make them formidable warriors and laborers alike.",
        stats: {
            cdt: 14,
            attributes: {
                strength: 8,
                dexterity: -4,
                endurance: 3,
                reflexes: -2,
                intelligence: -2,
                perception: 0,
                willpower: 0,
                charm: -3,
                toughness: 3,
                leadership: 0
            },
            abilities: [],
            negatives: ["Brassen Horde"],
            traits: ["scent", "carnivorous", "gore", "giant"],
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
                    strength: 8,
                dexterity: -4,
                endurance: 3,
                reflexes: -2,
                intelligence: -2,
                charm: -3,
                toughness: 3,
                }
            },
            knowledge_tables: {
                fixed: ["Warfare", "Survival"],
                choices: { count: 0, options: [] }
            },
            knowledge_skills: {
                fixed: [
                    { name: "Intimidation", rank: 4 },
                    { name: "Weapon Skill (Unarmed)", rank: 4 },
                ],
                choices: { count: 1, options: ["Weapon Skill (X)"] }
            },
			knowledge_talents: { fixed: ["Rage", "Push", "Throw"], choices: { count: 1, options: ["Rage (Power)"] } }
        }
    });

add_species("fae_fairy", {
        name: "Fairy",
        description: "Fairies are minute humanoid beings with delicate insect-like wings, standing no more than four inches tall. Despite their harmless appearance, they possess unnatural strength and a wide array of innate powers that make them far more formidable than their size suggests. Their diminutive stature belies the considerable power they naturally command.",
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
            traits: ["Winged", "minute", "true_sight"],
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
                    { name: "Herbalism", rank: 1 },
                    { name: "Brewing", rank: 1 },
                    { name: "Pick Pocket", rank: 2 },
                    { name: "Lore (Druidry)", rank: 2 }
                ],
                choices: { count: 0, options: [] }
            },
			knowledge_talents: { fixed: ["None"], choices: { count: 0, options: [] } }
        }
    });

add_species("felinim", {
        name: "Felinim",
        description: "The Felinim originate from the Western Continent and are renowned swordsmen and avid pirates. Agile and strong but lacking endurance, they favor speed and precision in combat. Their whimsical and unpredictable nature makes them poor leaders, though it also contributes to their adventurous and independent spirit.",
        stats: {
            cdt: 6,
            attributes: {
                strength: 1,
                dexterity: 3,
                endurance: -2,
                reflexes: 3,
                intelligence: 0,
                perception: 2,
                willpower: -3,
                charm: 3,
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
                    strength: 1,
                dexterity: 3,
                endurance: -2,
                reflexes: 3,
                perception: 2,
                willpower: -3,
                charm: 3,
                toughness: -3,
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
                    { name: "Weapon Skill (Short Swords)", rank: 3 },
                    { name: "Tumbling", rank: 0 },
                    { name: "Sailing", rank: 2 },
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