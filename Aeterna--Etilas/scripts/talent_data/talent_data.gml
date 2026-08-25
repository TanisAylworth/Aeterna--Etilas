function talent_data(){

global.talent_data = {};

#region General

global.talent_data[$ "Alertness"] = {
    name: "Alertness",
    table: "General",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "A passive increase to your passive perception +1 per rank."
};

global.talent_data[$ "Fleet Footed"] = {
    name: "Fleet Footed",
    table: "General",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Each rank increases the move speed of this character by 10ft."
};

global.talent_data[$ "Iron Stomach"] = {
    name: "Iron Stomach",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character gains advantage on endurance tests for eating poisonous or rotten foods."
};

global.talent_data[$ "Light Sleeper"] = {
    name: "Light Sleeper",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character counts as conscious when making Perception checks while asleep."
};

global.talent_data[$ "Strong Back"] = {
    name: "Strong Back",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character counts as one size category larger when determining their carry capacity."
};

global.talent_data[$ "Sure-Footed"] = {
    name: "Sure-Footed",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage when making Balance tests or when making resistance checks against displacement effects such as Push or Throw."
};

global.talent_data[$ "Animal Affinity"] = {
    name: "Animal Affinity",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage when making skill checks that interact with animals."
};

global.talent_data[$ "Language (X)"] = {
    name: "Animal Affinity",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "This character learns how to speak a language."
};

global.talent_data[$ "Polyglot"] = {
    name: "Polyglot",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character can gleam the intended meaning from another speaking a language they don't know. It is very vague, but gives a general idea."
};

global.talent_data[$ "Durable"] = {
    name: "Durable",
    table: "General",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Increases your CDT by 1 per mastery rank. Can be taken a number of times up to your CDT maximum."
};

global.talent_data[$ "Fitness"] = {
    name: "Fitness",
    table: "General",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Increases your Endurance Test score by 1, up to 2× your Endurance attribute."
};

global.talent_data[$ "Armor Training (Light)"] = {
    name: "Armor Training (Light)",
    table: "General",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "Removes the untrained penalty of wearing light armor."
};

global.talent_data[$ "Armor Focus"] = {
    name: "Armor Focus",
    table: "General",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Reduces the armor penalty of worn armor by 1 per rank."
};

#endregion

#region Professional

global.talent_data[$ "Musical Lore (X)"] = {
    name: "Musical Lore (X)",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        // choices filled later from Bardic College list
    },
    description: "Shows knowledge of a type of music. Select 1 College from the Bardic College List and 1 Intent from that list. Obtain 1 intent from the chosen college. Can be taken multiple times, but each college only once."
};

global.talent_data[$ "Musical Talent (X)"] = {
    name: "Musical Talent (X)",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        // choices = intents from known colleges
    },
    description: "Obtain an intent from a known bardic college. May be taken multiple times; each time choose a new Intent."
};

global.talent_data[$ "Steady Hands"] = {
    name: "Steady Hands",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Gain advantage on crafting and delicate-movement professional skills."
};

global.talent_data[$ "Good Eye"] = {
	name: "Good Eye",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Gain advantage on Appraisal checks and when detecting Forgeries."
};

global.talent_data[$ "Quality Control"] = {
	name: "Quality Control",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "When using any crafting skill you immediately gain 1 level of quality before any checks are made. I.E: Without a check the item is immediately Common quality meaning a successful check results in a Good quality item."
};

global.talent_data[$ "Hard Bargain"] = {
	name: "Hard Bargain",
    table: "Professional",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "This character immediately scales a transaction up or down 5% depending on if they are selling or buying."
};

#endregion 


#region Laborer


global.talent_data[$ "Weathered"] = {
    name: "Weathered",
    table: "Laborer",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character ignores one degree of Heat and Cold per rank of this talent. Stacks with other ignorance modifiers."
};

global.talent_data[$ "Laborious Endurance"] = {
    name: "Laborious Endurance",
    table: "Laborer",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character ignores the penalties of one degree of fatigue for each rank in this talent. Stacks with other ignorance modifiers. Does not ignore going over the Fatigue Limit nor the death thresholds for Fatigue."
};

global.talent_data[$ "Hauler"] = {
    name: "Hauler",
    table: "Laborer",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character maintain their Maximum Carry Capacity for 2x as long before needing to make Endurance tests."
};

