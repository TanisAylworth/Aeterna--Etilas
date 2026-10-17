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
    description: "This skill is checked whenever interacting with an animal. The check is Modified by the animal's Reaction Adjustment towards you or the party. Degrees of success improve the Reaction Adjustment of the animal to the user or the party. Degrees of failure reduce the Reaction Adjustment to the user or the party. A positive Reaction Adjustment will allow for handling the animal, whereas a negative Reaction Adjustment will cause panic or angry responses. This skill is Modified by the handling difficulty of the creature in question noted as its Temprament."
};

global.skill_data[$ "Listen"] = {
    name: "Listen",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user wishes to hear anything would otherwise be difficult to passively perceive. Degrees of Success determines clarity of interpretation, whereas Degrees of Failure mean nothing of use was heard. Functions as the auditory Perception skill. Modified by surrounding noise, and materials being listened through."
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
    description: "This skill is checked whenever the user has been running at their top speed for an extended period of time. Normally a creature can run for a number of consecutive minutes equal to their fatigue limit prior to sustaining a level of fatigue. This skill allows a test to be made to ignore that level of fatigue. Degrees of Success nullify the fatigue. Degrees of Failure incur the fatigue as normal. Extreme Successes restore a level of fatigue. Extreme Failure incur two levels of fatigue instead. Modified by terrain, weather, or surroundings."
};

global.skill_data[$ "Jumping"] = {
    name: "Jumping",
    table: "General",
    check: {
        mode: "size",
        size_attributes: {
			
            tiny:   { attribute: "Dexterity", modifier: +2 },
            small:  { attribute: "Dexterity", modifier: 0 },
            medium: { attribute: "Strength",  modifier: -2 },
            large:  { attribute: "Strength",  modifier: -4 },
            huge:   { attribute: "Strength",  modifier: -6 }
		}
    },
    difficulty: global.SKILL_SIMPLE,
    description: "This skill is checked whenever the user attempts to leap from one location to another. This skill is modular in that it counts a standing jump and a running jump. For standing each Degree of Success results in 1ft of vertical or horizontal clearance. For running jumps, so long as a single Move action is made prior to this check, each Degree of Success results in 3ft of vertical and 5ft of horizontal distance covered. Modified by Terrain, Weather, and Surroundings."
};

global.skill_data[$ "Balance"] = {
    name: "Balance",
    table: "General",
    check: {
        mode: "size",
        size_attributes: {
            tiny:   { attribute: "Dexterity", modifier: +2 },
            small:  { attribute: "Dexterity", modifier: 0 },
            medium: { attribute: "Dexterity",  modifier: -2 },
            large:  { attribute: "Dexterity",  modifier: -4 },
            huge:   { attribute: "Dexterity",  modifier: -6 }
		}
    },
    difficulty: global.SKILL_SIMPLE,
    description: "This skill is checked whenever the user attempts maintain their balance for whatever reason. Degrees of Success results in a keeping oneself upright. Degrees of Failure results in a loss of balance and another check to attempt to regain balance. Failure of the second check results in total loss of balance. Modified by Terrain, Weather, and Surroundings."
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
    description: "This skill is checked whenever the user attempts a dancing routine or performance. This skill is considered a dodge skill and may be tested as a defensive option. Otherwise, Degrees of Success show the quality of the dancing performance, whereas Degrees of Failure shows the poor dancing performance. Modified by surroundings such as crowds, or loose terrain."
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
    description: "This skill is checked whenever the user is attempting to over eat, or drink, and still hold their liquor. In a sense this is a general competitive eating and drinking skill. Degrees of Success show the ease at which the challenges are faced, whilst Degrees of Failure show failure in maintaining one's self after too much food or drink. Extreme Successes could show a complete lack of any negative sensations, whereas Extreme Failures could be vomiting or blacked out drunk. Modified by size of the meals and amount of drink."
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
    description: "This skill is checked whenever the user attempts to light a fire and are using a fire building kit. Degrees of success shows the ease of lighting the fire. Degrees of failure shows the difficulty in starting the fire. Extreme Successes could save a use of the fire or have it be lit in a fraction of the time. Whereas, Degrees of Failure could waste uses or render the kit ruined. Modified by weather, surroundings, and material."
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
    description: "This skill is checked whenever the user is attempting to manipulate an already started fire. The intent can be to diminish, enlarge, or direct the path and size of the flames. Degrees of Success grant positive effects to the desired outcome. Degrees of Failure result in opposite results to the desired outcome. Modified by terrain types, weather, and difficulty of manipulation."
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
    description: "This skill is checked when the user is attempting to store something at a specific location and does not want passerby's to notice it. Degrees of Success are checked against the other party's Passive Perception if they aren't looking for anything, Active if they are looking for something, or Spot if they have it. Degrees of Failure means the caching is easily visible although some unattentive individuals may miss it. Modified by surroundings, and terrain. Note that the user must beat this skill's Degrees of Success to relocate the cached item latter."
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
    description: "This skill is checked whenever the user is attempting to plot a path from one location to the other. Degrees of Success ensure the path is sound. Degrees of Failure means the path is slower than anticipated. Extreme Success results in finding short cuts and reducing travel time. Extreme Failure results in becoming lost and ending up in random locations. This skill may be checked Safely or Sporadicaly. Safe checks are done once to plot a fixed course that will guarentee a travel length and time assuming no intervention. Sporadic travel paths allow multiple checks at intervals to either stay on course or possible become lost or find unexpected paths. Modified by Surroundings, Terrain, and Weather."
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
    description: "This skill is tested whenever the user wishes to use logical deduction to perceive. By plotting logical outcomes of events within a space the user can use their Intelligence as a form of Perception. Degrees of Success and Failure function as normal Active Perception checks. Modified by Surroundings, and Weather."
};

