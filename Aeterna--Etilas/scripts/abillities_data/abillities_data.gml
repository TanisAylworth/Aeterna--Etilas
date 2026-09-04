function ability_data(){

global.ability_data = {};

// =====================================================
// ABILITY DATA (species tooltips)
// =====================================================
if (!variable_global_exists("ability_data"))
    global.ability_data = {};

global.ability_data[$ "Ash Landers"] = {
    name: "Ash Landers",
    description: "Raised in the ash wastes. Immune to Heat 1, Cold 1, and fatigue from not eating or drinking for 3 days + 1 per Endurance bonus. After that time frame the immunity is lost."
};

global.ability_data[$ "Trauma"] = {
    name: "Trauma",
    description: "Hard lives and worse memories. Gain 2× Willpower bonus on Fear-based Willpower tests."
};

global.ability_data[$ "Nature Meld"] = {
    name: "Nature Meld",
    description: "Physically meld with a natural object and become indistinguishable from it (look, smell, and often effective invisibility while still). Aggressive movement or leaving the object breaks the effect."
};

global.ability_data[$ "Half Breed"] = {
    name: "Half Breed",
    description: "Gain all racial boons from both parent species (Galish subrace + Human subrace)."
};

global.ability_data[$ "Screech"] = {
    name: "Screech",
    description: "Emit a blast of sonic energy in a 20 ft radius. Creatures other than you must save (paralysis / mental rules as your species specifies) or be stunned for 1 round. Safe once per day; further uses require an Endurance test at −4 (then −6, −8, …). Failure bursts the vocal sac: echolocation limited to 10 ft and a Moderate head wound."
};

global.ability_data[$ "Echolocation"] = {
    name: "Echolocation",
    description: "Perceive space via sound. Passive awareness 30 ft + 10 ft per Perception bonus, or a focused 15° cone out to 200 ft + 25 ft per Perception bonus. Reveals tangible invisible entities; cannot sense ethereal ones. Fine enough to read ink by vibration and appreciate tactile art."
};

global.ability_data[$ "Scaled"] = {
    name: "Scaled",
    description: "Tough natural armor: DR 3/3/3/1 over the whole body."
};

global.ability_data[$ "Chameleon Skin"] = {
    name: "Chameleon Skin",
    description: "Shift skin color to match surroundings. Standing still: Hide rank 8 with advantage. Moving: Hide rank 4. Stacks with existing Hide. Usable even in daylight."
};

global.ability_data[$ "Sensitive Tail"] = {
    name: "Sensitive Tail",
    description: "Tail senses vibration, wind, and temperature shifts for effective 360° awareness. +1 to Dexterity-based acrobatics such as tumbling and tightrope walking."
};

global.ability_data[$ "Ingenious"] = {
    name: "Ingenious",
    description: "Possess an exceptional gift for creative problem solving and improvisation. Whenever suitable materials are reasonably available, you may craft items up to Makeshift Quality without requiring a proper workshop."
};

global.ability_data[$ "Evolution"] = {
    name: "Evolution",
    description: "Spend 2000 XP to gain ranks in the Evolution talent for extra natural gifts (wings, breath weapon, size changes, stronger natural weapons, chromatic resistance, arcane reservoir, hoard strength, etc.)."
};

global.ability_data[$ "Subterranean GPS"] = {
    name: "Subterranean GPS",
    description: "While underground, always know exact location in the world."
};

global.ability_data[$ "Ancestral Charm"] = {
    name: "Ancestral Charm",
    description: "When interacting with reptiles, double Charm bonus for reaction adjustment."
};

global.ability_data[$ "Draconic Scales"] = {
    name: "Draconic Scales",
    description: "Natural scales grant DR 2/2/2/2."
};

global.ability_data[$ "Chosen"] = {
    name: "Chosen",
    description: "Made in the image of Minos, God of Strength. May always channel his blessing even without formal devotion."
};

global.ability_data[$ "Shape Change"] = {
    name: "Shape Change",
    description: "Change size at will up to 3 categories larger than natural form (Minute → up to Medium). In larger form, base CDT becomes 6 and other natural abilities of the tiny form are lost while enlarged."
};

global.ability_data[$ "Lullaby"] = {
    name: "Lullaby",
    description: "Secrete a scent that acts as a sleep toxin. Nearby creatures save vs Poison at −4 or become sleepy; if already aggressive, 50% chance to fall unconscious."
};

global.ability_data[$ "Glamour"] = {
    name: "Glamour",
    description: "Cause minor audio or visual hallucinations in line of sight (no louder than a breaking twig, no sharper than a glint of metal). Effect is perceived as real unless the victim succeeds a save vs illusion."
};

global.ability_data[$ "Nature Empathy"] = {
    name: "Nature Empathy",
    description: "On touch, perfectly discern the feelings of plants and animals—and feel that same emotion yourself."
};

global.ability_data[$ "Metal Body"] = {
    name: "Metal Body",
    description: "Dense metal or stone frame. DR 8/8/3/−2."
};

global.ability_data[$ "Defense Protocol"] = {
    name: "Defense Protocol",
    description: "As a compound action, focus entirely on defense and add ranks in the Turtle talent to DR."
};

global.ability_data[$ "Soul Sense"] = {
    name: "Soul Sense",
    description: "Perception beyond ordinary sight uses the soul core’s astral sense. For non-sight Perception, may use Charm as if it were Perception."
};

global.ability_data[$ "Undead"] = {
    name: "Undead",
    description: "Need not eat or breathe. Immune to toxin. Cannot be rendered unconscious and persist until destroyed. Cannot be fatigued. (Paired disadvantages: no natural healing, often killed on sight, vulnerable to certain miracles, requires Life Force.)"
};

global.ability_data[$ "Retractable Claws"] = {
    name: "Retractable Claws",
    description: "Natural claws with Grapple 2. While grappling, may Rake: two unpenalized claw attacks. Also grants Climbing rank 3."
};

global.ability_data[$ "Roar"] = {
    name: "Roar",
    description: "As an action, roar. Nearby creatures make Willpower saves at a penalty equal to your Endurance bonus or take fear equal to degrees of failure. Usable more than once per day; each use after the first requires Endurance at −1 per prior use. Failure: Moderate head wound (torn vocal cords)."
};

global.ability_data[$ "Scent"] = {
    name: "Scent",
    description: "Detect scents in a radius (typically 30 ft; some species 60 ft). Used to notice and track by smell."
};

global.ability_data[$ "Rough Hide"] = {
    name: "Rough Hide",
    description: "Thick skin grants DR 2/1/2/1."
};

global.ability_data[$ "Rough and Tumble"] = {
    name: "Rough and Tumble",
    description: "Skin DR 3/3/3/3. Ignore effects of light wounds. Regenerate 1 light wound per day."
};

global.ability_data[$ "Black Fur"] = {
    name: "Black Fur",
    description: "Thick coat aids stealth: in darkness Hide +3 with advantage; barefoot stealth +3. Also DR 3/2/3/1."
};



global.ability_data[$ "Pack Tactics"] = {
    name: "Pack Tactics",
    description: "Whenever a target is flanked from at least two directions, you and all allies participating in the flank gain a bonus equal to your ranks in this trait to either attack rolls or damage rolls (chosen when the attack is made)."
};



global.ability_data[$ "Martial Focus"] = {
    name: "Martial Focus",
    description: "Gain the Martial Training talent for free, allowing the use of all weapon types without penalty."
};

global.ability_data[$ "Evolution"] = {
    name: "Evolution",
    description: "Your draconic blood continues to develop throughout your life. By spending 2,000 XP, you may purchase a rank in the Evolution Talent, permanently gaining a new draconic adaptation. Available evolutions include Wings, Breath Weapon, increased Size Category, improved natural weapons, Chromatic Resistance, Arcane Reservoir, Hoard Strength, and other evolutions approved by the GM."
};

global.ability_data[$ "Rough Hide"] = {
    name: "Rough Hide",
    description: "Your thick, leathery skin provides natural protection. Gain Damage Reduction 2/1/2/1 across your entire body."
};

global.ability_data[$ "Natural Camouflage"] = {
    name: "Natural Camouflage",
    description: "Within your native terrain, you are treated as though you are permanently benefiting from the Camouflage skill. This effect functions without requiring preparation or concealment beyond what the terrain naturally provides."
};

global.ability_data[$ "Twitch Reflexes"] = {
    name: "Twitch Reflexes",
    description: "Years of darting through dense forests have honed your reactions to an exceptional degree. Gain Advantage on all Reflex tests."
};

global.ability_data[$ "Agile Flyer"] = {
    name: "Agile Flyer",
    description: "Dense forests, narrow caverns, and other difficult terrain do not impede your aerial maneuverability. You never need to make Flight tests solely because you are flying through difficult terrain."
};

global.ability_data[$ "Thick Feathers"] = {
    name: "Thick Feathers",
    description: "Your dense insulating plumage protects you from both the cold and glancing blows. Gain Immunity to Cold 1 and Damage Reduction 1 against Type B damage."
};

global.ability_data[$ "Stoneborn"] = {
    name: "Stoneborn",
    description: "A lifetime spent beneath the earth has made your body remarkably resilient. Gain Damage Reduction 2 against all damage types and 20% Resistance against all spell effects."
};

global.ability_data[$ "Wicked Laugh"] = {
    name: "Wicked Laugh",
    description: "Loud laugh forces Intimidate vs hearers’ Willpower. If you win on degrees of success, they become frightened and are stunned 1 round. On failure, they are immune to further uses for the encounter."
};

global.ability_data[$ "Blood Scent"] = {
    name: "Blood Scent",
    description: "Smell blood at extreme range. Detect a bleeding creature up to 100 ft and track bleeding creatures with perfect precision."
};

}