global.talent_data[$ "Second Wind"] = {
    name: "Second Wind",
    table: "Laborer",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character totally ignores the first rank of fatigue gained for the duration of that day. Any additional fatigue gain is recorded normally."
};

global.talent_data[$ "Calloused"] = {
    name: "Calloused",
    table: "Laborer",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character totally ignores the first minor wound they sustain for the duration of that day. Any additional minor wounds accrue normally."
};

global.talent_data[$ "Jury Rig"] = {
    name: "Jury Rig",
    table: "Laborer",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character can make any work or tool related item function for a given Labor task. For Example: Cutting wheat with a sword. The checks are made as if using poor quality tools regardless of what quality the item being used is."
};


#endregion

#region Warfare

global.talent_data[$ "Blind Fighting"] = {
    name: "Blind Fighting",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Use other senses when fighting blind or in the dark. Reduces the penalty to -2 without disadvantage. If there is too much noise, the attack is made at -2 with disadvantage."
};

global.talent_data[$ "All In"] = {
    name: "All In",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "This character, upon a successful weapon skill hit using the Attack Complex Action, can OPT to forgo a Defensive Action and a Simple Action to gain a Critical Hit effect."
};

global.talent_data[$ "Suppression"] = {
    name: "Suppression",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "This character can use the Suppression Compound Action. This action forces a number of targets equal to their Weapon Skill ranks divided by 5 to make Willpower tests, at -1 per rank of this talent, against the Fear table."
};

global.talent_data[$ "Close-Quarters Fighting"] = {
    name: "Close-Quarters Fighting",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Ignore the penalty for fighting up close so long as the weapon is small or natural. Applies during grappling and when crammed."
};

global.talent_data[$ "Display Weapon Prowess"] = {
    name: "Display Weapon Prowess",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Use your weapon ranks in place of Intimidation."
};

global.talent_data[$ "Natural Fighting"] = {
    name: "Natural Fighting",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "Fight armed opponents with natural weapons. You do not count as unarmed if you have a natural weapon."
};

global.talent_data[$ "Wild Fighting"] = {
    name: "Wild Fighting",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Forsake defense bonus for the following round to increase attack bonus by an equal margin."
};

global.talent_data[$ "Weapon Style (X)"] = {
    name: "Weapon Style (X)",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        choices: [
            "Unarmed", "1H Light", "Dual Wielding", "2H Large", "Polearms",
            "Blunt w/ Non lethal", "1x Small weapon", "Thrown", "Crossbows",
            "Grappling", "Riding (Land)", "Javelins", "Steam Guns", "Knives",
            "Improvised", "Med-Lrg Swords", "1H and Shield",
            "2H Axe/ 2x Axes/ 1H Axe and Shield", "2x Blades", "Bow", "Riding (Aerial)"
        ]
    },
    description: "Special focus in a fighting style based on a specific weapon type. See Weapon Styles for options."
};

global.talent_data[$ "Turtle"] = {
    name: "Turtle",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "When taking the Full Defense action you cannot be flanked or swarmed and suffer no penalties for doing so. Each mastery rank increases your DR to all damage types by 1."
};

global.talent_data[$ "Rage"] = {
    name: "Rage",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: false, // ranks unlock rage traits
        choices: ["Lucid Rage", "Feel No Pain", "Raging Power", "Indefatigable", "Wild Rage", "Berserker"]
    },
    description: "Enter an enraged state after receiving a light wound or voluntarily. While raging: ignore light-wound effects on rolls; may only perform brute actions; must multi-attack up to positive attack bonus; only Dodge defense; gain half Strength damage bonus. Each mastery rank grants one Rage trait. Lasts until dispelled, a successful save vs influence (+1/round), or unconsciousness. Attacks the nearest opponent."
};

global.talent_data[$ "Weapon Improvisation"] = {
    name: "Weapon Improvisation",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Reasonable improvised weapons are treated as 1 damage die higher and lose Splintering."
};

global.talent_data[$ "Martial Training"] = {
    name: "Martial Training",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Basic knowledge of all weapon types except exotic weapons and firearms. Removes the untrained penalty when using a weapon you lack the Weapon Skill for."
};

global.talent_data[$ "Multi-Attack"] = {
    name: "Multi-Attack",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Removes the base -2 penalty for attacking with one or more natural weapons or off-hand weapons."
};