global.skill_data[$ "Spot"] = {
    name: "Spot",
    table: "General",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is tested whenever the user attempts to notice anything in a given area. Spot checks are used in place of Active Perception and do not suffer the penalities due to a hidden item's size. This is a contested check against the hidden object's Degrees of Success. Modified by Surroundings, Terrain, and Weather."
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
    description: "This skill is checked whenever the user attempt to utilize rope for a specific purpose. Degrees of Success amount to the strength and quality of the knots created with this skill. Consider each Degree of Success as 1 point of strength as if employed by a Medium creature for the purposes of lifting and dragging. If a creature is tied up their attempts to break free are in contest with this skill. Degrees of Failure result in a failed knot. Extreme Failures result in a 'False Knot' which act like proper knots until weight or contest is applied to them. Modified by Material, and Surroundings."
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
    description: "This skill is tested whenever the user attempts to perform vocally. Degrees of Success result in positive reactions from the crowd. Degrees of Failure result in negative reactions from the crowd. Can be used a Bardic Performance skill. Modified by the crowd's Reaction Adjustment."
};

global.skill_data[$ "Riding (X)"] = {
    name: "Riding",
    table: "General",
    specialization: {
        required: true,
        choices: ["Equine", "Canine", "Feline", "Bovine", "Caprine", "Porcine", "Cervine", "Ursine", "Pachyderm", "Reptilian", "Amphibian", "Arachnid", "Insectoid", "Crustacean"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is a specialization skill. This skill is checked whenever the user attempts to perform any mounted action other than a Simple Action Move during their turn. Additionally it is checked if the mount is hit, the rider is hit, or any change in status such as Prone, Free Falling, or other positional state occurs to either the Rider or the Mount. Degrees of Success ensure the Rider remains mounted for the duration of the action or status. Degrees of Failure result in the Rider being dismounted by either a disobedient animal or user error. Dismounted riders take 1 die of fall damage for a creature their size whenever they are dismounted unintentionally. If the creature being ridden is taller than 10ft at the shoulder the damage increases by 1 die of fall damager per 10ft as if the rider was falling. Modified by Surroundings, Weather, and Terrain. Can be used a Defensive Action Dodge Skill if the user is currently mounted."
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
    description: "This skill is checked when the user attempts to produce tones and sounds utilizing their body as a wind instrument for the purposes of engaging with a crowd. Degrees of Success result in positive responses from the Crowd. Degrees of Failure result in negative responses from the crowd. Modified by Surroundings, and Terrain. Can be used as a Bardic Performance skill."
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
    description: "This skill is checked whenever the user attempts to treat immediate wounds. This skill counts as Receiving Aid for purposes of determining infection chance. Degrees of Success increase the target's Bleed Out threshold after receiving a Critical Wound equal to the Degrees of Success. This process can be repeated each turn until a more competent individual can stabilize the dying target. Degrees of Failure reduce the Bleed Out threshold by an equal amount. Modified by Surroundings, and Materials."
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
    description: "This skill is checked whenever the user attempts to gather information on local happenings. Degrees of Success produce recent rumors gathered from the various sources in an area. Degrees of Success produce dubious rumors that may not be accurate. Extreme failures may result in shows of aggression from locals. Modified by local Reaction Adjustment."
};

global.skill_data[$ "Musical Instrument (X)"] = {
    name: "Musical Instrument",
    table: "General",
    specialization: {
        required: true,
        choices: ["Lute", "Lyre", "Harp", "Flute", "Whistle", "Recorder", "Horn", "Trumpet", "Bagpipes", "Fiddle", "Viol", "Mandolin", "Dulcimer", "Drum", "Tambourine", "Bells", "Chimes", "Cymbals", "Castanets", "Ocarina"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "This skill is checked whenever the user attempts to play an instrument with intent to engage with a crowd. Degrees of Success result in positive responses from the crowd. Degrees of Failure result in negative responses from the crowd. Modified by Surroundings, and Instrument Quality."
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
    description: "This skill is checked whenever the user attempts to move within a given liquid. Degrees of Success allow the user to move their Swim Speed as a Simple Action, or float. Degrees of Failure results in the inability to move and the user begins sinking. Being submerged in a liquid and requiring air to breathe results in the beginnings of Suffocation. Modified by Surroundings, Material, and Weather."
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
    description: "This skill is checked whenever the user attempts to scale a reasonable climbable surface. Degrees of Success allow the user to move at their Climb Speed as a simple action. Degrees of Failure result in the failing to move and an Endurance test or gain 1 level of fatigue. Extreme Failures result in slipping and falling. Modified by Surrounds, Terrain, and Weather."
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
    description: "This skill is checked when the user attempts to interact with large scale crops in either a beneficial or negative means. Degrees of Success either improve crop yield or reduce crop yield. This is modified by crop complexity, terrain, weather, and surroundings."
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
    description: "This skill is checked whenever the user attempts to determine the market worth of an item. Degrees of Success incurs an accurate price range for the item. Degrees of Failure results in an innaccurate estimate for the price range of an item."
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
    description: "This skill is checked whenever the user attempts to teach an animal how to obey a specific command. This is a joint tested skill where the animal makes an Intelligence test in addition to the results of this skill. Degrees of Success are totalled between both tests and the value is multiplied by 20 to give the resulting XP gain towards the task being trained. If the total is negative that much XP is lost instead."
};

global.skill_data[$ "Animal Husbandry"] = {
    name: "Animal Husbandry",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -3 },
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to breed animals in their care. Degrees of Success ensure positive results. Degrees of Fialure result in complications."
};

global.skill_data[$ "Tailoring"] = {
    name: "Tailoring",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
            { attribute: "Intelligence", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to create items using textiles. Degrees of Success results in higher quality products. Degrees of Failure result in lower quality products. Modified by Material, and Surroundings."
};

global.skill_data[$ "Artistic Ability (X)"] = {
    name: "Artistic Ability",
    table: "Professional",
    specialization: {
        required: true,
        choices: ["Painting", "Drawing", "Sculpting", "Carving", "Engraving"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to perform one of the specialized art forms from the list. Degrees of Succes illicit positive repsonses from the viewer. Degrees of Failure illicit negative responses from the viewer. Is also used in enchanting, ritual magic, and Rune Craft."
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
    description: "This skill is checked whenever the user attempts to work metal in any means. Degrees of Success result in higher quality crafts. Degrees of Failure result in lower quality crafts. Is used in Weapon Smithing, Armor Smithing, and Metal Crafting. Modified by Surroundings, and Materials."
};

//global.skill_data[$ "Xiba Ball"] = {
//    name: "Xiba Ball",
//    table: "Professional",
//    check: {
//        mode: "all",
//        attributes: [
//            { attribute: "Dexterity", modifier: -2 },
//            { attribute: "Reflexes", modifier: -2 },
//            { attribute: "Endurance", modifier: -4 },
//            { attribute: "Perception", modifier: -1 }
//        ]
//    },
//    difficulty: global.SKILL_INTERMEDIATE,
//    description: "A skill for playing the game Xiba Ball. A cultural favorite of the Xiba involving kicking a leather ball through a ring suspended in the center of a ring. Each attribute is tested separately and the totaled degrees of success or failure are compared to the opponent."
//};

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
    description: "This skill is checked whenever the user attempts to make crafts from Leather. Degrees of Success result in higher quality crafts. Degrees of Failure result in lower quality crafts. Used in Armor Crafting, and Leather Crafting. Modified by Surroundings, and Materials."
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
    description: "This skill is checked whenever the user attempts to make crafts from clay or mud. Degrees of Success result in higher quality products. Degrees of Failure result in lower quality products. Modified by Surroundings, and Materials."
};


global.skill_data[$ "Jewelry"] = {
    name: "Jewelry",
    table: "Professional",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to craft using gems or precious stones. Degrees of Success result in higher quality products. Degrees of Failure result in lower quality products. Used in Jeweling. Modified by Surroundings, and Materials."
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
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to maintain accurate maps of an area or region. Degrees of Success results in a quality map of the area. Degrees of Failure results in a lower quality map of the area. Modified by Surroundings, Materials, Terrain, and weather."
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
    description: "This skill is tested whenever the user attempts to fabricate a locking mechanism. Degrees of Success results in a more difficult to pick lock. Degrees of Failure results in an easier to pick lock. This skill's DoS/DoF sets the penalty for the opposing Open Locks test. Modified by Surroundings, and Materials."
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
    description: "This skill is checked whenever the user attempts to repair or construct any level of sea faring vessel. Degrees of Success results in a higher quality vessel. Degrees of Failure results in a lower quality of vessel. Modified by Type, Surroundings, Materials, and Weather."
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
    difficulty: global.SKILL_INTERMEDIATE,   
    description: "This skill is checked whenever the user attempts to create tonics, beverages, or potions. Degrees of Success results in a successful craft. Degrees of Failure results in a failed craft. Modified by Surroundings, Material, and Type."
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
    description: "This skill is checked whenever the user attempts to craft using wood. Degrees of Success result in higher quality products. Degrees of Failure result in lower quality products. Used in Construction, Wood Crafting, Weapon Crafting, and Armor Crafting. Modified by Surroundings, Type, and Materials."
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
    description: "This skill is checked whenever the user attempts to identify a gem or stone. Degrees of Success results in a positive identification. Degrees of Failure results in a failed identification. Modified by Item."
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
    description: "This skill is checked whenever the user attempts to cut, shape, or build with stone. Degrees of Success results in a higher quality product. Degrees of Failure results in a lower quality product. Modified by Surroundings, Materials, and Weather."
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
    description: "This skill is checked whenever the user attempts to craft using raw fibers that require weaving. Degrees of Success results in a higher quality product. Degrees of Failure results in a lower quality product. Modified by Surroundings, Material, and Item Difficulty."
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
    description: "This skill is checked whenever the user attempts to analize or craft an item requiring engineering such as clockwork machines, steam inventions, and cranes. Degrees of Success results in a higher quality product, or an understanding of how the item works. Degrees of Failure results in a lower quality product or a failure to understand how an item functions. Modified by Surroundings, and Item Type."
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
    description: "This skill is checked whenever the user attempts to perform medical care and treatment for Critical Injuries, or is providing care in camp. Degrees of Success increase the Natural Healing Rate of the target by 1. Extreme Successes increase the Nature Healing rate by 2. Degrees of Failure do not grant Natural Healing Rate bonuses. Extreme Failures results in the target receving a weapon wound from a cutting impliment in the hand of the individual. Can be tested to remove the permanent effects of Critical Injuries by making a test modified by the injury's difficulty. Modified by Surroundings, Supplies, and Weather."
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
    description: "This skill is checked whenever the user attempts to craft a Bow like item or Arrow like items. Degrees of Success results in a higher quality product. Degrees of Failure results in a lower quality product. Modified by Surroundsings, Materials, and Item Type."
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
    description: "This skill is checked whenever the user attempts to use the Massage action in or out of combat. Degrees of Success results in the ability for the target to ignore the effects of a Light Wound they've sustained. The wound still exists but the penalties are ignored for 1 hour per Degree of Success. Degrees of Failure result in nothing. Extreme Success makes the ignorance time frame the entire day. Extreme Failure inflicts an additional Light Wound to the target."
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
    description: "This skill is checked whenever the user attempts to make a meal. Degrees of Success results in a higher quality product. Degrees of Failure results in a lower quality product. Each creature requires a number of Rations equal to (1 * (Size Category #)) each day. Cooked meals provide more Rations per Ration used than normal. If daily Ration consumption is not achieved. The party must make Endurance tests or gain 1 level of fatigue. In addition fatigue is not regenerated during sleep, and injuries do not heal naturally."
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
    description: "This skill is checked whenever the user attempts to synthesize a toxic compound. Degrees of Success results in a synthesized dose of poison. Degrees of Failure results in a failure to synthesize a dose of poison. Extreme Successes doubles the number of doses created. Extreme Failures results in a self administration of the poison being synthesized. Modified by Item Type, Surroundings, Materials, and Weather."
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
    description: "This skill is checked whenever the user attempts to put out or navigate safely within a fire. Degrees of Success results in a decrease in the fire's size by 1 category. Degrees of Failure results in an increase in the fire's size by 1 category. Extreme Successes results in the fire's size reducing by 2 size categories. Extreme Failures results in the fire's size increasing by 2 size categories. Modified by the fire's Size, Surroundings, Materials, and Weather. Making a successful check regardless of intent allows for travel through smoke filled areas without the suffocation effect."
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
    description: "This skill is checked whenever the user attempts to handle or maneuver a drawn wheeled vehicle outside of the Move - Simple Action. Degrees of Success results in a controlled maneuver. Degrees of Failure results in a failure to maneuver. Modified by Animal Temprament, Surroundings, Terrain, and Weather."
};

global.skill_data[$ "Foreman"] = {
    name: "Foreman",
    table: "Laborer",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 },
            { attribute: "Willpower", modifier: -2 },
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to manage a work crew. This is a combined skill check and only one attempt at Foreman may be made in a single day of labor. Degrees of Success are added to the production total for that day of labor. Degrees of Failure are subtracted from the production total of that day of labor. Modified by Crew Size, Surroundings, and Weather."
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
    description: "This skill is checked whenever the user attempts to maneuver or handle a seafaring vessel. Degrees of Success results in a successful maneuver. Degrees of Failure results in a failed maneuver. Modified by Surroundings, Vessel Characteristics, and Weather."
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
    description: "This skill is checked whenever the user attempts to dig through stone or collect ore. Degrees of Success  and a Height and Width equal to the size category of the user. Degrees of Failure results in no progress gained. Extreme Successes results in double the distance mined. Extreme Failures results the impliment being damaged as if it was striking itself with a Sundering Strike. Three Extreme Failures simultaneously results in a Cave In unless an Engineer succeeds a check to prevent it. In the event of collecting ore, Degrees of Success result in 1 unit of ore being collected per Degree of Success. Degrees of Failure result in no material being obtained. Modified by Terrain, Material, and Surroundings."
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
    description: "This skill is checked whenever the user attempts to melt ore into usable metals. Degrees of Success results in the creation of a pure metallic ingot. Degrees of Failure results in a failure to craft a metallic ingot. Modified by Surroundings, Material, and Weather."
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
    description: "This skill is checked whenever the user attempts to follow the trail or marks left behind by something travelling through the area. Degrees of Success results in a positive track. Degrees of Failure results in losing the track. Modified by Terrain, Track Type, and Weather."
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
    description: "This skill is checked whenever the user attempts to catch a fish either by hand, spear, net, or rod. Degrees of Success results in the collection of meat Rations equal to (1 * (Degrees of Success#)). Degrees of Failure result in nothing. Extreme Failures result in a random predator encounter from the list of the terrain type being fished in. Modified by Terrain Type, Method, and Weather."
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
    description: "This skill is checked whenever the user is attempting to collect wood. Degrees of Success adds 1 unit of usable wood per Degree of Success. Degrees of Failure results in the failure of collecting any wood. Extreme Failures results in a tree landing on the user dealing damage as if it were a normal strike. Modified by Terrain, Material, and Weather."
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
    description: "This skill is checked whenever the user attempts to collect a crop from an established field. Degrees of Success results in 1 unit of the field's produce being collected per Degree of Success. Degrees of Failure results in a failure to collect and useful product. Modified by Terrain, Plant Type, and Weather."
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
    description: "This skill is checked when the user attempts to control a larger body of individuals. This has additional applications during mass combat as this is a the primary skill for managing morale. Degrees of Success result in ashereance to commands. Degrees of Failure result in chaotic action and loss of control. Modified by Surroundsings, Morale, and Weather."
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
    description: "This skill is checked when the user attempts to use sounds, visuals, or vocalizations to communicate a message to another group. Degrees of Success result in an effectivly seen, heard, or understood signal. Degrees of Failure results in a harder to see, hear, or understand signal. This is a contested skill against the other party's Perception. Modified by Surroundings, Terrain, and Weather."
};

global.skill_data[$ "Armor Optimization"] = {
    name: "Armor Optimization",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 4 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked when the user attempts to use it as a defensive action option. In response to a called strike the user may check this skill as if it were another defensive option. This is a contested skill check against the target's attack. Degrees of Success mean you can place an armored part of the body in the path of the called strike causing the strike to hit that armored section rather than the less armored target. Degrees of Failure results in the opponent hitting their desired target. No Modifiers."
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
    description: "This skill is checked whenever the user attempts to drive a chariot using any other action than the Move Simple Action. This skill is used as the vehicle's Dodge Defensive Action skill. This is either contested to avoid a strike or tested to perform a maneuver. Degrees of Success means a successful avoidance or maneuver. Degrees of Failure results in a failure to dodge an attack or a failed maneuver. Modified by Maneuver difficulty, Animal Temprament, Terrain, and Weather."
};

global.skill_data[$ "Seigecraft"] = {
    name: "Seigecraft",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to operate a siege engine. Degrees of Success function similarly to Firearms Use or Weapon Skill checks. A successful check results in a hit from the weapon. A failed checks results in a miss. Modified by Target, Target's Actions, Terrain, Surroundings, and Weather."
};

global.skill_data[$ "Drilling"] = {
    name: "Drilling",
    table: "Warfare",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to instruct a unit of individuals. This skill is a Teaching skill and adds the combined Degrees of Success and Failure of both parties of the skill being trained. The totaled result of DoS/DoF is multiplied by 30 and the total is the resulting experience gained or losed from that day of drilling towards that skill. Modified by Target's Check, Surroundings, and Weather."
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
    description: "This skill is checked when the user attempts draw the ire of a target or targets. This skill is a Simple Action and is contested by the opponent's willpower test or tests if the target is a group. Degrees of Success result in the target being forced to attack you if possible. Degrees of Failure results in no effect. Note: Enemies will not attack you if doing so would put them in danger. Modified by number of targets."

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
    description: "This skill is checked when the user attempts to find weak points in the target's armor. This skill is a Simple Action that is uncontested. Degrees of Success result in a +1 to the Armor Piercing value of your next attack per Degree of Success. Degrees of Failure results in no effect. Modified by Surroundsings, and Weather."
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
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked when the user attempts to hit a target with a Firearm. This skill is an Attack skill and takes the place of Weapon Skill (X) when used. Targets of a Firearm Use check do not get to make Defensive Actions against these tests unless specified otherwise. Instead the check is heavily penalized by a variety of modifiers. Degrees of Success result in a hit from the Firearm being wielded. Degrees of Failure result in a missed attack. Modified by Surroundings, Speed of Target, Cover Type, Distance, Bore of the Weapon, and Weather."
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
    description: "This skill is checked when the user attempts to repair damage to their equipment. This skill is a Camp Skill. Degrees of Success result in an amount of damage equal to the DoS being repaired compared to the item's IV. Degrees of Failure result in no repaired damage. Critical Failures result in damage being dealt to the item equal to the total Degrees of Failure. Modified by Surroundsings, and Weather."
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
    description: "This skill is checked when the user attempts to inact or change a battlefield strategy during a Mass Combat encounter. This Mass Combat leader skill is made at the start of each round of combat it is done in contest against the enemy's leader. Degrees of Success results in the ability to adjust your planned strategy to be any other Neutral non counter strategy. Degrees of Failure results in the opponent being allowed to change their strategy to be a Neutral non counter strategy. Critical Successes results in the ability to shift to a Countering Strategy instead of just a Neutral strategy. Critical Failures results in the opponent being allowed to shift to a Countering Strategy. No Modifiers."
};

global.skill_data[$ "Weapon Skill (X)"] = {
    name: "Weapon Skill",
    table: "Warfare",
    specialization: {
        required: true,
        choices: ["Small Blades", "Blades", "Great Blades", "Hand Axes", "Axes", "Great Axes", "Small Bludgeons", "Bludgeons", "Great Bludgeons", "Bladed Polearms", "Blunt Polearms", "Axe Bladed Polearms", "Tipped Polearms", "Tools", "Improvised", "Unarmed", "Bows", "Crossbows", "Thrown", "Whips", "Flails", "Shields", "Siege Weapons"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked when the user attempts to use the Attack or Full Attack actions. This is a contested skill check against the target's Defensive Action. Degrees of Success results in a hit against the target. Degrees of Failure results in a miss. Critical Successes are a result of 10+ Degrees of Success and allow a choice of one of the three Critical Hit modifiers. Critical Failures are a result of either rolling 10+ Degrees of Failure or your opponent rolling 10+ or higher on their Defensive Action check. This allows the opponent to select one of the three Critical Defense options. Modified by Surroundings, and Weather."

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
    description: "This skill is checked when the user attempts to identify heraldic colors, symbols, or banners. Degrees of Success result in the user correctly identifying the heraldry and what it represents. Degrees of Failure result in no useful information being gained."

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
    description: "This skill is checked when the user attempts to calm their mind and ready their nerves. This skill is a Camp Skill. Degrees of Success result in 1 level of Fatigue or Fear being removed. Degrees of Failure result in no effect."
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
    description: "This skill is checked when the user attempts to act as an impartial party between two groups. Degrees of Success result in the user helping the opposing parties reach an agreement. Degrees of Failure result in no effect."
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
    description: "This skill is checked when the user attempts to instruct a student in a skill they have knowledge of. Degrees of Success result in an additional 10xp being added to the student's learning roll per Degree of Success and can be used to cover the student's experience deficit. Degrees of Failure result in 10xp being subtracted from the student's learning xp per Degree of Failure. This total can go negative."
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
    description: "This skill is checked whenever the user attempts to learn a new skill without the use of Experiece Points. This is a camp skill and only 1 Learning attempt maybe performed per camp day. Degrees of Success result in an additional 10xp being added to the student's learning roll per Degree of Success and can be used to cover the teacher's failure if an instructor is present. Degrees of Failure result in 10xp being added to the total amount of xp lost per Degree of Failure. This skill is an assisted skill if the learner has a teacher, and thus combines the Learning and Teaching rolls for the XP total."
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
    description: "This skill is checked whenever the user is attempting to diagnose an injury or illness on a living creature. This skill can be performed on a target prior to performing an intrusive surgery or formulating a cure for a particular issue. Degrees of Success indicates a successful diagnosis according to the target's physiology or anatomy, which grants Advantage on the following Doctoring or Brewing checks. Degrees of Failure indicates an unsuccessful diagnosis of the individual's issues and results in Disadvantage on the following checks instead. Modified by Anatomical Complexity, Species Familiarity, and Afflicition Difficulty."
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
    description: "This skill is checked whenever the user attempts to recall or recognize specific references to items or information related to ancient times. Degrees of Success results in a recollection of information about the thing in question. Degrees of Dailure results in a failure to recall anything."
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
    description: "This skill is checked whenever the user attempts to cultivate or propogate roots, tubers, and herbs containing useful properties. Each Degree of Success results in 1 unit of produced herbal type assuming a sprout of the given type has been nurtured and matured. Degrees of Failure results in nothing being gained and the sprout being lost. Modified by Weather, Location, and Terrain."
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
    description: "This skill is checked whenever the user attempts to direct or manage a large scale business or operation involving many parts. Each Degree of Success results in an increase of predicted profits from the target venture by 1%. Each Degree of Failure results in a decrease in predicted profits from the target venture by 1%."
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
    description: "This skill is checked whenever the user attempts to care for and assist in the natural healing of an injured target. Degrees of Success increase the Natural Healing Rate of the cared for target by 1. Critical Successes increase the NHR by 2. Degrees of Failure reduce the NHR of the target by 1, and Critical Failures reduce the NHR by 2. Modified by Equipment, Surroundings, Situation."
};

global.skill_data[$ "Lore (X)"] = {
    name: "Lore",
    table: "Clerical",
    specialization: {
        required: true,
        choices: ["Animal", "Monster", "Plant", "History", "Geography", "Religion", "Arcana", "Occult", "Culture", "Politics", "Military", "Engineering", "Craftsmanship", "Heraldry", "Law", "Languages", "Navigation", "Underworld"] // Add specific lore topics as needed
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to recall information about the chosen topic. Degrees of Success produces substantial information. Degrees of Failure produces nothing."
};

global.skill_data[$ "Law"] = {
    name: "Law",
    table: "Clerical",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to participate within the legal systems of each nation. Degrees of Success improve the overall desired result of the legal battle. Degrees of Failure degrade the overall desired result instead."
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
    description: "This skill is checked whenever the user attempts to Invoke the divine. This skill may be used as a Complex Action to perform miracles in or out of combat. Degrees of Success indicates the user's chosen diety is attentive to their plea and the miracle takes effect. Degrees of Failure indicates the diety is distracted or ignorant of their plea and the Invocation goes unanswered. Critical Success results in double the allowed Devotion Points to be used for the Invocation. Critical Failures results in the obtaining of a Rank of Sin which negates 1 rank of Devotion until purged. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to Invoke or Conjure Miracles or Spells, or simply to hide their own speech. This is a contested skill and is checked against other's Perception checks if they are intending to hear what is being said. Degrees of Success over the opponent means that the verbal component remains unheard. Degrees of Failure over your opponent means the verbal component was heard. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to identify the time and cause of death of a given creature. Degrees of Success results in an accurate estimate of how and when a creature died. Degrees of Failure results in an inaccurate estimate."
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
    description: "This skill is checked whenever the user attemtps to perform large amounts of qunatitative calculations quickly such as counting a pile of gold coins. As a camp action this skill can be checked to determine total quantities of items within the party's stores. Degrees of Success results in an accurate measure of items. Degrees of Failure results in an inaccurate measure of items."
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
    description: "This skill is checked whenever the user attempts to remain hidden from view. This is a contested check against the opponent's Perception checks. Degrees of Success results in being undetected. Degrees of Failure results in being detected. Modified by Surroundings, Weather, and Terrain."
};


global.skill_data[$ "Rogue Weapon (X)"] = {
    name: "Rogue Weapon (X)",
    table: "Roguery",
    specialization: {
        required: true,
        choices: ["Small Blades", "Small Bludgeons", "Bludgeons", "Bows"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked as part of an attack action using one of the chosen weapon types. Rogue Weapon functions identically to Weapon Skill (X) but has a separate more Rogue focused weapon list. This is a contested check against the opponent's Defensive Action. Degrees of Success results in a hit. Degrees of Failure results in a miss."
};

global.skill_data[$ "Prestidigitation"] = {
    name: "Prestidigitation",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to perform parlor 'magic' tricks. This is a camp skill and can be used as a Performance skill. Degrees of Success results in a successful performance and possible rewards. Degrees of Failure results in a failed performance with nothing to gain."
};


global.skill_data[$ "Sleight of Hand"] = {
    name: "Sleight of Hand",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to place or remove an item from another target's person or snatching or placing something without being seen. This is a contested skill versus the oponent's Perception or Perception related skills. Degrees of Success results in successfully hiding the action. Degrees of Failure results in being seen. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to feel out a situation or device without knowing exactly whats going on. Degrees of Success results in a feeling of unease if a situation is turning dangerous, a thought of where to find a hidden object, or a general idea of how a machine works. Degrees of Failure may gice similar signs even if they may be wrong."
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
    description: "This skill is checked whenever the user is attempting to hide their true identity using a disguise. This is a contested check against the opponent's Perception or Perception related skills. Degrees of Success results in the disguise holding. Degrees of Failure results in the disguise failing. Modified by Surroundings."
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
    description: "This skill is checked whenever the user is attempting to lie by volume of information. This is a contested check against the oponent's Charm or Charm related skill. Degree of Success results in being able to talk your way out of a situation. Degrees of Failure results in failing to cover the lie and being caught. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to falsify a document. This is a contested check against the oponent's Perception or Perception based skills. Degrees of Success results in the forgery holding. Degrees of Failure results in the forgery failing and being caught. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to perform a juggling act or catch a thrown weapon. This skill may be used as part of a performance or as a Defensive Action skill. As a Performance skill is functions like every other. As a Defensive Action this skill functions like a Parry requiring you to make a Juggling check against your opponent's attack roll. Degrees of Success results in a successful catch of a thrown weapon. Degrees of Failure results in being hit by the thrown weapon instead. Modified by Surroundings."
};

global.skill_data[$ "Open Lock"] = {
    name: "Open Lock",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
			{ attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to pick a lock. This is a contested check against the difficulty of the lock which is determined by the maker of the lock. Degrees of Success results in the lock being openned. Degrees of Failure results in the lock being unable to be picked. Modified by Surroundings, and Tools."
};

global.skill_data[$ "Lip Reading"] = {
    name: "Lip Reading",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 },
            { attribute: "Perception", modifier: -1 },
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to understand a speaker whom they can't directly hear. Degrees of Success results in the majority of the message being received. Degrees of Failure results in no clear information being gained. Modified by Surroundings, Weather, and Terrain."
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
    description: "This skill is checked whenever the user attempts to roll away from danger, perform an acrobatic routine, or prevent fall damage. This skill can be used as a Performance skill, a Dodge Defensive Action, or a Reaction to falling. As a performance skill is functions normally. As a Dodge skill this skill is checked against the opponent's attack roll. Degrees of Success results in avoiding the attack. Degrees of Failure results in being hit by the attack. As a Reaction each Degree of Success negates 5ft worth of fall damage."
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
    description: "This skill is checked whenever the user attempts to collect, store, or utilize venoms or toxins. This skill can be used as a Complex Action unless the user has the Swift Poisoner Talent which in that case is a Simple Action. Degrees of Success results in a number of doses of venom gathered equal to the DoS. Degrees of Failure results in failure to obtain a dose. Critical Failure results in administering a dose of the handled venom to yourself. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to throw their voice to another location. Degrees of Success results in being able to project their voice up to 5ft away per Degree. Degree of Failure result in no change. Modified by Weather, Terrain, and Surroundings."
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
    description: "This skill is checked whenever the user attempts to emmulate another's voice. This skill requires that the user have heard the voice before. This is a contested check against the Opponent's Perception or Perception based skills. Degrees of Success resutls in a successful lie. Degrees of Failure results in being caught. Modified by Surroundings."
};

global.skill_data[$ "Dirty Tricks"] = {
    name: "Dirty Tricks",
    table: "Roguery",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to utilize an unorthodox method to hinder an opponent. This skill can be made as a Complex Action and if successful can apply one of the following statuses to the enemy; Blind, Immobile, Jolted, and Off-Balance. This is a contested check against the opponent's Defensive Action. Degrees of Success results in the status being applied for one round of combat. Degrees of Failure results in nothing. Modified by Surroundings."
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
    description: "This skill is checked whenever the user engages in games of Luck. This can be a solo check or a contested check against other player's Gaming checks. Degrees of Success results in a positive outcome for that round of the game. Degrees of Failure results in a negative outcome for that round of the game."
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
    description: "This skill is checked whenever the user attempts to move silently. This is a contested check against the target's Perception or Perception based skills. Degrees of Success results in being undetected. Degrees of Failure results in being detected. Modified by Surroundings, Terrain, and Weather."
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
    description: "This skill is checked whenever the user attempts to understand the purpose of a writ without being able to read it. Degrees of Success results in a gleaming of intent from the document without knowing what it actually says. Degrees of Failure results in nothing being gained."
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
    description: "This skill is checked whenever the user attempts to break a mechanical device such as a trap, or machine. Degrees of Success render the item inoperable. Degrees of Failure result in the device remaining functional. Modified by Surroundings."
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
    description: "This skill is checked whenever the user attempts to engage with illegal parties, find areas to lay low, or avoid traffic. Degrees of Success results in finding the intended people, or place. Degrees of Failure results in not finding anyone. Modified by Surroundings, Weather, and Terrain."
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
    description: "This skill is checked whenever the user attempts to break free from restraints such as manacles or bindings. This is a contested checked against the item's base restraint value or the opponent's Rope Use check. Degrees of Success results in being freed by their actions. Degrees of Failure results in remaining stuck. Modified by Surroundings."
};


#endregion

#region Arcane
// =====================================================
// ARCANE TABLE
// =====================================================





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
    description: "This skill is checked whenever the user attempts to scry upon celestial events. This is a camp skill. As a camp action the user can star gaze and if successful they may gain insights into what events will occur and in what order they may occur in relation to celestial movements and significance. Modified by Surroundings, Weather, and Terrain."
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
    description: "This skill is checked whenever the user attempts to maintain an arcane effect or counter an arcane effect. This skill may be used as a Defensive Action to counter another Arcanist's ability to cast. In this case the skill is contested with the winner's effect taking shape. In the case of maintaining the spell Degrees of Success result in the spell being active for another turn past its duration. Degrees of Failure results in the spell fading away. "
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
    description: "This skill is checked whenever the user attempts to cast an arcane spell. As a Complex Action or a Defensive Action an Arcanist can use this skill to craft spells from the Arcane Words they know up to a rank equal to their Arcane Aspect rank at a penalty of -2 per rank. Degrees of Success results in a successful cast. Degrees of Failure results in a spell failure. Critical Successes result in the lowest posible charge generated per charge die being 3. In the event of a natural 1 Critical Success the lowest possible charge per die is 4. Critical Failures result in spell feedback. During a Feedback scenario the arcanist may make a Reaction if they haven't taken one yet to protect themselves. Otherwise they generate arcane charges as normal but the total is split between Area of Effect and Damage. I.E: a generation of 18 results in 9 damage applied to an area of 45 ft. in a Blast pattern centered on the caster."
};

global.skill_data[$ "Arcane History"] = {
    name: "Arcane History",
    table: "Arcane",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "This skill is checked whenever the user attempts to read the recent manipulations of latent Arcane Energy. Degrees of Success results in positively identifying any spells being cast within the given area. Degrees of Failure results in nothing. Modified by Surroundings, Weather, and Terrain."
};



global.skill_data[$ "Lore (Arcane)"] = {
    name: "Lore",
    table: "Arcane",
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
        choices: ["Forest", "Jungle", "Grassland", "Desert", "Mountain", "Arctic", "Wetland", "Coastal", "Ocean", "Underground", "Urban", "Wasteland"] // Add environment types as needed (e.g. Desert, Forest, Mountains, etc.)
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

global.skill_data[$ "Survival Weapon (X)"] = {
    name: "Survival Weapon (X)",
    table: "Survival",
    specialization: {
        required: true,
        choices: ["Small Blades", "Tipped Polearms", "Hand Axes", "Bows"]
    },
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for tracking prowess with a weapon type used by Survivalists. The primary combat skill."
};

global.skill_data[$ "Firebuilding"] = {
    name: "Firebuilding",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for starting fires in the worst conditions with little to no equipment."
};

global.skill_data[$ "Camouflage"] = {
    name: "Camouflage",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for attempting to blend into an environment."
};

global.skill_data[$ "Breathing Control"] = {
    name: "Breathing Control",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Endurance", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for attempting to hold one's breathe or breathe less in general."
};

global.skill_data[$ "Primitive Crafts"] = {
    name: "Primitive Crafts",
    table: "Survival",
    check: {
        mode: "all",
        attributes: [
            { attribute: "Dexterity", modifier: -2 },
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for fabricating improvised tools and weapons."
};


global.skill_data[$ "Hunting"] = {
    name: "Hunting",
    table: "Survival",
    check: {
        mode: "all",
        attributes: [
            { attribute: "Perception", modifier: -2 },
            { attribute: "Reflexes", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for stalking and chasing game."
};

global.skill_data[$ "Foraging"] = {
    name: "Foraging",
    table: "Survival",
    check: {
        mode: "Best",
        attributes: [
            { attribute: "Perception", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for finding and gathering plants. May or may not be edible."
};

global.skill_data[$ "Herbalism"] = {
    name: "Herbalism",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for the identification and collection of plants. Can be used to gather medical herbs or toxic plants or ones fit for eating. Using herbal poultice increases natural healing factor by 1. More advanced remedies can provide higher bonuses."
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


global.skill_data[$ "Survival (X)"] = {
    name: "Survival",
    table: "Survival",
    specialization: {
        required: true,
        choices: ["Forest", "Jungle", "Grassland", "Desert", "Mountain", "Arctic", "Wetland", "Coastal", "Ocean", "Underground", "Urban", "Wasteland"] // Add terrain types (e.g. Forest, Desert, Mountain, Tundra, etc.)
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

global.skill_data[$ "Lore (Monster)"] = {
    name: "Lore (Monster)",
    table: "Survival",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing things about monsters."
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


#endregion

#region Occult
global.skill_data[$ "Occult (Necromancy)"] = {
    name: "Occult (Necromancy)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of Necromancy."
};

global.skill_data[$ "Occult (Vampirism)"] = {
    name: "Occult (Vampirism)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of Vampirism."
};

global.skill_data[$ "Occult (Shamanism)"] = {
    name: "Occult (Shamanism)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of Shamanism."
};

global.skill_data[$ "Occult (Daemonology)"] = {
    name: "Occult (Daemonology)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of Daemonology."
};


global.skill_data[$ "Occult (Wild Crier)"] = {
    name: "Occult (Wild Crier)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of being a Wild Crier were animal."
};

global.skill_data[$ "Lore (Occult)"] = {
    name: "Lore (Occult)",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for knowing the taboo acts of various occult classes."
};


global.skill_data[$ "Component Preparation"] = {
    name: "Component Preparation",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Dexterity", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for handeling and preparring ritual components for occult practices."
};

global.skill_data[$ "Rituals"] = {
    name: "Rituals",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for conducting and officiating in ritual practices for the occult."
};

global.skill_data[$ "Alchemy"] = {
    name: "Alchemy",
    table: "Occult",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Intelligence", modifier: -3 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill showing knowledge of mixing chemicals and ingredients to create useful mixtures."
};
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

global.skill_data[$ "Etiquette"] = {
    name: "Etiquette",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_SIMPLE,
    description: "This skill is checked whenever the user attempts to show levels of respect or courtesy during an encounter. Degrees of Success improve the Reaction Adjustment of the encounter by an equal degree, and Degrees of Failure reduce the Reaction Adjustment of the encounter by an equal degree. Extreme Successes could greatly improve the standing of the user or the party with the encounter party. Extreme failures could cause immediate negative actions. Modified by the existing Reaction Adjustment of the other party, and the difficulty of their culture's etiquette."
};

global.skill_data[$ "Begging"] = {
    name: "Begging",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for showing one’s harmless nature or panhandling skill."
};


global.skill_data[$ "Seduction"] = {
    name: "Seduction",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -4 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for flirting, charming, or romantic manipulation."
};

global.skill_data[$ "Command"] = {
    name: "Command",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Leadership", modifier: -1 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for influencing soldiery to obey specific orders or instructions."
};

global.skill_data[$ "Deception"] = {
    name: "Deception",
    table: "Socail",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_ADVANCED,
    description: "A skill for attempting to lie or deceive someone."
};

global.skill_data[$ "Empathy"] = {
    name: "Empathy",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for determinging feelings and judging intent."
};

global.skill_data[$ "Oration"] = {
    name: "Oration",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: 0 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for speaking publically."
};

global.skill_data[$ "Interrogation"] = {
    name: "Interrogation",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Willpower", modifier: -4 },
			{ attribute: "Charm", modifier: -2 },
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A skill for psrying information from individuals through pain or coercion."
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

global.skill_data[$ "Bargain"] = {
    name: "Bargain",
    table: "Social",
    check: {
        mode: "best",
        attributes: [
            { attribute: "Charm", modifier: -2 }
        ]
    },
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This skill is checked whenever the user attempts to haggle prices up or down. This checked is contested against the opponent's appraisal skill. Degrees of Success result in a cost adjustment of 5% up or down depending on the desired outcome. Degrees of Failure result in a cost adjustment of 5% up or down depending on the opposite desired outcome. Modified by the other party's Reaction Adjustment."
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