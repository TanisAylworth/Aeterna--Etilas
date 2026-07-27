function knowledge_tables_data()
{
    global.knowledge_table_data = {};
#region General
global.knowledge_table_data[$ "General"] =
    {
        skills :
        [
            "Animal Handling",
			"Dancing",
			"Carousing",
			"Running",
			"Etiquette",
			"Firebuilding w/ Kit",
			"Fire Control",
			"Caching",
			"Navigation",
			"Observation",
			 "Spot",
        "Listen",
			"Rope Use",
			"Singing",
			"Riding (X)",
			"Whistling",
			"First Aid",
			"Local History",
			"Musical Instrument (X)",
			"Swimming",
			"Climbing",
        ],

        talents :
        [
            "Woodsman",
            "Beast Friend"
        ]
    };
	#endregion

#region Professional
	global.knowledge_table_data[$ "Professional"] =
    {
        skills: [
        "Agriculture",
        "Animal Training",
        "Animal Husbandry",
        "Artistic Ability (X)",
        "Appraisal",
        "Bargain",
        "Blacksmithing",
        "Brewing",
        "Carpentry",
        "Cartography",
        "Geology",
        "Leather Working",
        "Pottery",
        "Stone Masonry",
        "Weaving",
        "Engineering",
        "Doctoring",
        "Herbalism",
        "Appraisal",
        "Jewelry",
        "Lock Smith",
        "Armorer",
        "Bowyer/Fletcher",
        "Massage",
        "Cooking",
        "Toxicology",
    ],

        talents :
        [
            "Woodsman",
            "Beast Friend"
        ]
    };
#endregion

#region Warfare
global.knowledge_table_data[$ "Warfare"] =
    {
        skills: [
        "Leadership",
        "Breathing Control",
        "Signaling",
        "Armor Optimization",
        "Charioteering",
        "Dirty Tricks",
        "Massage",
        "Taunting",
        "Weakness Identification",
        "Firearms Use",
        "Maintenance",
        "Tactics",
        "Weapon Skill (X)",
        "Bodyguard",
        "Danger Sense",
			"Intimidation",
    ],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

#region Laborer
	global.knowledge_table_data[$ "Laborer"] =
    {
        skills: [
        "Fire Fighting",
        "Mining",
        "Smelting",
        "Foraging",
        "Hunting",
		"Wagoneering",
        "Sailing",
        "Trapping",
        "Tracking",
        "Fishing",
        "Logging",
        "Harvesting",
        "Sailing"
    ],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

#region Clerical
	global.knowledge_table_data[$ "Clerical"] =
    {
        skills: [
        "Heraldry",
        "Meditation",
        "Mediation",
        "Teaching",
        "Learning",
        "Anatomy",
        "Ancient History",
        "Botany",
        "Bureaucracy",
        "Healing",
        "Lore (X)",
		"Law",
        "Religion",
        "Verbal Concealment",
        "Necrology",
        "Numerology",
		],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

#region Roguery
	global.knowledge_table_data[$ "Roguery"] =
    {
        skills: [
        "Hide",
        "Breathing Control",
        "Pick Pocket",
        "Intuition",
        "Signaling",
        "Danger Sense",
        "Appraisal",
            "Bribery",
        "Prestidigitation",
        "Begging",
        "Camouflage",
        "Disguise",
        "Fast Talking",
        "Forgery",
        "Juggling",
        "Open Lock",
        "Lip Reading",
        "Tumbling",
        "Venom Handling",
        "Ventriloquism",
        "Voice Mimicry",
        "Dirty Tricks",
        "Gaming",
        "Weakness Identification",
        "Sneak",
        "Decipher",
        "Disable",
        "Streetwise",
        "Escape Artist",
        "Deception",
    ],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

#region Social
	global.knowledge_table_data[$ "Social"] =
    {
        skills: [
        "Debate",
        "Diplomacy",
			"Persuasion",
			"Intimidation",
            "Bribery",
            "Seduction",
            "Command",
            "Empathy",
            "Oration",
            "Interrogation",
			"Crowd Working",
        "Begging",
		],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

#region Occult
	global.knowledge_table_data[$ "Occult"] =
    {
        skills :
        [
            "Spellcraft",
            "Runes",
            "Alchemy"
        ],

        talents :
        [
            "Mystic Insight"
        ]
    };
#endregion

#region Survival
    global.knowledge_table_data[$ "Survival"] =
    {
        skills: [
        "Water Find (X)",
        "Weather Sense",
        "Trapping",
        "Streetwise",
        "Survival (X)",
        "Lore (Animal)",
        "Lore (Monster)",
        "Lore (Plant)",
        "Mountaineering",
        "Spelunking",
        "Danger Sense",
		"Firebuilding",
		"Primitive Crafts",
		"Hunting",
		"Foraging",
        "Herbalism",
		"Distance Sense",
		"Weapon Skill (X)",
    ],

        talents :
        [
            "Woodsman",
            "Beast Friend"
        ]
    };
#endregion

#region Arcane
    global.knowledge_table_data[$ "Arcane"] =
    {
        skills: [
        "Occult (X)",
        "Ancient History",
        "Astrology",
        "Arcane Channeling",
        "Spellcraft",
        "Alchemy",
        "Numerology",
        "Lore (X)",
        "Runecraft",
        "Emergency Discharge"
		],

        talents :
        [
            "Mystic Insight"
        ]
    };
	#endregion

}