global.talent_data[$ "Weapon Mastery (X)"] = {
    name: "Weapon Mastery (X)",
    table: "Warfare",
    ranked: true, // up to rank 5
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        // choices = weapons the character is trained in
    },
    description: "Select one specific weapon you are trained in. Gain Weapon Mastery with that weapon: damage die +1 step and all positive traits +1. Can be taken again (up to rank 5); further ranks only increase the damage die by 1 step."
};

global.talent_data[$ "Two Weapon Fighting"] = {
    name: "Two Weapon Fighting",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Reduces the penalty from fighting with two weapons by -2."
};

global.talent_data[$ "Martial Action (Push)"] = {
    name: "Martial Action (Push)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in shoving. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Shove attacks."
};

global.talent_data[$ "Martial Action (Grapple)"] = {
    name: "Martial Action (Grapple)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in grabbing and holding. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Grapple attacks."
};

global.talent_data[$ "Martial Action (Disarm)"] = {
    name: "Martial Action (Disarm)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in forcing a target to drop what they hold. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Disarm attacks."
};

global.talent_data[$ "Martial Action (Trip)"] = {
    name: "Martial Action (Trip)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in knocking a target off balance. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Trip attacks."
};

global.talent_data[$ "Martial Action (Throw)"] = {
    name: "Martial Action (Throw)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in tossing a target. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Throw attacks."
};

global.talent_data[$ "Martial Action (Sunder)"] = {
    name: "Martial Action (Sunder)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in smashing armor and weapons. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Sunder attacks."
};

global.talent_data[$ "Martial Action (Cleave)"] = {
    name: "Martial Action (Cleave)",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Training in striking through multiple opponents. Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Cleave damage pools."
};

global.talent_data[$ "Ambush"] = {
    name: "Ambush",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "During a surprise round, gain advantage on any attack or combat maneuver against opponents whose passive perception DoS are less than your Ambush DoS."
};

global.talent_data[$ "Two Weapon Defense"] = {
    name: "Two Weapon Defense",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "While parrying with two weapons, add the Weapon Skill ranks and traits of both weapons to the parry roll. Damage from parrying is dealt to both weapons individually."
};

global.talent_data[$ "Checking"] = {
    name: "Checking",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Parry an attack using Weapon Skill (Unarmed). A successful Check stops all damage as if dodging but does not require movement."
};

global.talent_data[$ "Dextrous Defense"] = {
    name: "Dextrous Defense",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Use Dexterity to defend against combat maneuvers that normally require Strength."
};

global.talent_data[$ "Armor Training (Medium)"] = {
    name: "Armor Training (Medium)",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Removes the untrained penalty for wearing medium armor."
};

global.talent_data[$ "Armor Training (Heavy)"] = {
    name: "Armor Training (Heavy)",
    table: "Warfare",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Removes the untrained penalty for wearing heavy armor."
};

global.talent_data[$ "Marksmanship"] = {
    name: "Marksmanship",
    table: "Warfare",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "When dealing damage with a bow, reduce the target’s CDT by 1 per rank."
};
#endregion



#region CLERICAL

global.talent_data[$ "Read and Write (X)"] = {
    name: "Read and Write (X)",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        // choices = known languages
    },
    description: "Ability to read and write in a single known language."
};

global.talent_data[$ "Record Keeper"] = {
    name: "Record Keeper",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "As a quick action, note down specific details to recall later without an Intelligence check."
};

global.talent_data[$ "Photographic Memory"] = {
    name: "Photographic Memory",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Any attempt to forge a document or fudge a ledger value immediately fails if you pass an Intelligence check."
};

global.talent_data[$ "Efficient Organizer"] = {
    name: "Efficient Organizer",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "A party takes 10% less time to set up and break down camp. Anyone whose gear is organized by you can retrieve an object from their pack as a quick action instead of a simple action."
};

global.talent_data[$ "Numerate"] = {
    name: "Numerate",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Calculate exact quantities extremely quickly. Use Numerology as a quick action to determine exact amounts."
};

global.talent_data[$ "Merchant Ledger"] = {
    name: "Merchant Ledger",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Spend one day interacting with merchants in an area to gain advantage on all Barter tests, or grant advantage to anyone who reads the ledger."
};

