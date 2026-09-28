function knowledge_tables_data()
{
    global.knowledge_table_data = {};
#region General
global.knowledge_table_data[$ "General"] =
    {
        skills :
        [
            "Animal Handling",
			"Balance",
			"Caching",
			"Carousing",
			"Climbing",
			"Dancing",
			"Fire Control",
			"Firebuilding w/ Kit",
			"First Aid",
			"Jumping",
			"Listen",
			"Local History",
			"Musical Instrument (X)",
			"Navigation",
			"Observation",
			"Riding (X)",
			"Rope Use",
			"Running",
			"Singing",
			"Spot",
			"Swimming",
			"Whistling",
        ],

        talents :
        [
            "Alertness",
			"Animal Affinity",
			"Armor Focus",
			"Armor Training (Light)",
			"Durable",
			"Fitness",
			"Fleet-Footed",
			"Iron Stomach",
			"Language (X)",
			"Light Sleeper",
			"Polyglot",
			"Strong Back",
			"Sure-Footed"
        ]
    };
	#endregion

#region Professional
	global.knowledge_table_data[$ "Professional"] =
    {
        skills: [
        "Agriculture",
        "Animal Husbandry",
        "Animal Training",
        "Appraisal",
        "Artistic Ability (X)",
        "Blacksmithing",
        "Bowyer/Fletcher",
        "Brewing",
        "Carpentry",
        "Cartography",
        "Cooking",
        "Doctoring",
        "Engineering",
        "Geology",
        "Jewelry",
        "Leather Working",
        "Lock Smith",
        "Massage",
        "Pottery",
        "Shipwright",
        "Stone Masonry",
        "Tailoring",
        "Toxicology",
        "Weaving",
    ],

        talents :
        [
            "Good Eye",
			"Hard Bargain",
			"Musical Lore (X)",
			"Musical Talent (X)",
			"Quality Control",
			"Steady Hands",
        ]
    };
#endregion

#region Warfare
global.knowledge_table_data[$ "Warfare"] =
    {
        skills: [
        "Armor Optimization",
        "Bodyguard",
        "Charioteering",
        "Drilling",
        "Firearms Use",
        "Leadership",
        "Maintenance",
        "Seige Craft",
        "Signaling",
        "Tactics",
        "Taunting",
        "Weakness Identification",
        "Weapon Skill (X)",
    ],

        talents :
        [
            "All In",
			"Ambush",
			"Armor Training (Heavy)",
			"Armor Training (Medium)",
			"Blind Fighting",
			"Checking",
			"Close-Quarters Fighting",
			"Dextrous Defense",
			"Display Weapon Prowess",
			"Fighting Style (X)",
			"Martial Action (X)",
			"Martial Training",
			"Marksmanship",
			"Multi-Attack",
			"Natural Fighting",
			"Rage",
			"Suppression",
			"Two Weapon Defense",
			"Two Weapon Fighting",
			"Turtle",
			"Weapon Improvisation",
			"Weapon Mastery (X)",
			"Wild Fighting",
        ]
    };
	#endregion

#region Laborer
	global.knowledge_table_data[$ "Laborer"] =
    {
        skills: [
        "Fire Fighting",
        "Fishing",
        "Foreman",
        "Harvesting",
        "Logging",
        "Mining",
        "Sailing",
        "Smelting",
        "Tracking",
		"Wagoneering",
    ],

        talents :
        [
        "Calloused",
        "Hauler",
        "Iron Lungs",
        "Jury Rig",
        "Laborious Endurance",
        "Second Wind",
        "Weathered",
        ]
    };
	#endregion

#region Clerical
	global.knowledge_table_data[$ "Clerical"] =
    {
        skills: [
        "Anatomy",
        "Ancient History",
        "Botany",
        "Bureaucracy",
        "Healing",
        "Heraldry",
        "Law",
        "Learning",
        "Lore (X)",
        "Mediation",
        "Meditation",
        "Necrology",
        "Numerology",
        "Religion",
        "Teaching",
        "Verbal Concealment",
    ],

        talents :
        [
            "Auditor",
			"Cultural Scribe",
			"Efficient Organizer",
			"Merchant Ledger",
			"Numerate",
			"Photographic Memory",
			"Read and Write (X)",
			"Record Keeper"
        ]
    };
	#endregion

#region Roguery
	global.knowledge_table_data[$ "Roguery"] =
    {
        skills: [
        "Decipher",
        "Disable",
        "Disguise",
        "Dirty Tricks",
        "Escape Artist",
        "Fast Talking",
        "Forgery",
        "Gaming",
        "Hide",
        "Intuition",
        "Juggling",
        "Lip Reading",
        "Open Lock",
        "Prestidigitation",
        "Rogue Weapon (X)",
        "Sleight of Hand",
        "Sneak",
        "Streetwise",
        "Tumbling",
        "Venom Handling",
        "Ventriloquism",
        "Voice Mimicry",
    ],

        talents :
        [
            "Acrobat",
			"Awareness",
			"Backstab",
			"Canting",
			"Con Artist",
			"Many Faces",
			"Quick Hands",
			"Quick Poisoner",
			"Sneak Attack",
			"Street Fighting",
        ]
    };
	#endregion

#region Social
	global.knowledge_table_data[$ "Social"] =
    {
        skills: [
        "Bargain",
        "Begging",
        "Bribery",
        "Command",
        "Crowd Working",
        "Debate",
        "Deception",
        "Diplomacy",
        "Empathy",
        "Etiquette",
        "Intimidation",
        "Interrogation",
        "Oration",
        "Persuasion",
        "Seduction",
    ],

        talents :
        [
            "Charismatic",
			"Inspiring Orator",
			"Interrogator",
			"Natural Leader",
			"Negotiator",
			"Silver Tongue",
        ]
    };
	#endregion

#region Occult
	global.knowledge_table_data[$ "Occult"] =
    {
        skills :
        [
            "Alchemy",
			"Component Preparation",
			"Lore (Occult)",
			"Occult (Daemonology)",
			"Occult (Necromancy)",
			"Occult (Shamanism)",
			"Occult (Vampirism)",
			"Occult (Wild Crier)",
			"Rituals",
        ],

        talents :
        [
			"Careful Preparation",
			"Crier Mastery",
			"Crier Power (X)",
			"Daemonic Mastery",
			"Daemonic Power (X)",
			"Necromantic Mastery",
			"Necromantic Power (X)",
			"Ritual Master",
			"Shamanic Mastery",
			"Shamanic Power (X)",
			"Vampiric Mastery",
			"Vampiric Power (X)",
        ]
    };
#endregion

#region Survival
    global.knowledge_table_data[$ "Survival"] =
    {
        skills: [
        "Breathing Control",
        "Camouflage",
        "Danger Sense",
        "Firebuilding",
        "Foraging",
        "Herbalism",
        "Hunting",
        "Lore (Animal)",
        "Lore (Monster)",
        "Lore (Plant)",
        "Mountaineering",
        "Primitive Crafts",
        "Spelunking",
        "Survival (X)",
        "Survival Weapon (X)",
        "Trapping",
        "Water Find (X)",
        "Weather Sense",
    ],

        talents :
        [
            "Fire Starter",
			"Forager",
			"Hunter's Patience",
			"Improvised",
			"Shelter",
			"Trailblazer",
        ]
    };
#endregion

#region Arcane
    global.knowledge_table_data[$ "Arcane"] =
    {
        skills: [
        "Arcane Channeling",
        "Astrology",
        "Emergency Discharge",
        "Lore (Arcane)",
        "Spellcraft",
    ],

        talents :
        [
            "Arcane Conduit",
			"Arcane Dispersal",
			"Arcane Reservoir",
			"Efficient Channeler",
			"Mental Codex",
			"Overcharge",
			"Spell Shaping",
			"Spell Weaving",
			"Sub Aspect Mastery (X)",
        ]
    };
	#endregion

}