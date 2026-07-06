function skills_data(){
global.skill_data = {};




#region General
// =====================================================
// GENERAL TABLE
// =====================================================

global.skill_data[$ "Animal Handling"] = {
    name: "Animal Handling",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for the care and maintenance of animals. Penalties to the roll are based on the creature's RA to the caretaker, and the animal's unruliness. Used in calming or handling an otherwise unruly creature."
};



global.skill_data[$ "Running"] = {
    name: "Running",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -6 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for maintaining top speed for an extended period of time."
};





global.skill_data[$ "Dancing"] = {
    name: "Dancing",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for the artful display of dancing. Penalties are based on dancing conditions such as surface and lighting."
};



global.skill_data[$ "Carousing"] = {
    name: "Carousing",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: 0 },
            { attribute: "Charm", modifier: -1 }   // optional social flair
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for competitive drinking, feasting, and participating in revelry. Useful for holding your liquor, winning drinking contests, and socializing in taverns and festivals."
};

global.skill_data[$ "Etiquette"] = {
    name: "Etiquette",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for providing appropriate cultural actions during interactions to show respect."
};

global.skill_data[$ "Firebuilding w/ Kit"] = {
    name: "Firebuilding w/ Kit",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 },
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for starting fires assuming you have a tinder box or firebuilding kit."
};

global.skill_data[$ "Fire Control"] = {
    name: "Fire Control",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for maximizing or minimizing damage caused by a raging flame."
};

global.skill_data[$ "Caching"] = {
    name: "Caching",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for hiding something for safe keeping. Unlike Hide, caching is long term. Specifically refers to items. Also required for relocating the object at a later date."
};

global.skill_data[$ "Navigation"] = {
    name: "Navigation",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for finding one’s location and determining the correct direction to follow to reach a destination."
};

global.skill_data[$ "Observation"] = {
    name: "Observation",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using Intelligence to deduce information from a scene. A method used in detecting out of place small details be it scratches on the floor or a person of interest in a crowd."
};



global.skill_data[$ "Rope Use"] = {
    name: "Rope Use",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for the proper application of rope for various purposes."
};

global.skill_data[$ "Singing"] = {
    name: "Singing",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for performing vocally. Can be used for Bardic Performances."
};