global.talent_data[$ "Auditor"] = {
    name: "Auditor",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Use Numerology to resist Pick Pocket, Forgery, or Deception tests."
};

global.talent_data[$ "Cultural Scribe"] = {
    name: "Cultural Scribe",
    table: "Clerical",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Spend a day observing a people to note customs and courtesies. Grants Etiquette as a skill usable with Intelligence."
};

#endregion

#region Roguery

global.talent_data[$ "Street Fighting"] = {
    name: "Street Fighting",
    table: "Roguery",
    ranked: true,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Fight hand-to-hand using terrain. Allows special maneuvers such as Grapple and Bull Rush untrained when obstacles are present. +1 to all rolls involving creative use of terrain per mastery rank."
};

global.talent_data[$ "Canting"] = {
    name: "Canting",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Speak in a code language known primarily by criminals."
};

global.talent_data[$ "Quick Hands"] = {
    name: "Quick Hands",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Sleight of Hand, Disable, and Open Lock checks."
};

global.talent_data[$ "Acrobat"] = {
    name: "Acrobat",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Tumbling checks including when using the Dodge Defensive Action."
};

global.talent_data[$ "Many Faces"] = {
    name: "Many Faces",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Disguise and Deception checks."
};

global.talent_data[$ "Con Artist"] = {
    name: "Con Artist",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character gains advantage on Gaming and Intuition checks."
};

global.talent_data[$ "Con Artist"] = {
    name: "Con Artist",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character gains advantage on Gaming and Intuition checks."
};

global.talent_data[$ "Backstab"] = {
    name: "Backstab",
    table: "Roguery",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Increase the base damage of sneak attacks by 1 per mastery rank. This damage is multiplied after DR is applied."
};

global.talent_data[$ "Sneak Attack"] = {
    name: "Sneak Attack",
    table: "Roguery",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Increase your bonus to hit when ambushing by +1 per rank."
};

global.talent_data[$ "Quick Poisoner"] = {
    name: "Quick Poisoner",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Add poison to a weapon from a receptacle or on-person source as a free action."
};

global.talent_data[$ "Awareness"] = {
    name: "Awareness",
    table: "Roguery",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Add 1 to active perception Degrees of Success."
};

#endregion

#region Social

global.talent_data[$ "Silver Tongue"] = {
    name: "Silver Tongue",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Persuasion, Desception, and Seduction checks."
};

global.talent_data[$ "Negotiator"] = {
    name: "Negotiator",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Diplomacy, Bargaining, and Debate checks."
};

global.talent_data[$ "Inspiring Orator"] = {
    name: "Inspiring Orator",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Oration, Crowd-Working, and Command checks."
};

global.talent_data[$ "Natural Leader"] = {
    name: "Natural Leader",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_SIMPLE,
    description: "This character uses their Charm in place of their Leadership when determining Maximum Follower Size count."
};

global.talent_data[$ "Interrogator"] = {
    name: "Interrogator",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains advantage on Interrogation, and Empathy checks. Additionally there is no chance that an interrogated target will die during interrogation outside of a critical failure."
};

global.talent_data[$ "Charismatic"] = {
    name: "Charismatic",
    table: "Social",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "This character gains +1 to all Spiritual Attribute tests and may use their Charm to make the test instead of the other attributes."
};

#endregion

#region ARCANE

global.talent_data[$ "Spell Weaving"] = {
    name: "Spell Weaving",
    table: "Arcane",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Utilize two or more sub-aspects from the same Aspect during spell creation. All checks are made at disadvantage."
};

global.talent_data[$ "Sub Aspect Mastery (X)"] = {
    name: "Sub Aspect Mastery (X)",
    table: "Arcane",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    specialization: {
        required: true,
        // choices = sub-aspects
    },
    description: "Each rank increases the Arcane Charge pool when manipulating the chosen Sub Aspect by 2, and reduces the negative effects of failures by 1."
};

global.talent_data[$ "Arcane Conduit"] = {
    name: "Arcane Conduit",
    table: "Arcane",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Each arcane charge die increases by 1 step, but so does the damage die for failures. Optionally active."
};

global.talent_data[$ "Arcane Dispersal"] = {
    name: "Arcane Dispersal",
    table: "Arcane",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Each rank reduces feedback damage by 1 when evacuating Arcane Charges on a failure."
};

