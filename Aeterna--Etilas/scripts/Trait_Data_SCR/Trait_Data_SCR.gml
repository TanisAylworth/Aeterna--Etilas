global.trait_data = {

medium: {
    name: "Medium",
    description: "Humanoid sized creatures roughly 5'to 7' in height. The baseline size category for combat, movement, and damage calculations."
},

tiny: {
    name: "Tiny",
    description: "Creatures roughly 1' to 3' in height. Gain a +4 bonus to defensive actions against Medium creatures and a -4 penalty on Strength based tests against Medium creatures. Weapons deal damage two die steps lower than Medium. Some skills use Dexterity in place of Strength."
},
// Note: later versions differ in bonuses/penalties — standardize in Part 2

universal: {
    name: "Universal",
    description: "Comfortable among nearly all cultures. Suffers no racial Reaction Adjustments when interacting with other species."
},

strict_code: {
    name: "Strict Code",
    description: "Raised within a rigid code of etiquette and honor. When interacting with other Holdstadtish people, an Etiquette test must be made. On a success, the Reaction Adjustment for the interaction becomes 0. On a failure, the Reaction Adjustment instead becomes a penalty equal to the Degrees of Failure."
},

stiff: {
    name: "Stiff",
    description: "Conditioned to obey laws and social conventions. Must succeed on a Willpower test before knowingly breaking a law, oath, or similarly binding social code, even if doing so would benefit themselves or their allies."
},

curious: {
    name: "Curious",
    description: "Possesses an insatiable curiosity toward unusual people, places, and objects. When confronted with something that captures their interest, they must succeed on a Willpower test at disadvantage or become fixated on it. While fixated, they are distracted and may fail to notice surrounding dangers until interrupted or physically forced to move on."
},

free_thinking: {
    name: "Free Thinking",
    description: "Encouraged to question convention and pursue unconventional solutions. Gain advantage on Intelligence tests involving logic, innovation, problem solving, or creative reasoning."
},

ash_lander: {
    name: "Ash Lander",
    description: "Raised in the harsh Ash Wastes of Holdstadt, these people are accustomed to deprivation and extreme climates. Immune to Heat 1, Cold 1, and fatigue caused by going without food or water for up to 3 days, plus an additional day per Endurance Bonus. Once this period is exceeded, these immunities no longer apply until they have adequately recovered."
},

trauma: {
    name: "Trauma",
    description: "A lifetime of hardship has hardened the mind against terror. Gain a bonus equal to twice your Willpower Bonus on Fear based Willpower tests."
},

unkempt: {
    name: "Unkempt",
    description: "No matter how much effort is spent on grooming or appearance, you always appear disheveled. Positive Reaction Adjustments granted by Charm do not apply."
},

bad_reputation: {
    name: "Bad Reputation",
    description: "Centuries of oppression and rebellion have left these people with an infamous reputation. Suffer a -5 Reaction Adjustment when interacting with nobility and a -2 Reaction Adjustment with all other creatures unless they have reason to judge you individually."
},


fickle: {
    name: "Fickle",
    description: "Monotonous work quickly drains both body and spirit. After several hours spent performing the same repetitive task, suffer 1 Fatigue."
},

untrustworthy: {
    name: "Untrustworthy",
    description: "The Galish possess a long standing reputation for deceit and betrayal. Creatures who recognize you as Galish, and are neither Galish nor allied with them, suffer a -4 Reaction Adjustment when interacting with you."
},

small: {
    name: "Small",
    description: "Creatures roughly 3'–5' in height. Gain a +2 bonus to Dodge (or defensive actions) per size category below Medium, and suffer a -2 penalty on Strength based tests per size category below Medium. Weapons deal damage one die step lower than Medium. Some skills use Dexterity in place of Strength. Material cost of crafted equipment is reduced by 20%."
},
// Note: later versions differ on dodge bonus and material cost — standardize in Part 2

infravision: {
    name: "Infravision",
    description: "Can perceive heat signatures rather than relying solely on visible light. Unless obscured by terrain or barriers that block heat, humanoids and animals are automatically detected by their body heat."
},
// Appears many times — all nearly identical

unaging: {
    name: "Unaging",
    description: "Ages normally until reaching physical maturity at approximately 100 years old. Thereafter, natural aging ceases, and the body remains in its physical prime indefinitely."
},

keen_senses: {
    name: "Keen Senses",
    description: "Possesses extraordinarily acute sight, hearing, and smell. Any Perception test involving one of these senses may be treated as an active Perception test, even when the character would normally only receive a passive observation."
},

screech: {
    name: "Screech",
    description: "May unleash a powerful sonic blast from specialized vocal organs. All other creatures within 20 feet must succeed on a Saving Throw vs. Paralysis or become Stunned for 1 round. This ability may be used safely once per day. Each additional use requires an Endurance test with a cumulative penalty. The second use is made at -4, with each subsequent use increasing the penalty by an additional -2 (-6, -8, etc.). Failure bursts the vocal sac, inflicting a Moderate Head Wound and reducing Echolocation to a 10 foot radius until healed."
},

echolocation: {
    name: "Echolocation",
    description: "By emitting rapid clicks, perceive the world through reflected sound rather than sight. Passively perceive all tangible objects within 30 feet, plus 10 feet per Perception Bonus. Alternatively, focus into a 15° cone extending 200 feet, plus 25 feet per Perception Bonus. Echolocation detects invisible but tangible creatures and objects, but cannot perceive ethereal beings. Its resolution is fine enough to distinguish textures, markings, and even read ink on a page."
},

fang_and_claw: {
    name: "Fang and Claw",
    description: "Possess natural weapons. You may make one Bite attack and two Claw attacks. Exact damage is determined by your species."
},

nature_meld: {
    name: "Nature Meld",
    description: "May physically meld with natural objects (trees, stones, vegetation, etc.), becoming visually and chemically indistinguishable from them. While melded you appear, smell, and feel like the chosen object. Any aggressive action or sudden movement ends the effect."
},

blind: {
    name: "Blind",
    description: "Your eyes are vestigial or nonfunctional. Automatically fail any test that relies solely on normal vision. This drawback is mitigated by any non visual sense you possess (Echolocation, Tremor Sight, etc.) but still applies when that sense cannot provide the necessary information."
},

winged: {
    name: "Winged",
    description: "Possess functional wings capable of sustained flight. Fly at 3x your base movement speed up to a height of 5x your jump height, unless prevented by armor, injury, or other restrictions."
},

scaled: {
    name: "Scaled",
    description: "Your body is covered in thick protective scales that provide natural armor. Gain Damage Reduction 3/3/3/1 across all hit locations. This protection stacks with worn armor, making heavily armored C'Tai exceptionally resilient."
},

slaves_to_shamans: {
    name: "Slaves to Shamans",
    description: "The C'Tai are taught from birth that the C'Tal Shamans speak with the voice of their goddess. Directly disobeying a command from a recognized C'Tal Shaman requires a Willpower test at disadvantage."
},

large: {
    name: "Large",
    description: "Creatures roughly 7'–10' in height. Increase the damage die of weapons you wield by one step. Gain a +2 bonus on Strength based tests against smaller creatures for each size category of difference, but suffer a -2 penalty to defensive actions against smaller creatures for each size category of difference. Some skills use Strength in place of Dexterity."
},

giant: {
    name: "Giant",
    description: "Creatures roughly 11'–16' in height. Increase the damage die of weapons you wield by 2 steps. Gain a +2 bonus on Strength based tests against smaller creatures for each size category of difference, but suffer a -2 penalty to attack actions against smaller creatures for each size category of difference. Some skills use Strength in place of Dexterity."
},

chameleon_skin: {
    name: "Chameleon Skin",
    description: "Can rapidly alter skin pigmentation to match the surrounding environment. While motionless, gain Hide 8 with Advantage. While moving, gain Hide 4. If you already possess ranks in Hide, add these bonuses to your existing skill. Chameleon Skin functions even in broad daylight."
},

shifty: {
    name: "Shifty",
    description: "Your kind are widely regarded as assassins, thieves, and opportunists. In civilized regions where your species is uncommon, begin social interactions with a -5 Reaction Adjustment."
},

venomous: {
    name: "Venomous",
    description: "Possess venom glands that produce a Rank 3 Neurotoxin. The venom may be delivered through your Bite attack, applied to a weapon, or spat as a ranged attack. The toxin follows all normal rules for a Rank 3 Neurotoxin."
},

low_light_vision: {
    name: "Low-Light Vision",
    description: "Can see in dim light as though it were bright light. As long as some form of illumination is present, you see at night as clearly as a Human sees during the day."
},
// Note: name appears both as "Low-Light Vision" and "Low Light Vision" — standardize in Part 2



tiny_small: {
    name: "Tiny-Small",
    description: "Between Tiny and Small (typically 1'–3'). Apply all effects of the Small trait as though you were one additional size category smaller. Weapons deal damage two die steps lower than Medium. Gain +2 to defensive actions and -2 on Strength based tests per size category below Medium. Some skills use Dexterity in place of Strength."
},

dark_vision: {
    name: "Dark Vision",
    description: "Can see perfectly in complete natural darkness as though it were broad daylight. This ability does not function in magical darkness unless otherwise specified."
},

subterranean_gps: {
    name: "Subterranean GPS",
    description: "You possess an instinctive awareness of your location beneath the earth. While underground, you always know your position relative to the surface and cannot become naturally lost."
},

stout: {
    name: "Stout",
    description: "Though short in stature, your build is exceptionally broad and dense. You are treated as Small for all purposes except Strength tests, which use Medium rules."
},
// Note: second version is different (no Small penalties) — standardize in Part 2


talons_and_beak: {
    name: "Talons and Beak",
    description: "Each of your four limbs ends in talons rather than hands. You require specially crafted equipment, increasing its cost by 50%. Each talon functions as a natural 1d4 Claw weapon, and your beak functions as a natural 1d6 Peck attack. Because your beak lacks the flexibility of lips, learning spoken languages designed for lip articulation is always treated as an Advanced skill."
},

keen_eyes: {
    name: "Keen Eyes",
    description: "Your eyesight is extraordinarily acute. Gain Advantage on all Perception tests that rely primarily on sight."
},
// Note: nearly identical to eagle_eyes — consider merging in Part 2


quick_flight: {
    name: "Quick Flight",
    description: "Launching into the air is second nature. You may begin flying as an Immediate Action instead of the normal action required."
},

scent: {
    name: "Scent",
    description: "Your sense of smell is extraordinarily acute. You can identify and track scents within a 30 foot radius, detect creatures by smell alone, and may attempt Perception tests using scent whenever smell would reasonably provide the necessary information."
},
// Note: some versions use 60-foot radius — standardize in Part 2


barking: {
    name: "Barking",
    description: "Your vocal anatomy cannot reproduce the speech of other races. You are incapable of speaking non native languages, though you can fully understand them and may learn to read and write them normally. Communication is limited to your own complex barking language."
},

overwhelming_swarm: {
    name: "Overwhelming Swarm",
    description: "Your kind excel at bringing down prey through sheer numbers. Whenever a creature is being Swarmed, you and all allied swarmers gain Advantage on all tests made against that target in addition to the normal benefits of Swarming. For Grapple and other combat maneuvers, every allied swarmer counts as providing assistance, even if they have already attacked this turn."
},

burrow: {
    name: "Burrow",
    description: "Can tunnel through soft earth at a Burrow Speed of 10 feet. This ability cannot penetrate solid stone or similarly dense materials unless otherwise specified."
},

hated: {
    name: "Hated",
    description: "Your species is infamous for its recent attacks and the devastation it has caused. All social interactions with Holdstadt begin with a Reaction Adjustment of -15."
},
// Note: second version is Gnoll-specific (-10 vs Good/Neutral) — standardize in Part 2

bold: {
    name: "Bold",
    description: "You possess exceptional courage and confidence. Any penalties or modifiers imposed by Fear are halved, rounding in the manner most favorable to you."
},

tremor_sight: {
    name: "Tremor Sight",
    description: "Perceive the world through vibrations in the ground. You can detect the location and approximate size of creatures and objects within 30 feet through solid surfaces. On soft ground, this range is reduced to 10 feet, while loose ground such as sand or gravel reduces it to 5 feet."
},

filthy_pigs: {
    name: "Filthy Pigs",
    description: "Orcs possess a well earned reputation for brutality and filth. Social interactions with members of civilized races begin with a Reaction Adjustment of -8."
},

carnivorous: {
    name: "Carnivorous",
    description: "Your digestive system is adapted primarily for meat. Meat provides full nourishment, while plant matter offers little sustenance and prolonged dependence upon it may lead to malnutrition at the GM's discretion."
},
// Note: also appears as "carnivore" — merge in Part 2

tusked: {
    name: "Tusked",
    description: "Large, powerful tusks grant you a natural Gore attack that deals 1d8 Piercing damage."
},
// Note: also appears as "tusks" and "gore" — merge in Part 2

rough_and_tumble: {
    name: "Rough and Tumble",
    description: "Your resilient physiology is remarkably difficult to wear down. Gain Damage Reduction 3/3/3/3 across your entire body. Ignore the effects of Light Wounds, and naturally regenerate one Light Wound per day."
},

ugly: {
    name: "Ugly",
    description: "Your appearance is unsettling to most people. During character creation, your Charm attribute cannot exceed 12 before racial adjustments are applied. If Charm would be higher, it is reduced to 12 before any racial modifiers are applied."
},

submissive: {
    name: "Submissive",
    description: "A lifetime of mistreatment has conditioned you to yield to perceived authority. Whenever someone you recognize as an authority figure directly opposes or commands you, you must succeed on a Willpower test made at Disadvantage to continue resisting or arguing."
},

claws: {
    name: "Claws",
    description: "Your hands end in heavy claws. You may make two natural Claw attacks, each dealing 1d6 damage."
},

black_fur: {
    name: "Black Fur",
    description: "Your dense black coat conceals you exceptionally well. While in darkness, your Hide skill gains +3 ranks and Advantage. When moving barefoot, your Stealth skill also gains +3 ranks. Your thick fur additionally provides Damage Reduction 3/2/3/1 across your body."
},

oiled_coat: {
    name: "Oiled Coat",
    description: "Your naturally oily fur is highly flammable. Whenever you catch fire, both the duration of the flames and all fire damage you suffer are doubled."
},

monstrous: {
    name: "Monstrous",
    description: "Your species is regarded as little more than a savage beast by civilized peoples. Social interactions with all but the most hardened or desperate individuals begin with a base Reaction Adjustment of -20."
},

smelly: {
    name: "Smelly",
    description: "Your thick coat traps odors with remarkable efficiency. Any creature attempting to locate you by scent doubles the effective range of its scent based perception."
},

dull: {
    name: "Dull",
    description: "Your species possesses only limited aptitude for abstract learning. You cannot learn to read or write without magical intervention. You may learn only one language in addition to Orcish, and Knowledge based skills can never exceed Rank 1."
},

fang_tusk_and_claw: {
    name: "Fang, Tusk and Claw",
    description: "Your body is a living arsenal. When making a natural attack, you may make a Bite attack (1d6) that immediately chains into a Tusk Gore attack (1d8), followed by two Claw attacks (1d6 each). These are treated as natural weapons."
},

wicked_laugh: {
    name: "Wicked Laugh",
    description: "Your unnerving laughter can shatter the resolve of weaker creatures. As an action, make an Intimidation test opposed by the Willpower test of every creature able to hear you. If you achieve more Degrees of Success than a target, it becomes Frightened and Stunned for one round. A creature that resists this ability becomes immune to your Wicked Laugh until the end of the encounter."
},

blood_scent: {
    name: "Blood Scent",
    description: "The smell of fresh blood drives your predatory instincts. You automatically detect the location of any bleeding creature within 100 feet and may track bleeding targets with perfect accuracy, regardless of normal tracking conditions."
},

narcissist: {
    name: "Narcissist",
    description: "Your pride cannot tolerate defeat. Whenever you are publicly bested, humiliated, or proven inferior, you must succeed on a Willpower test or immediately attempt to reassert your dominance through intimidation, violence, cheating, or another display of superiority. Even if you suppress the initial impulse, the need to reclaim your status remains until it has been satisfied."
},

sensitive_tail: {
    name: "Sensitive Tail",
    description: "Your highly sensitive tail constantly samples the world around you. You can detect vibrations through the ground, determine the direction of air currents, and sense subtle changes in temperature, effectively granting 360 degree awareness. In addition, gain a +1 bonus to Dexterity based acrobatic skills such as Tumbling and Tightrope Walking."
},

vermin: {
    name: "Vermin",
    description: "Your resemblance to common rats makes many civilized peoples instinctively distrust you. Interactions with Humans, Galish, Gnomes, and Dwarves begin with a base Reaction Adjustment of -5."
},

tooth_and_claw: {
    name: "Tooth and Claw",
    description: "You possess natural weapons in the form of sharp teeth and claws. You may make two Claw attacks (1d4 each) and one Bite attack (1d6). These attacks are considered trained for combat. Your unique hand structure requires specially crafted ranged weapons, increasing their cost by 50%."
},


subterranean_gps: {
    name: "Subterranean GPS",
    description: "You possess an instinctive awareness of your location beneath the earth. While underground, you always know your position relative to the surface and cannot become naturally lost."
},
// Note: very similar to underground_gps — consider merging in Part 2

ancestral_charm: {
    name: "Ancestral Charm",
    description: "Your draconic ancestry commands the respect of reptilian creatures. When determining Reaction Adjustments with reptiles, double your Charm bonus."
},

draconic_scales: {
    name: "Draconic Scales",
    description: "Your body is protected by dense dragon scales, granting Damage Reduction 2/2/2/2 across your entire body."
},

chosen: {
    name: "Chosen",
    description: "Fashioned in the image of Minos, the God of Strength, your people are forever touched by his divine favor. You may always channel the Blessings of Minos, even without devotion or formal worship."
},

brassen_horde: {
    name: "Brassen Horde",
    description: "Your people served as the foremost enemy during the War of Horns. Those who remember the conflict view your kind with fear and resentment. Any sentient creature whose culture or history was involved in the war begins social interactions with a base Reaction Adjustment of -10."
},

gore: {
    name: "Gore",
    description: "Your heavy horns are natural weapons. You may make a Gore attack that deals 1d8 damage."
},

shape_change: {
    name: "Shape Change",
    description: "You may alter your size at will, assuming any size up to three size categories larger than your natural Minute form (to a maximum of Medium). While transformed, your base Critical Damage Threshold becomes 6, but you lose all other natural racial abilities until you return to your true form."
},

lullaby: {
    name: "Lullaby",
    description: "You secrete a naturally soporific fragrance. Creatures within range must succeed on a Poison save at -4 or become Drowsy. Aggressive creatures that fail instead have a 50% chance of immediately falling unconscious."
},

glamour: {
    name: "Glamour",
    description: "You weave subtle illusions into the world around you. While within line of sight, you may create minor visual or auditory hallucinations, such as the snap of a twig, a distant whisper, or the glint of reflected light. These illusions are convincing but harmless. Creatures that succeed on a save versus Illusion recognize the effect as false."
},

nature_empathy: {
    name: "Nature Empathy",
    description: "By touching a plant or animal, you instinctively understand its emotional state with perfect clarity. However, you also experience those same emotions yourself for as long as the connection persists."
},

whimsical: {
    name: "Whimsical",
    description: "Your thoughts follow the unpredictable currents of the Fey. Civilized races often find your behavior erratic and unsettling. At the GM's discretion, you may be required to succeed on a Willpower test to resist sudden impulses, distractions, or inexplicable whims."
},

distrust: {
    name: "Distrust",
    description: "The Fey are infamous for twisted bargains and hidden meanings. Other races rarely trust your intentions, making negotiations, agreements, and contracts exceptionally difficult. Others scrutinize your every word for deception or loopholes."
},

minute: {
    name: "Minute",
    description: "Among the smallest intelligent creatures, rarely exceeding the length of a human hand. Apply all mechanical effects of the Minute size category."
},

true_sight: {
    name: "True Sight",
    description: "Your eyes perceive the world as it truly is. You ignore most visual obstructions, including mundane darkness, natural fog, and similar non magical concealment."
},

retractable_claws: {
    name: "Retractable Claws",
    description: "Your retractable claws serve as natural weapons and grant Grapple 2. While maintaining a grapple, you may use your Grapple action to Rake your opponent, making two unpenalized Claw attacks. Your claws also provide Climbing Rank 3."
},

roar: {
    name: "Roar",
    description: "You may unleash a terrifying roar as an action. Every creature within the immediate vicinity must succeed on a Willpower save at a penalty equal to your Endurance bonus or suffer Fear equal to its Degrees of Failure. The first use each day carries no risk. Each additional use requires an Endurance test at a cumulative -1 penalty per previous roar. Failure causes a Moderate Head Wound as your vocal cords tear from the strain."
},

rare: {
    name: "Rare",
    description: "Your unusual physique makes equipment difficult to manufacture. Armor and clothing require accommodations for your tail and body shape, increasing their cost and crafting time by 15%."
},

distractible: {
    name: "Distractible",
    description: "Bright reflections and moving lights instinctively capture your attention. Whenever such a distraction is present, you must succeed on a Willpower test made at Disadvantage before attempting any Perception test directed elsewhere."
},

cat_nap: {
    name: "Cat Nap",
    description: "Your species does not recover properly from a single prolonged rest. Instead of one uninterrupted 8 hour sleep, you must obtain four separate 2 hour periods of sleep throughout the day to recover fatigue normally."
},

tail: {
    name: "Tail",
    description: "Your long, muscular tail provides exceptional balance. Gain a +2 bonus to Dexterity tests involving balance, as well as +2 bonuses to Tumbling and Acrobatics tests."
},

bite: {
    name: "Bite",
    description: "Your powerful jaws are natural weapons. You possess a Bite attack appropriate for your species."
},

thick_fur: {
    name: "Thick Fur",
    description: "Your dense coat provides Damage Reduction 1/1/3/2 across your body. In addition, you are immune to the effects of Cold 1 and Heat 1."
}
	
};