global.skill_data[$ "Riding (X)"] = {
    name: "Riding",
    table: "General",
    specialization: {
        required: true,
        choices: ["Horses", "Camels", "Dogs", "Boars", "Goats", "Swamp Crocs"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for riding various mounts."
};

global.skill_data[$ "Whistling"] = {
    name: "Whistling",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for producing tones using one’s lips. Can be used for Bardic Performances."
};

global.skill_data[$ "First Aid"] = {
    name: "First Aid",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 },
            { attribute: "Intelligence", modifier: 2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for the rendering of immediate medical attention. Can staunch bleeding, and prolong the onset of death but does not stabilize. Provides a bonus to death saves equal to degrees of success."
};

global.skill_data[$ "Local History"] = {
    name: "Local History",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 },
            { attribute: "Charm", modifier: 1 },
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for gleaning or recalling recent events from eavesdropping or important contextual clues as to why something is important."
};

global.skill_data[$ "Musical Instrument (X)"] = {
    name: "Musical Instrument",
    table: "General",
    specialization: {
        required: true,
        choices: ["Lute", "Flute", "Lyre", "Drum", "Pan Flute", "Triangle"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for playing musical instruments. Can be used for Bardic Performances."
};



global.skill_data[$ "Swimming"] = {
    name: "Swimming",
    table: "General",
    check: {
        mode: "size",
        size_attributes: {
            tiny:   { attribute: "Dexterity", modifier: 0 },
            small:  { attribute: "Dexterity", modifier: 0 },
            medium: { attribute: "Strength",  modifier: 0 },
            large:  { attribute: "Strength",  modifier: 0 },
            huge:   { attribute: "Strength",  modifier: 0 }
        }
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill at maintaining positive buoyancy in the water. Success means you float. Failure means you sink and begin drowning. Endurance tests are made as if the creature is being suffocated. You receive a penalty to the swim check equal to the weight penalty of your gear."
};

global.skill_data[$ "Climbing"] = {
    name: "Climbing",
    table: "General",
    check: {
        mode: "size",
        size_attributes: {
            tiny:   { attribute: "Dexterity", modifier: 0 },
            small:  { attribute: "Dexterity", modifier: 0 },
            medium: { attribute: "Strength",  modifier: 0 },
            large:  { attribute: "Strength",  modifier: 0 },
            huge:   { attribute: "Strength",  modifier: 0 }
        }
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for scaling terrain. This cannot be performed on sheer surfaces like walls."
};




#endregion

#region Professional

// =====================================================
// PROFESSIONAL TABLE - Additional Skills
// =====================================================

global.skill_data[$ "Agriculture"] = {
    name: "Agriculture",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Knowledge of the cultivation of plants, and processes to assist in their crop yield and cures for common plant based ailments."
};


global.skill_data[$ "Animal Training"] = {
    name: "Animal Training",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the training of animals to respond to key words to perform certain actions. This functions as the Teaching skill but for non-intelligent creatures."
};

global.skill_data[$ "Husbandry"] = {
    name: "Husbandry",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -3 },
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for breeding animals of all kinds."
};

global.skill_data[$ "Artistic Ability (X)"] = {
    name: "Artistic Ability",
    table: "Professional",
    specialization: {
        required: true,
        choices: ["Painting", "Sculpting", "Carving"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the production of art through various mediums."
};

global.skill_data[$ "Bargain"] = {
    name: "Bargain",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using one’s influence to reduce costs or increase profits. The check is modified by the Reaction Adjustment of the party. Success grants a favorable +1% per Degree of Success."
};

global.skill_data[$ "Blacksmithing"] = {
    name: "Blacksmithing",
    table: "Professional",
    check: {
        mode: "all",
        attributes: [
            { attribute: "Strength", modifier: -2 },
            { attribute: "Intelligence", modifier: -2 },
            { attribute: "Endurance", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing how to and being able to smith objects from metal. This is not weapon or armor smithing but making mundane objects. All attributes are tested. The total DoS or DoF will yield the crafted item's quality."
};

global.skill_data[$ "Xiba Ball"] = {
    name: "Xiba Ball",
    table: "Professional",
    check: {
        mode: "all",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
            { attribute: "Reflexes", modifier: -2 },
            { attribute: "Endurance", modifier: -4 },
            { attribute: "Perception", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for playing the game Xiba Ball. A cultural favorite of the Xiba involving kicking a leather ball through a ring suspended in the center of a ring. Each attribute is tested separately and the totaled degrees of success or failure are compared to the opponent."
};

global.skill_data[$ "Leather Working"] = {
    name: "Leather Working",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the preparation and use of leather."
};

global.skill_data[$ "Pottery"] = {
    name: "Pottery",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for crafting with clay and mud."
};

global.skill_data[$ "Herbalism"] = {
    name: "Herbalism",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the identification and collection of plants. Can be used to gather medical herbs or toxic plants or ones fit for eating. Using herbal poultice increases natural healing factor by 1. More advanced remedies can provide higher bonuses."
};

global.skill_data[$ "Appraisal"] = {
    name: "Appraisal",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for identifying the value of an item."
};

global.skill_data[$ "Gem Cutting"] = {
    name: "Gem Cutting",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the shaping and setting of gems."
};

global.skill_data[$ "Grooming"] = {
    name: "Grooming",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for the cutting and styling of hair."
};

global.skill_data[$ "Cartography"] = {
    name: "Cartography",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "Intermediate for the generation of simple small-scale maps. Advanced for the generation of highly detailed large-scale maps."
};

global.skill_data[$ "Gold Casting"] = {
    name: "Gold Casting",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for working with and coating or casting objects in gold."
};

global.skill_data[$ "Lock Smith"] = {
    name: "Lock Smith",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the creation of locking mechanisms. Gives advantage on open lock tests and can be used to set the DC of an open locks test."
};
global.skill_data[$ "Weaponsmithing"] = {
    name: "Weaponsmithing",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: 0 },
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing how to shape and craft weapons. Every 5 degrees of success grants 1 quality that you can apply to a weapon made this way. Each ranking quality such as masterwork requires the previous."
};

global.skill_data[$ "Shipwright"] = {
    name: "Shipwright",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for repairing significant damage to and creating seaworthy vessels."
};

global.skill_data[$ "Brewing"] = {
    name: "Brewing",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,   // Advanced for alcohol
    description: "Intermediate for the brewing of coffee and Tea but Advanced for Alcohol."
};

global.skill_data[$ "Carpentry"] = {
    name: "Carpentry",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for the using of tools to shape wood or construct buildings or other goods."
};

global.skill_data[$ "Cheesemaking"] = {
    name: "Cheesemaking",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the knowledge of the creation of cheese."
};

global.skill_data[$ "Cobbling"] = {
    name: "Cobbling",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "Intermediate for minor repairs. Advanced for the creation of whole new shoes."
};


global.skill_data[$ "Geology"] = {
    name: "Geology",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for prospecting and identifying valuable gems and stones or ore."
};


global.skill_data[$ "Stone Masonry"] = {
    name: "Stone Masonry",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for the cutting and shaping of stone."
};

global.skill_data[$ "Weaving"] = {
    name: "Weaving",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for weaving various natural materials into a product."
};

global.skill_data[$ "Engineering"] = {
    name: "Engineering",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the sciences of physics and mechanical function. Can be used to create contraptions to perform specific tasks or identify issues in like objects."
};

global.skill_data[$ "Doctoring"] = {
    name: "Doctoring",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for providing intensive medical care including surgeries and life saving procedures. Can cure critical injuries."
};

// =====================================================
// PROFESSIONAL TABLE - Final Batch
// =====================================================


global.skill_data[$ "Armorer"] = {
    name: "Armorer",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for maintaining and repairing armor."
};

global.skill_data[$ "Bowyer/Fletcher"] = {
    name: "Bowyer/Fletcher",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for making Bows and fletching arrows."
};

global.skill_data[$ "Massage"] = {
    name: "Massage",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for relaxing tight muscles and easing pain. Can be used to deaden the effects of light wounds on an affected limb."
};



global.skill_data[$ "Cooking"] = {
    name: "Cooking",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for cooking food."
};

global.skill_data[$ "Toxicology"] = {
    name: "Toxicology",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for identifying and handling toxic plants."
};


#endregion

#region Laborer
// =====================================================
// LABORER TABLE
// =====================================================

global.skill_data[$ "Fire Fighting"] = {
    name: "Fire Fighting",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for the extinguishing of raging deadly fires and how to navigate them safely."
};

global.skill_data[$ "Wagoneering"] = {
    name: "Wagoneering",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill that tests the ability to maneuver wagons under stress."
};
global.skill_data[$ "Sailing"] = {
    name: "Sailing",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for one’s ability to handle tasks aboard a ship. Setting rigging, climbing masts, and rowing are all difficult tasks for the uninitiated. Penalties are based on sailing conditions and time frame."
};
global.skill_data[$ "Mining"] = {
    name: "Mining",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: -3 },
            { attribute: "Endurance", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for digging tunnels and extracting stone and ore."
};

global.skill_data[$ "Smelting"] = {
    name: "Smelting",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the proper methodology of turning ore to usable material."
};

global.skill_data[$ "Begging"] = {
    name: "Begging",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for showing one’s harmless nature or panhandling skill."
};

global.skill_data[$ "Foraging"] = {
    name: "Foraging",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for gathering various potentially edible/useful plants."
};

global.skill_data[$ "Hunting"] = {
    name: "Hunting",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for the stalking or ambush of prey."
};

global.skill_data[$ "Trapping"] = {
    name: "Trapping",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for laying traps."
};

global.skill_data[$ "Tracking"] = {
    name: "Tracking",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill to find and follow evidence that something has been here."
};

global.skill_data[$ "Fishing"] = {
    name: "Fishing",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Reflexes", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for finding and catching fish."
};

global.skill_data[$ "Logging"] = {
    name: "Logging",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for felling trees in a safe and orderly manner."
};

global.skill_data[$ "Harvesting"] = {
    name: "Harvesting",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for reaping fields and gathering crops."
};
#endregion

#region Warfare
// =====================================================
// WARFARE TABLE
// =====================================================

global.skill_data[$ "Leadership"] = {
    name: "Leadership",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Leadership", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the control, organization, and direction of groups of followers. Each degree of success increases morale bonuses by 1. Every degree of failure reduces morale by 1."
};
global.skill_data[$ "Intimidation"] = {
    name: "Intimidation",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: 2 },
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for influencing someone through physical presence."
};
global.skill_data[$ "Breathing Control"] = {
    name: "Breathing Control",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -5 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for controlling your breathing in stressful situations limiting your consumption."
};

global.skill_data[$ "Signaling"] = {
    name: "Signaling",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Leadership", modifier: -1 },
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using vocal or tonal signals to inform others of specific information."
};

global.skill_data[$ "Armor Optimization"] = {
    name: "Armor Optimization",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for moving your armor into a strike that would hit an exposed area. Make a test vs degree of success of the strike to intercept with a worn chosen armor piece instead of using the average DR."
};

global.skill_data[$ "Charioteering"] = {
    name: "Charioteering",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for maneuvering chariots."
};

global.skill_data[$ "Dirty Tricks"] = {
    name: "Dirty Tricks",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for noticing a situation that could give you the advantage in a fight. Could be loose ground, tripping hazards, dangerous objects, etc."
};

global.skill_data[$ "Massage"] = {
    name: "Massage",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for relaxing tight muscles and easing pain. Can be used to deaden the effects of light wounds on an affected limb."
};


global.skill_data[$ "Taunting"] = {
    name: "Taunting",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill to influence hostiles to attack you instead of an ally."
};

global.skill_data[$ "Tracking"] = {
    name: "Tracking",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill to find and follow evidence that something has been here."
};

global.skill_data[$ "Weakness Identification"] = {
    name: "Weakness Identification",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for spotting chinks in armor. You gain +1 AP per DoS on your next attack if you succeed or you can give an ally the benefit for 1 attack. This is a normal action."
};

global.skill_data[$ "Firearms Use"] = {
    name: "Firearms Use",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Skill for firing firearms. See NRPG Guns for rules."
};

global.skill_data[$ "Maintenance"] = {
    name: "Maintenance",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for repairing minor weapon or armor damage."
};

global.skill_data[$ "Tactics"] = {
    name: "Tactics",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "During pitched battle the leaders of both forces make this contested check. The higher degree of success allows the leader to initiate a battle strategy based on the phase of battle that they are in."
};

global.skill_data[$ "Weapon Skill (X)"] = {
    name: "Weapon Skill",
    table: "Warfare",
    specialization: {
        required: true,
        choices: ["Knives", "Daggers", "Swords", "Axes", "Clubs", "Polearms"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for tracking prowess with a weapon type. The primary combat skill."
};

global.skill_data[$ "Bodyguard"] = {
    name: "Bodyguard",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Reflexes", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for intercepting an attack for an ally. You make a check that must exceed the DoS of the attacker against the target of their attack. If you are within range to perform a parry you may do so. If not but you are within half of your move speed you may opt to forgo any other defensive action to take the hit on their behalf."
};

global.skill_data[$ "Danger Sense"] = {
    name: "Danger Sense",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill that gives an impending sense of danger upon success if such a threat is present. Can disclose the actual danger of a perceived threat in terms of difficulty. Penalties are based on the creature’s deception or stealth."
};
#endregion


#region Clerical
	// =====================================================
// CLERICAL TABLE
// =====================================================

global.skill_data[$ "Heraldry"] = {
    name: "Heraldry",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for identifying empirical colors and banners."
};

global.skill_data[$ "Meditation"] = {
    name: "Meditation",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for calming the mind and readying the nerves. Success removes 1 level of fatigue or fear."
};

global.skill_data[$ "Mediation"] = {
    name: "Mediation",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for acting as an impartial party between two groups."
};

global.skill_data[$ "Occult"] = {
    name: "Occult",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill covering the knowledge of other worldly beings and their habits and methods of contact."
};

global.skill_data[$ "Teaching"] = {
    name: "Teaching",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 },
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for instructing students in a skill you have knowledge of. Each degree of success adds an additional 10xp to the student’s learning roll and can cover their deficits. If the roll is failed, subtract 10xp from the student’s learning xp. This total can go negative."
};

global.skill_data[$ "Learning"] = {
    name: "Learning",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for aiding in the acquisition of knowledge. Each degree of success on a learning test for a new skill acquires an additional 10xp. Each degree of failure reduces the experience penalty for failure by 5xp."
};

global.skill_data[$ "Anatomy"] = {
    name: "Anatomy",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the physiology of a living being."
};

global.skill_data[$ "Ancient History"] = {
    name: "Ancient History",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing late history or events of a given location or famous figure."
};

global.skill_data[$ "Botany"] = {
    name: "Botany",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for the cultivation of herbs and roots used in medicine and herbal remedy."
};

global.skill_data[$ "Bureaucracy"] = {
    name: "Bureaucracy",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for organizing or understanding the organization of large business or legal structures."
};

global.skill_data[$ "Healing"] = {
    name: "Healing",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for knowing proper care for patients. Can determine cause of death, stabilize, and assist in natural healing by degrees of success."
};

global.skill_data[$ "Lore (X)"] = {
    name: "Lore",
    table: "Clerical",
    specialization: {
        required: true,
        choices: [] // Add specific lore topics as needed
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowledge covering a specific topic."
};

global.skill_data[$ "Religion"] = {
    name: "Religion",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for recognizing religious practices and symbolism, also the primary skill for interaction with the divines."
};

global.skill_data[$ "Verbal Concealment"] = {
    name: "Verbal Concealment",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for hiding speech allowing casters to say incantations without need of verbal elements."
};

global.skill_data[$ "Appraisal"] = {
    name: "Appraisal",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for identifying the value of an item."
};

global.skill_data[$ "Necrology"] = {
    name: "Necrology",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill showing knowledge of the states of death in a creature. Can ID cause of death and time of death. Is used in some degree with necromancy."
};

global.skill_data[$ "Numerology"] = {
    name: "Numerology",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill showing one’s knowledge of mathematics and numbers."
};


#endregion

#region Roguery
// =====================================================
// ROGUERY TABLE
// =====================================================

global.skill_data[$ "Hide"] = {
    name: "Hide",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for discreetly hiding oneself from view."
};


global.skill_data[$ "Prestidigitation"] = {
    name: "Prestidigitation",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for performing parlor tricks considered “magic” tricks."
};
global.skill_data[$ "Bribery"] = {
    name: "Bribery",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 },
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for offering bribes to sway the decision making process of a group or individuals. Note this is not a catch all. Penalties are based on RA of the target."
};
global.skill_data[$ "Breathing Control"] = {
    name: "Breathing Control",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -5 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for controlling your breathing in stressful situations limiting your consumption."
};

global.skill_data[$ "Pick Pocket"] = {
    name: "Pick Pocket",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for taking light objects off of a person's body without them immediately noticing."
};

global.skill_data[$ "Intuition"] = {
    name: "Intuition",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for discerning social cues as well as drawing meaning from texts one cannot read or simply guessing how something should work."
};

global.skill_data[$ "Listen"] = {
    name: "Listen",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using special techniques to hear sounds or discern speech through walls or over long distances."
};

global.skill_data[$ "Signaling"] = {
    name: "Signaling",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Leadership", modifier: -1 },
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using vocal or tonal signals to inform others of specific information."
};

global.skill_data[$ "Danger Sense"] = {
    name: "Danger Sense",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill that gives an impending sense of danger upon success if such a threat is present. Can disclose the actual danger of a perceived threat in terms of difficulty. Penalties are based on the creature’s deception or stealth."
};

global.skill_data[$ "Appraisal"] = {
    name: "Appraisal",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for identifying the value of an item."
};

global.skill_data[$ "Investigation"] = {
    name: "Investigation",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for identifying patterns and reading reports."
};

global.skill_data[$ "Begging"] = {
    name: "Begging",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for showing one’s harmless nature or panhandling skill."
};

global.skill_data[$ "Camouflage"] = {
    name: "Camouflage",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for increasing your basic perceptibility score. For each degree of success add 1 to your racial passive stealth and add 1 to hide checks."
};

global.skill_data[$ "Disguise"] = {
    name: "Disguise",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for hiding your true appearance by changing one’s look with extra clothing or cosmetics."
};

global.skill_data[$ "Fast Talking"] = {
    name: "Fast Talking",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for telling the truth in a convoluted and confusing way to cause the hearer to believe something else. Can bypass lie detection."
};

global.skill_data[$ "Forgery"] = {
    name: "Forgery",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for copying the penmanship of another author. Used in making falsified documentation."
};

global.skill_data[$ "Juggling"] = {
    name: "Juggling",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for performing an act where one throws objects and catches them in a cycle. Can be used to catch incoming thrown weapons with an opposed skill check vs attack roll."
};

global.skill_data[$ "Open Lock"] = {
    name: "Open Lock",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for manipulating locked objects to now be open."
};

global.skill_data[$ "Lip Reading"] = {
    name: "Lip Reading",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for reading the lips of a speaking individual despite not being able to hear them."
};

global.skill_data[$ "Trapping"] = {
    name: "Trapping",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for laying traps."
};



global.skill_data[$ "Tumbling"] = {
    name: "Tumbling",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Reflexes", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for rolling out of danger be it falling, or avoiding an attack. Grants a +1 to dodge rolls per rank, can negate 5ft of fall damage per degree of success."
};

global.skill_data[$ "Venom Handling"] = {
    name: "Venom Handling",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the proper collection, storage, and application of venom and poisons."
};

global.skill_data[$ "Ventriloquism"] = {
    name: "Ventriloquism",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for throwing one’s voice to a location that is different from the point of origin."
};

global.skill_data[$ "Voice Mimicry"] = {
    name: "Voice Mimicry",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for sounding like someone else."
};

global.skill_data[$ "Dirty Tricks"] = {
    name: "Dirty Tricks",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for noticing a situation that could give you the advantage in a fight. Could be loose ground, tripping hazards, dangerous objects, etc."
};

global.skill_data[$ "Gaming"] = {
    name: "Gaming",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for playing certain card, or luck based games."
};


global.skill_data[$ "Weakness Identification"] = {
    name: "Weakness Identification",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for spotting chinks in armor. You gain +1 AP per DoS on your next attack if you succeed or you can give an ally the benefit for 1 attack. This is a normal action."
};

global.skill_data[$ "Sneak"] = {
    name: "Sneak",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for moving unseen."
};

global.skill_data[$ "Climb Walls"] = {
    name: "Climb Walls",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
            { attribute: "Strength", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for scaling sheer surfaces."
};

global.skill_data[$ "Decipher"] = {
    name: "Decipher",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for recognizing the intent behind a writ that you cannot read, and seeing potential penmanship quirks."
};

global.skill_data[$ "Spot"] = {
    name: "Spot",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for noticing minute details of importance. Such as trip wires or pressure plates."
};

global.skill_data[$ "Disable"] = {
    name: "Disable",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 },
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing how to cause a mechanism to cease its proper function."
};

global.skill_data[$ "Streetwise"] = {
    name: "Streetwise",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for knowing where to find things that would be considered illegal, or avoiding traffic, or knowing good spots to lay low."
};

global.skill_data[$ "Tracking"] = {
    name: "Tracking",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill to find and follow evidence that something has been here."
};

global.skill_data[$ "Acrobatics"] = {
    name: "Acrobatics",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill to perform rolls and jumps."
};

global.skill_data[$ "Escape Artist"] = {
    name: "Escape Artist",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for manipulating the body to squeeze through or out of areas it normally could not."
};

global.skill_data[$ "Weapon Skill (X)"] = {
    name: "Weapon Skill",
    table: "Roguery",
    specialization: {
        required: true,
        choices: ["Knives", "Daggers", "Swords", "Axes", "Clubs", "Polearms"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for tracking prowess with a weapon type."
};

global.skill_data[$ "Deception"] = {
    name: "Deception",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for hiding the subtle ticks involved with lying about information."
};

global.skill_data[$ "Direction Sense"] = {
    name: "Direction Sense",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for telling direction based on environment or other methods."
};
#endregion

#region Arcane
// =====================================================
// ARCANE TABLE
// =====================================================

global.skill_data[$ "Occult (X)"] = {
    name: "Occult",
    table: "Arcane",
    specialization: {
        required: true,
        choices: ["Daemonology", "Necromancy", "Druidry"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of either Daemonology, Necromancy, or Druidry. This skill is used predominantly with rituals from these focuses."
};

global.skill_data[$ "Ancient History"] = {
    name: "Ancient History",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing late history or events of a given location or famous figure."
};

global.skill_data[$ "Astrology"] = {
    name: "Astrology",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for reading the stars and knowing their celestial positions. Can be used to navigate and scry celestial upcoming phenomena."
};

global.skill_data[$ "Arcane Channeling"] = {
    name: "Arcane Channeling",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for maintaining the flow of arcane energy into an active spell. The caster can make this check to maintain a spell and if successful rolls an arcane charge die plus additional effects from talents to manipulate an active spell."
};

global.skill_data[$ "Spellcraft"] = {
    name: "Spellcraft",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the creation of spells and spell like effects. Can be used to detect energy in the immediate vicinity that has been altered in some way."
};

global.skill_data[$ "Alchemy"] = {
    name: "Alchemy",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill showing knowledge of mixing chemicals and ingredients to create useful mixtures."
};

global.skill_data[$ "Numerology"] = {
    name: "Numerology",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill showing one’s knowledge of mathematics and numbers."
};

global.skill_data[$ "Lore (X)"] = {
    name: "Lore",
    table: "Arcane",
    specialization: {
        required: true,
        choices: [] // Add specific topics as needed
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for one’s knowledge on a given subject."
};

global.skill_data[$ "Emergency Discharge"] = {
    name: "Emergency Discharge",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Reflexes", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill that can be used in the event of a catastrophic failure during a spell cast. This test is done at a penalty equal to the DoF of the Spellcraft test. Each DoS reduces damage from the vented spell’s feedback by 1."
};
#endregion

#region Survival
// =====================================================
// SURVIVAL TABLE
// =====================================================

global.skill_data[$ "Water Find (X)"] = {
    name: "Water Find",
    table: "Survival",
    specialization: {
        required: true,
        choices: [] // Add environment types as needed (e.g. Desert, Forest, Mountains, etc.)
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for using special survival knowledge to find drinkable water in a given environment."
};

global.skill_data[$ "Sailing"] = {
    name: "Sailing",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for one’s ability to handle tasks aboard a ship. Setting rigging, climbing masts, and rowing are all difficult tasks for the uninitiated. Penalties are based on sailing conditions and time frame."
};
global.skill_data[$ "Weapon Skill (X)"] = {
    name: "Weapon Skill",
    table: "Survival",
    specialization: {
        required: true,
        choices: ["Knives", "Daggers", "Swords", "Axes", "Clubs", "Polearms"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for tracking prowess with a weapon type. The primary combat skill."
};
global.skill_data[$ "Weather Sense"] = {
    name: "Weather Sense",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for determining upcoming weather events."
};

global.skill_data[$ "Trapping"] = {
    name: "Trapping",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for laying traps."
};

global.skill_data[$ "Streetwise"] = {
    name: "Streetwise",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for detecting the danger presented by a situation. In a sense, intuition of upcoming events."
};

global.skill_data[$ "Survival (X)"] = {
    name: "Survival",
    table: "Survival",
    specialization: {
        required: true,
        choices: [] // Add terrain types (e.g. Forest, Desert, Mountain, Tundra, etc.)
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for knowing the proper procedure to survive in a given terrain type. Can be tested in other terrains at a -2."
};

global.skill_data[$ "Lore (Animal)"] = {
    name: "Lore (Animal)",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing things about animals."
};

global.skill_data[$ "Lore (Plant)"] = {
    name: "Lore (Plant)",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing things about plants."
};

global.skill_data[$ "Mountaineering"] = {
    name: "Mountaineering",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: -2 },
            { attribute: "Intelligence", modifier: 0 },
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for navigating and scaling mountain passes. Only one member needs this skill to navigate but others require climb and such to scale."
};



global.skill_data[$ "Spelunking"] = {
    name: "Spelunking",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for navigating caves, tight spaces, and crevices."
};

global.skill_data[$ "Danger Sense"] = {
    name: "Danger Sense",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill that gives an impending sense of danger upon success if such a threat is present. Can disclose the actual danger of a perceived threat in terms of difficulty. Penalties are based on the creature’s deception or stealth."
};

global.skill_data[$ "Direction Sense"] = {
    name: "Direction Sense",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for telling direction based on environment or other methods."
};

global.skill_data[$ "Distance Sense"] = {
    name: "Distance Sense",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "A skill for determining distance between two points either physical or map based."
};
#endregion

#region Occult

#endregion

#region Social
// =====================================================
// SOCIAL TABLE
// =====================================================

global.skill_data[$ "Debate"] = {
    name: "Debate",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 },
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "An advanced form of Persuasion used in argumentation to confound or convince a target. Penalties are based on previous situations with the target."
};
global.skill_data[$ "Bribery"] = {
    name: "Bribery",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 },
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for offering bribes to sway the decision making process of a group or individuals. Note this is not a catch all. Penalties are based on RA of the target."
};
global.skill_data[$ "Intimidation"] = {
    name: "Intimidation",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Strength", modifier: 2 },
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for influencing someone through physical presence."
};
global.skill_data[$ "Diplomacy"] = {
    name: "Diplomacy",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for diffusing situations and helping groups reach compromise."
	
	
};

global.skill_data[$ "Persuasion"] = {
    name: "Persuasion",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for convincing someone to perform an act or believe something they normally wouldn’t within reason. This is contested against the target’s logic test."
};
global.skill_data[$ "Crowd Working"] = {
    name: "Crowd Working",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for interacting with a crowd to push them into a desired emotional direction. Works in tandem with some bard songs. Penalties are based on the size and RA of the crowd."
};

#endregion
}