global.talent_data[$ "Efficient Channeler"] = {
    name: "Efficient Channeler",
    table: "Arcane",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Spend portions of generated Arcane Charges during Spellcraft to maintain or upkeep already active spells."
};

global.talent_data[$ "Spell Shaping"] = {
    name: "Spell Shaping",
    table: "Arcane",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Each rank generates an automatic 1 Arcane Charge toward spell shaping for area or range."
};

global.talent_data[$ "Overcharge"] = {
    name: "Overcharge",
    table: "Arcane",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Unfetter arcane flow. Assume all charge dice roll maximum. Critical success doubles the total; critical failure auto-fails the Endurance check and deals damage equal to the charge total. Afterward make an Endurance test at a penalty equal to the number of charge dice; each DoF causes 1 Fatigue."
};

global.talent_data[$ "Mental Codex"] = {
    name: "Mental Codex",
    table: "Arcane",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Index 1 word that is always available regardless of whether a spell book or other reference is present."
};

global.talent_data[$ "Arcane Reservoir"] = {
    name: "Arcane Reservoir",
    table: "Arcane",
    ranked: true,
    difficulty: global.SKILL_ADVANCED,
    description: "Store a number of Arcane Charges equal to the rank of this talent. If restrained or unable to move, stored charges explode dealing 1 damage per charge in a 5 ft radius per charge."
};

#endregion


#region SURVIVAL

global.talent_data[$ "Forager"] = {
    name: "Forager",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Advantage when using Survival to find food, but only for berries and mushroom-type foods."
};

global.talent_data[$ "Trailblazer"] = {
    name: "Trailblazer",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Automatically pass navigation tests for backtracking. Gain advantage when navigating in an area you have Survival in."
};

global.talent_data[$ "Shelter"] = {
    name: "Shelter",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Emergency shelters made with Survival gain Insulated (2) and lose Fragile."
};

global.talent_data[$ "Hunter's Patience"] = {
    name: "Hunter's Patience",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "When using Survival to hunt for food, gain advantage on finding larger game."
};

global.talent_data[$ "Fire Starter"] = {
    name: "Fire Starter",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Count as having a tinderbox and the Firebuilding skill even if you do not."
};

global.talent_data[$ "Improvised"] = {
    name: "Improvised",
    table: "Survival",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Improvised weapons and tools lose the improvised penalty."
};

#endregion

#region Occult

global.talent_data[$ "Vampiric Mastery"] = {
    name: "Vampiric Mastery",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Determines the power limit of your vampiric abilities."
};

global.talent_data[$ "Vampiric Power (X)"] = {
    name: "Vampiric Power (X)",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Obtain one of the vampiric powers from the list."
};

global.talent_data[$ "Daemonic Mastery"] = {
    name: "Daemonic Mastery",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Determines the power limit of your Daemonic abilities."
};

global.talent_data[$ "Daemonic Power (X)"] = {
    name: "Daemonic Power (X)",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Obtain one of the Daemonic powers from the list."
};

global.talent_data[$ "Shamanic Mastery"] = {
    name: "Shamanic Mastery",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Determines the power limit of your Shamanic abilities."
};

global.talent_data[$ "Shamanic Power (X)"] = {
    name: "Shamanic Power (X)",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Obtain one of the Shamanic powers from the list."
};

global.talent_data[$ "Necromantic Mastery"] = {
    name: "Necromantic Mastery",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Determines the power limit of your Necromantic abilities."
};

global.talent_data[$ "Necromantic Power (X)"] = {
    name: "Necromantic Power (X)",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Obtain one of the Necromantic powers from the list."
};

global.talent_data[$ "Crier Mastery"] = {
    name: "Crier Mastery",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Determines the power limit of your Wild Crier abilities."
};

global.talent_data[$ "Crier Power (X)"] = {
    name: "Crier Power (X)",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_ADVANCED,
    description: "Obtain one of the Wild Crier powers from the list."
};

global.talent_data[$ "Careful Preparation"] = {
    name: "Careful Preparation",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Gains advantage on Component Preparation tests."
};

global.talent_data[$ "Ritual Master"] = {
    name: "Ritual Master",
    table: "Occult",
    ranked: false,
    difficulty: global.SKILL_INTERMEDIATE,
    description: "Gains advantage on Ritual tests and can ignore the results of a failed test from one of the ritual participants."
};

#endregion

	
}