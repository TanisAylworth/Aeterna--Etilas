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
			"Firebuilding w/ Kit",
			"Fire Control",
			"Caching",
			"Navigation",
			"Balance",
			"Observation",
			"Spot",
			"Listen",
			"Jumping",
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
            "Alertness",
			"Durable",
			"Fitness",
			"Armor Training (Light)",
			"Armor Focus",
			"Strong Back",
			"Light Sleeper",
			"Sure-Footed",
			"Animal Affinity",
			"Language (X)",
			"Polyglot",
			"Iron Stomach",
			"Fleet-Footed"  
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
        "Blacksmithing",
        "Brewing",
        "Carpentry",
        "Cartography",
        "Geology",
        "Shipwright",
        "Leather Working",
        "Tailoring",
        "Pottery",
        "Stone Masonry",
        "Weaving",
        "Engineering",
        "Doctoring",
        "Jewelry",
        "Lock Smith",
        "Bowyer/Fletcher",
        "Massage",
        "Cooking",
        "Toxicology",
    ],

        talents :
        [
            "Musical Lore (X)", 
			"Musical Talent (X)", 
			"Steady Hands",
			"Good Eye",
			"Quality Control",
			"Hard Bargain",
        ]
    };
#endregion

#region Warfare
global.knowledge_table_data[$ "Warfare"] =
    {
        skills: [
        "Leadership",
        "Signaling",
        "Armor Optimization",
        "Charioteering",
        "Taunting",
        "Weakness Identification",
        "Firearms Use",
        "Maintenance",
        "Tactics",
        "Seige Craft",
        "Drilling",
        "Weapon Skill (X)",
        "Bodyguard",
    ],

        talents :
        [
            "Blind Fighting", 
			"Close-Quarters Fighting", 
			"Display Weapon Prowess",
			"Natural Fighting", 
			"Wild Fighting", 
			"Weapon Style (X)", 
			"Turtle", 
			"Rage",
		    "Weapon Improvisation", 
			"Martial Training", 
			"Multi-Attack", 
			"Weapon Mastery (X)",
		    "Two Weapon Fighting", 
		    "All In",
			"Martial Action (X)",
		    "Ambush", 
			"Two Weapon Defense", 
			"Checking", 
			"Dextrous Defense",
		    "Armor Training (Medium)", 
			"Armor Training (Heavy)", 
			"Marksmanship",
			"Suppression",
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
		"Wagoneering",
        "Sailing",
        "Tracking",
        "Fishing",
        "Logging",
        "Harvesting",
        "Foreman",
    ],

        talents :
        [
			
        "Weathered",
        "Laborious Endurance",
        "Hauler",
        "Iron Lungs",
        "Second Wind",
        "Calloused",
        "Jury Rig",
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
            "Read and Write (X)", 
			"Record Keeper", 
			"Photographic Memory", 
			"Efficient Organizer",
			"Numerate", 
			"Merchant Ledger", 
			"Auditor", 
			"Cultural Scribe"
        ]
    };
	#endregion

#region Roguery
	global.knowledge_table_data[$ "Roguery"] =
    {
        skills: [
        "Hide",
        "Sleight of Hand",
        "Intuition",
        "Prestidigitation",
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
        "Sneak",
        "Decipher",
        "Disable",
        "Streetwise",
        "Escape Artist",
		"Weapon Skill (Small Blades)",
		"Weapon Skill (Small Blunt)",
		"Weapon Skill (Bows)",
		"Weapon Skill (Blunt)",
    ],

        talents :
        [
            "Street Fighting", 
			"Canting",
			"Backstab", 
			"Sneak Attack", 
			"Awareness", 
			"Quick Poisoner",
			"Quick Hands",
			"Acrobat",
			"Many Faces",
			"Con Artist",
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
			"Bargain",
            "Oration",
			"Etiquette",
			"Deception",
            "Interrogation",
			"Crowd Working",
        "Begging",
		],

        talents :
        [
            
			"Silver Tongue",
			"Negotiator",
			"Inspiring Orator",
			"Natural Leader",
			"Interrogator",
			"Charismatic",
        ]
    };
	#endregion

#region Occult
	global.knowledge_table_data[$ "Occult"] =
    {
        skills :
        [
            
			
            "Alchemy",
			"Occult (Necromancy)",
			"Occult (Daemonology)",
			"Occult (Shamanism)",
			"Occult (Vampirism)",
			"Occult (Wild Crier)",
			"Lore (Occult)",
			"Component Preparation",
			"Rituals",
			
        ],

        talents :
        [
		
			"Vampiric Mastery",
			"Vampiric Power (X)",
			"Daemonic Mastery",
			"Daemonic Power (X)",
			"Crier Mastery",
			"Crier Power (X)",
			"Necromantic Mastery",
			"Necromantic Power (X)",
			"Shamanic Mastery",
			"Shamanic Power (X)",
			"Careful Preparation",
			"Ritual Master",
            
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
        "Camouflage",
        "Survival (X)",
        "Lore (Animal)",
        "Lore (Monster)",
        "Lore (Plant)",
        "Breathing Control",
        "Mountaineering",
        "Spelunking",
        "Danger Sense",
		"Firebuilding",
		"Primitive Crafts",
		"Hunting",
		"Foraging",
        "Herbalism",
		"Weapon Skill (Small Blades)",
		"Weapon Skill (Polearms)",
		"Weapon Skill (Bows)",
		"Weapon Skill (Hand Axes)",
		
    ],

        talents :
        [
            "Forager", 
			"Trailblazer", 
			"Shelter", 
		    "Hunter's Patience", 
			"Fire Starter", 
			"Improvised",
        ]
    };
#endregion

#region Arcane
    global.knowledge_table_data[$ "Arcane"] =
    {
        skills: [
        "Astrology",
        "Arcane Channeling",
        "Spellcraft",
        "Lore (Arcane)",
        "Emergency Discharge"
		],

        talents :
        [
            "Spell Weaving", 
			"Sub Aspect Mastery (X)", 
			"Arcane Conduit", 
			"Arcane Dispersal",
			"Efficient Channeler", 
			"Spell Shaping", 
			"Overcharge", 
			"Mental Codex", 
			"Arcane Reservoir"
        ]
    };
	#endregion

}