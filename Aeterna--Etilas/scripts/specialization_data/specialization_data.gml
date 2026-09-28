function initialize_specialization_descriptions()
{
    global.specialization_descriptions = {};

    // =========================================
    // WEAPON SPECIALIZATIONS
    // =========================================

    global.specialization_descriptions[$ "Martial Arts"] =
        "A style which requires Weapon Skill (Unarmed) and utilizes controlled motions of the body to inflict damage with the natural weapons of the body.\n\n"+
		"Stances: At the start of the combat round the user may switch stance as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Attack Stance: In this stance the user is poised to spring forward and strike. Gains a free Simple Action move once per combat round. Can make an additional strike at a -2 penalty to include their usual off hand strike toatlling 3 attacks.\n"+
		"-  Defensive Stance: In this stance the user is more focused on parrying and checking incoming attacks rather than striking. While in this stance the user may make two Defensive Actions without taking the Full Defense Action. If the Full Defense Action is taken in this stance they may make two Dodge and two Parry actions that round.\n"+
		"-  Flowing Stance: In this stance the user changes position frequesntly and attacks from unexpected angles. While in this stance all attacks you make assuming you have space to move at least 5ft around a target are made as if you had an ally flanking the target. If an ally is present already you gain the Swarming bonus instead. Additionally, after striking a target successfully you may move 5ft around them or take the position behind them."+
		"Strikes: As a replacement to one of their attack actions they may use a strike from the following list.\n\n"+
		"-  Kick: Grants the attack Reach (5), Cleave (1), and increases the damage die of the attack by 1 step. If the user made a Charge Action and used this strike the attack may be converted into a Flying Kick. In this case the user counts this as an All In strike, and is considered to be performing a Flying Charge.\n"+
		"-  Sweep: Grants the attack Trip (3), and initiates a Trip Martial Action in addition to the damage of the attack. If the target falls they suffer 10ft of fall damage realtive to their size.\n"+
		"-  Precision Strike: Grants the attack Precise (2) and increases the damage die by 1 step. Additionally if a critical hit is landed using this strike the damage die increases an additional step.\n"+
		"-  Elbows and Knees: The user does not suffer the penalties for close quarters combat. Additionally their attacks increase their damage by 2 dice steps. They also gain Sunder (1), and Grapple (1). If the user initiates or uses their Grapple Action to harm they may replace the normal attack with one of these strikes instead.";

    global.specialization_descriptions[$ "Grappling"] =
        "A style which requires Martial Action (Grapple) and utilizes knowledge of body mechanics and leverage to control, incapacitate, or dismantle a foe.\n\n"+
		"Stances: At the start of the combat round the user may switch stance as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Squared Stance: In this stance the user is poised counter a grapple attempt against themselves. While in this stance the user gains advantage against grapple attempts versus any creature of equal, lesser, or one size category larger. Additionally if a Full Defense Action is taken while in this stance instead of an additional Defensive Action the user may attempt a grapple against an attacking grappler. In this case if the user is successful the attacking grappler immediately loses the dominant position and the user may make a grapple action against them.\n"+
		"-  Staggered Stance: In this stance the user is more poised to lunge, knee, or shoot for openings for a grapple attack. While in this stance the user may make a Grapple Action as a Full Attack Action and may make Grapple attempts as if they were consecutive Attack Actions. In addition if the opponent is untrained in grapple the user gains advantage during the initial grapple attempt. \n\n"+
		"Techniques: Each of the following are additive effects to each of the main grapple actions. The Technique name is followed by the assosciated Grapple Action as such: Technique (Action).\n\n"+
		"-  Rear Chocke (Choke): The Endurance test made to resist this action is done at disadvantage and suffers a penalty equal to the user's ranks in Grapple. \n"+
		"-  Ground and Pound (Wound): Attack rolls using this technique are done at Double Advantage. Additionally, damage dealt to the opponent from these attacks increases by 1 die step, and the user may make the Full Attack Action as long as they remain in the dominant position.\n"+
		"-  Subdue (Pin): While using this technique, in addition to the Pin Grapple Action, the user is not considered Helpless. Additionally, the user may maneuver the opponent up to 5ft per round of combat so long as they maintain the Pin.\n"+
		"-  Arm Bar (Break): The Toughness test made to resist this action is done at disadvantage and suffers a penalty equal to the user's ranks in Grapple.\n";


    global.specialization_descriptions[$ "Brawling"] =
        "A style which requires Weapon Skill (Unarmed) and relies on brute force and overwhelming power to bash and smash foes with unarmed strikes.\n\n"+
		"Stances: At the start of the combat round the user may switch stance as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Aggressive Stance: In this stance the user charges their opponent with raw ferocity. While in this stance the user may make Charge attacks so long as they are not in Close Quarters Combat range. Additionally, after each successful hit against a target of an Attack or Full Attack Action they may make Contested Strength tests. If successful the opponent is pushed back 5ft.\n"+
		"-  Dirty Stance: In this stance the user is more poised seeing and abusing cheap shots and dirty tricks. While in this stance the user does ignores disadvantage to Called Shots, and gains Advantage on the following Martial Actions (Push, Feint, Sunder, Trip, and Cleave). Additionally, they can make Martial Actions as if they were Attacks in a Full Attack Action but they suffer the same penalties as if they were consecutive Attack Actions.\n"+
		"-  Defensive Stance: In this stance the user is more poised to protecting themselves than dealing damage. While in this stance the user can only be hit in the Arms and Legs without the user of a Called Shot. Additionally, the user gains Advantage on Dodge Defensive Actions.\n\n"+
		"Strikes: Each of the following may be used in place of an Attack Action as either part of a Full Attack Action or as an Attack Action.\n\n"+
		"-  Haymaker: Increases the damage of the attack by 1 die step, and the target must make an Intelligence test at a penalty equal to the damage sustained from the strike against the Confusion table.\n"+
		"-  Headbutt: Can be used without penalty in Close Quarters Combat. Increases the damage of the attack by 1 step, and gains Sunder (1).\n"+
		"-  Shove: Every hit using this attack forces a contested Strength test. If successful the opponent is moved as if they were pushed regardless if another Martial Action was used instead. If the Push Martial Action was used with this Strike both results additively stack.\n"+
		"-  Hammerfist: This strike may only be used as part of a Called Shot Action targetting the Head. This strikes increases the attack's damage by 2 steps and gains All In. Additionaly, if the strike is successful the target must make a Strength test at a penalty equal to the damage received or it falls prone from the impact.\n"+
		"-  Stomp: The damage of this attack is increased by 2 dice steps. Additionally if the target is Prone you make attacks at Double Advantage instead of Advantage.\n";


    global.specialization_descriptions[$ "Knife Fighting"] =
        "A style which requires Weapon Skill (Small Blade) and relies on quick jabs and slashes with precise movements of handling a knife or dagger.\n\n"+
		"Stances: At the start of the combat round the user may switch stance as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Forward Stance: In this stance the user places their weapon in the front and readies to lunge or stab. While in this stance the additional attack penalty is reduced to -3 instead of -5. Additionally, if only a single Attack action is made that attack gains Preceise (2).\n"+
		"-  Body Box Guard: In this stance the user squares themselves with arms tucked in to protect their innards. While in this stance you gain advantage against all displacement Martial Actions, and Dodge Defensive Actions. Additionally, if an opponent hits you, you may direct the hit to your arms instead of the original target.\n"+
		"-  Ice Pick Stance: In this stance the user holds their weapon in a high position with the obvious intent to strike downward with it. While in this stance your attacks gain Armor Piercing (2), but suffer Unwieldy (2). Additionally damage dealt in this stance increases by 1 die step.\n\n"+
		"Strikes: Each of the following may be used in place of an Attack Action as either part of a Full Attack Action or as an Attack Action.\n\n"+
		"-  Jab: The damage of this strike is reduced by 1 die step, however the strike initiates a Feint Martial Maneuver and grants the next attack Precise (2) if the Feint is successful.\n"+
		"-  Cut: The attack forces an Endurance test if it sucessfully lands with a penalty equal to the damage sustained by the attack. If the test is failed the target gains 1 level of fatigue from bleeding.\n"+
		"-  Thrust: This attack's damage is incresed by 2 die steps, and has Accurate (3).\n"+
		"-  X Cut: Grants the attack two Sunder Martial Action attempts and for those checks deals and additional die step up in damage.\n";


    global.specialization_descriptions[$ "Straight Sword Forms"] =
        "A style which requires Weapon Skill (Straight Blade) and relies on a variety of Forms to offer versatility to the weapon. Utilizing footwork, angling, and a variety of techniques to overcome many combat challenges.\n\n"+
		"Form: At the start of the combat round the user may switch Form as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Murder Strike: In this Form the user grips their weapon by the blade and utilizes their cross guard as a hammer. While in this Form the user deals all damage as Bludgeoning. Additionally the weapon gains Sunder (2), and Breaker (1). However, the form requires hand protection to perform the Parry Defensive Action.\n"+
		"-  Half-Sword: In this Form the user maintains a close grip with one hand on the blade and the other on the grip. While in this Form Damage from attacks in reduced by 1 die step but the attacks gain Armor Piercing (2), and Grapple (3). Additionally, you ignore the penalties for close combat, and may initiate the Grapple Martial Action as a replacement to one of your attacks each round.\n"+
		"-  Long Point: In this Form extends their weapon to its furthest point. While in this Form attacks are considered to be Reach (5), or (+5) if the weapon has the Reach trait already. Additionally strikes from this Form gain Rapid (1). However, damage from strikes in this form are reduced by 1 die step.\n"+
		"-  Iron Door: In this Form the user places their weapon at an angle to receive high damage strikes and deflect them. While in this Form sucessful Parry Defensive Actions negate all damage. Additionally Sunder Martial Actions cannot target your weapon.\n\n"+
		"Strikes: Each of the following may be used in place of an Attack Action as either part of a Full Attack Action or as an Attack Action.\n\n"+
		"-  Overhand: This strike is made at disadvantage, however, the damage from this strike is increased by 2 dice steps. Additionally, this strike may be used as a Sunder Martial Action.\n"+
		"-  Underhand: This strike forces their opponent's Parry Defensice Actions to be performed at disadvantage. Additionally the damage dealt by this strike is reduced by 1 dice step, but the strike gains Hooking (1).\n"+
		"-  Thrust: This attack's is made at advantage and the strike gains Precise (2).\n"+
		"-  End Them Rightly: This strike may only be used as part of a singular Attack Action. The weapon sustains Serious damage when this is initiated. The strike gains Range (10), Balanced (1), and Thrown. Additionally, the damage of this strike is reduced by 2 dice steps.\n"+
		"-  Thumping Cut: This strike may be used only as part of a Called Shot Action to the head. If successful the user deals damage as normal to the opponent, but they must make one Intelligence test per successful attack at a penalty equal to the damage of the strikes against the Confusion table.\n";

    global.specialization_descriptions[$ "Dueling"] =
        "A style which requires Weapon Skill (Dueling) and relies upon speed, precision, and control of distance. Rather than overpowering an opponent, the duelist seeks to dictate the exchange through footwork, feints, defensive actions, and precisely timed attacks.\n\n"+
		"Form: At the start of the combat round the user may switch Form as a Free Action, but can do so no more than once per round.\n\n"+
		"- Measure: In this Form the user maintains distance from their opponent, relying upon footwork and the length of their weapon to keep the enemy at the edge of engagement. While in this Form, the user may move 5ft as part of any Attack Action. Additionally, attacks made against a target where the attacker moved at least 5ft since the user's previous turn gain Precise (1).\n\n"+
		"- Engagement: In this Form the user closes with their opponent and contests every movement and attack. While in this Form, the user gains Agile (1) and Parry (1). Additionally, whenever the user successfully Parrys an attack, their next attack against that opponent gains Accurate (1).\n\n"+
		"- Counter: In this Form the user deliberately gives ground and waits for their opponent to commit. While in this Form, successful Dodge and Parry Defensive Actions grant advantage to the user's next attack against the attacker. Additionally, the user may perform a Riposte Strike immediately after successfully Parrying an attack, but that strike suffers the normal penalty for an additional attack. However, the user cannot make a Riposte if they have already made an attack during the current round.\n\n"+
		"- Offensive: In this Form the user constantly threatens their opponent with attacks, forcing them to react rather than establish their own rhythm. While in this Form, attacks made after a successful Feint gain Rapid (2). Additionally, the user may make a Feint as part of a Full Attack Action without counting it as one of the attacks declared. However, Defensive Actions made by the user suffer disadvantage while in this Form.\n\n"+
		"Strikes: Each of the following may be used in place of an Attack Action as either part of a Full Attack Action or as an Attack Action.\n\n"+
		"- Lunge: The user extends their body and weapon to make a sudden attack from outside their normal engagement. Before resolving the attack, the user may move up to 10ft toward the target without provoking a Reaction. The attack gains Reach (5), counts as a Charge Attack that scales damage bonus off of Dexterity.\n\n"+
		"- Riposte: This strike may only be performed immediately after successfully Parrying an attack while in the Counter Form. The strike gains Precise (2).\n\n"+
		"- Feinting Strike: Before making this attack the user may perform a Feint against the target. Treat this attack as if it were a follow up attack after a Feint Martial Action but without any attack penalty. Following attacks, if part of a Full Attack Action, suffer the normal penalties but each attack may gain the benefits of one of the previously performed Feint Actions performed that round.\n\n"+
		"- Disengage: The user makes a quick attack while withdrawing from the opponent. The strike suffers disadvantage, but after resolving the attack the user may immediately move up to 10ft away from the target. This movement does not provoke a Reaction.\n\n"+
		"- Point Attack: The user commits to a precise attack against a vulnerable opening. The attack suffers a -2 penalty, but gains Precise (2) and Armor Piercing (1). If the attack scores a critical hit, increase the damage die by 1 step and the attack gains Accurate (1).\n\n";

    global.specialization_descriptions[$ "Great Weapon"] =
        "Training in large two-handed weapons, emphasizing reach, leverage, momentum, and powerful attacks.";

    global.specialization_descriptions[$ "Shield Fighting"] =
        "Training in using a shield as an active weapon as well as for defense.";

    global.specialization_descriptions[$ "Hook Fighting"] =
        "Training in weapons designed to catch, hook, pull, or manipulate opponents and their equipment.";

    global.specialization_descriptions[$ "Formation Fighting"] =
        "Training in coordinated combat alongside allies, maintaining position and exploiting group tactics.";

    global.specialization_descriptions[$ "Zone Control"] =
        "Training in controlling an area of the battlefield and discouraging opponents from entering or moving through it.";

    global.specialization_descriptions[$ "Reach Control"] =
        "Training in managing the distance between combatants, using weapon reach and positioning to control engagements.";

    global.specialization_descriptions[$ "Weapon Grappling"] =
        "Training in using a weapon to trap, bind, redirect, or manipulate an opponent's weapon.";

    global.specialization_descriptions[$ "Sniping"] =
        "Training in long-range precision attacks, emphasizing concealment, patience, and carefully placed shots.";

    global.specialization_descriptions[$ "Bludgeon Fighting"] =
        "Training in the use of clubs, maces, hammers, and other weapons designed to deliver crushing blows.";

    global.specialization_descriptions[$ "Mounted Combat"] =
        "Training in fighting effectively while mounted, including managing movement, positioning, and attacks from a mount.";

    global.specialization_descriptions[$ "Non-Lethal Combat"] =
        "Training in disabling opponents without killing them, using controlled strikes, holds, and other incapacitating techniques.";

    global.specialization_descriptions[$ "Bow Draws"] =
        "Training in specialized drawing and firing techniques that improve the effective use of a bow.";

    global.specialization_descriptions[$ "Defensive Focus"] =
        "Training centered on maintaining a defensive posture, anticipating attacks, and minimizing openings.";

    // =========================================
    // TALENT SPECIALIZATIONS
    // =========================================

    // Add your talent specializations here.

    /*
    global.specialization_descriptions[$ "Backstab"] =
        "A technique for exploiting an unaware opponent, delivering a devastating attack from an unexpected direction.";

    global.specialization_descriptions[$ "Sneak Attack"] =
        "Training in exploiting an opponent's lack of awareness or compromised position to deliver a more effective attack.";
    */
	
///MOUNTS & RIDING (X)///

	global.specialization_descriptions[$ "Equine"] =
    "Horses, ponies, mules, donkeys, and similar hoofed mounts built for riding and draft work.";

global.specialization_descriptions[$ "Canine"] =
    "Wolves, large dogs, and other canid mounts capable of bearing a rider.";

global.specialization_descriptions[$ "Feline"] =
    "Great cats and similar feline mounts, from riding cats to lion- or tiger-like beasts.";

global.specialization_descriptions[$ "Bovine"] =
    "Cattle, oxen, bison, and other heavy bovine mounts used for riding or burden.";

global.specialization_descriptions[$ "Caprine"] =
    "Goats, ibex, and sure-footed goat-like mounts suited to rough or steep terrain.";

global.specialization_descriptions[$ "Porcine"] =
    "Boars, war-pigs, and other swine mounts trained to carry a rider.";

global.specialization_descriptions[$ "Cervine"] =
    "Deer, elk, reindeer, and other antlered cervid mounts.";

global.specialization_descriptions[$ "Ursine"] =
    "Bears and bear-like mounts strong enough to be ridden.";

global.specialization_descriptions[$ "Pachyderm"] =
    "Elephants, mammoths, and other thick-skinned, heavy-bodied mounts.";

global.specialization_descriptions[$ "Reptilian"] =
    "Lizards, drakes, and other reptilian creatures trained as mounts.";

global.specialization_descriptions[$ "Amphibian"] =
    "Giant frogs, salamanders, and other amphibious mounts usable on land or in water.";

global.specialization_descriptions[$ "Arachnid"] =
    "Giant spiders and similar arachnid mounts.";

global.specialization_descriptions[$ "Insectoid"] =
    "Giant beetles, wasps, and other insect mounts large enough to ride.";

global.specialization_descriptions[$ "Crustacean"] =
    "Giant crabs, lobster-like beasts, and other crustacean mounts.";
	
	
///MUSICAL INSTRUMENTS////


global.specialization_descriptions[$ "Lute"] =
    "Plucked string instrument with a fretted neck; common for songs, accompaniment, and tavern performance.";

global.specialization_descriptions[$ "Lyre"] =
    "Hand-held string instrument of antiquity; suited to poetry, courtly music, and simple accompaniment.";

global.specialization_descriptions[$ "Harp"] =
    "Open-frame string instrument played with the fingers; associated with formal, ceremonial, and refined music.";

global.specialization_descriptions[$ "Flute"] =
    "Side-blown or end-blown wind instrument; clear melodic lines for solos and ensemble play.";

global.specialization_descriptions[$ "Whistle"] =
    "Simple duct flute or tin whistle; portable melody instrument for folk tunes and signals.";

global.specialization_descriptions[$ "Recorder"] =
    "End-blown woodwind with a whistle mouthpiece; common teaching and ensemble instrument.";

global.specialization_descriptions[$ "Horn"] =
    "Lip-reed brass or animal-horn instrument; outdoor calls, fanfares, and martial signals.";

global.specialization_descriptions[$ "Trumpet"] =
    "High brass instrument for fanfares, announcements, and bold ceremonial or military music.";

global.specialization_descriptions[$ "Bagpipes"] =
    "Reed instrument with air reservoir and drones; loud outdoor and folk performance.";

global.specialization_descriptions[$ "Fiddle"] =
    "Bowed string instrument played in folk and dance styles; strong for lively crowd music.";

global.specialization_descriptions[$ "Viol"] =
    "Bowed fretted string instrument; softer, sustained tones for chamber and court music.";

global.specialization_descriptions[$ "Mandolin"] =
    "Plucked fretted instrument with paired strings; bright tone for songs and light ensemble work.";

global.specialization_descriptions[$ "Dulcimer"] =
    "Struck or plucked string instrument on a soundboard; folk melody and drone accompaniment.";

global.specialization_descriptions[$ "Drum"] =
    "Struck membranophone; rhythm, marching time, and driving dance or ritual beats.";

global.specialization_descriptions[$ "Tambourine"] =
    "Frame drum with jingles; hand percussion for dance, processions, and lively accompaniment.";

global.specialization_descriptions[$ "Bells"] =
    "Tuned or untuned metal bells; signals, ceremony, and bright rhythmic texture.";

global.specialization_descriptions[$ "Chimes"] =
    "Suspended tuned bars or tubes struck for melody or atmospheric accents.";

global.specialization_descriptions[$ "Cymbals"] =
    "Paired or suspended metal plates; accents, crashes, and martial or festival noise.";

global.specialization_descriptions[$ "Castanets"] =
    "Hand-held clappers; sharp rhythmic punctuation for dance and folk performance.";

global.specialization_descriptions[$ "Ocarina"] =
    "Vessel flute with a rounded body; soft, pure tone for simple melodies and folk tunes.";



///ARTISTIC ABILITY////

global.specialization_descriptions[$ "Painting"] =
    "Applying pigment to surfaces such as canvas, wood, or walls to create images, murals, and finished artworks.";

global.specialization_descriptions[$ "Drawing"] =
    "Creating images with line and shading using pencil, charcoal, ink, chalk, or similar tools.";

global.specialization_descriptions[$ "Sculpting"] =
    "Shaping three-dimensional forms in clay, stone, metal, or other malleable materials.";

global.specialization_descriptions[$ "Carving"] =
    "Cutting and shaping wood, bone, ivory, or soft stone into figures, reliefs, and decorative work.";

global.specialization_descriptions[$ "Engraving"] =
    "Incising designs into metal, stone, glass, or hard surfaces for art, seals, plates, or inscriptions.";
	
	
	
///LORE///

global.specialization_descriptions[$ "Animal"] =
    "Natural beasts, their habits, habitats, tracks, and practical knowledge of living wildlife.";

global.specialization_descriptions[$ "Monster"] =
    "Unnatural, magical, or monstrous creatures, their strengths, weaknesses, and known behaviors.";

global.specialization_descriptions[$ "Plant"] =
    "Herbs, trees, crops, and other flora, including uses, hazards, and growing conditions.";

global.specialization_descriptions[$ "History"] =
    "Past events, famous figures, wars, and the rise and fall of peoples and realms.";

global.specialization_descriptions[$ "Geography"] =
    "Lands, climates, routes, borders, and the physical layout of regions and nations.";

global.specialization_descriptions[$ "Religion"] =
    "Faiths, rites, symbols, clergy, and the practices of cults and organized religions.";

global.specialization_descriptions[$ "Arcana"] =
    "Academic magic theory, schools of spellcraft, magical phenomena, and scholarly tradition.";

global.specialization_descriptions[$ "Occult"] =
    "Forbidden, taboo, or secret knowledge of spirits, pacts, and hidden supernatural practice.";

global.specialization_descriptions[$ "Culture"] =
    "Customs, etiquette, arts, and social norms of peoples and societies.";

global.specialization_descriptions[$ "Politics"] =
    "Courts, factions, intrigue, and how power is held and contested among rulers and states.";

global.specialization_descriptions[$ "Military"] =
    "Armies, strategy, logistics, ranks, and the history and practice of organized warfare.";

global.specialization_descriptions[$ "Engineering"] =
    "Structures, machines, fortifications, and the principles behind large-scale construction.";

global.specialization_descriptions[$ "Craftsmanship"] =
    "Trades, tools, materials, and the standards of skilled making and artisanal work.";

global.specialization_descriptions[$ "Heraldry"] =
    "Arms, banners, sigils, and the identification of houses, orders, and emblems.";

global.specialization_descriptions[$ "Law"] =
    "Codes, courts, contracts, crimes, and legal procedure within known jurisdictions.";

global.specialization_descriptions[$ "Languages"] =
    "Tongues, scripts, dialects, and the recognition or translation of written and spoken speech.";

global.specialization_descriptions[$ "Navigation"] =
    "Charts, stars, landmarks, and methods of finding way across land, sea, or sky.";

global.specialization_descriptions[$ "Underworld"] =
    "Criminal networks, black markets, hidden routes, and the unspoken rules of illicit society.";
	
	
	///ROGUE WEAPONS///
	
	global.specialization_descriptions[$ "Small Blades"] =
    "Daggers, knives, stilettos, and other short edged weapons suited to close, quiet, or precise work.";

global.specialization_descriptions[$ "Small Bludgeons"] =
    "Cosh, sap, blackjack, and other compact striking tools meant to stun or strike from concealment.";

global.specialization_descriptions[$ "Bludgeons"] =
    "Clubs, cudgels, and similar one-handed impact weapons used for straightforward crushing blows.";

global.specialization_descriptions[$ "Bows"] =
    "Short bows and light archery used for ranged attack, ambush, and silent shooting.";
	
	
	////WEAPON SKILL////
	
	global.specialization_descriptions[$ "Small Blades"] =
    "Daggers, knives, and other short edged weapons for close fighting and precise cuts.";

global.specialization_descriptions[$ "Blades"] =
    "One-handed swords and similar edged weapons balanced for cut and thrust.";

global.specialization_descriptions[$ "Great Blades"] =
    "Two-handed swords and large edged weapons relying on reach, weight, and sweeping cuts.";

global.specialization_descriptions[$ "Hand Axes"] =
    "One-handed axes and hatchets used for chopping strikes in close combat.";

global.specialization_descriptions[$ "Axes"] =
    "Standard battle axes and similar chopping weapons with greater mass than hand axes.";

global.specialization_descriptions[$ "Great Axes"] =
    "Two-handed axes and greataxes built for heavy, committing cleaving blows.";

global.specialization_descriptions[$ "Small Bludgeons"] =
    "Light clubs, coshes, and compact impact weapons for quick or discreet strikes.";

global.specialization_descriptions[$ "Bludgeons"] =
    "One-handed maces, clubs, and hammers focused on crushing force.";

global.specialization_descriptions[$ "Great Bludgeons"] =
    "Two-handed mauls, great clubs, and heavy impact weapons for maximum blunt trauma.";

global.specialization_descriptions[$ "Bladed Polearms"] =
    "Long weapons with cutting heads, such as glaives and similar edged pole arms.";

global.specialization_descriptions[$ "Blunt Polearms"] =
    "Long weapons with crushing heads, such as maul-poles and blunt-headed pole arms.";

global.specialization_descriptions[$ "Axe Bladed Polearms"] =
    "Long weapons with axe-like heads, such as halberds and pole-axes.";

global.specialization_descriptions[$ "Tipped Polearms"] =
    "Long thrusting weapons with spear points, pikes, and similar tipped shafts.";

global.specialization_descriptions[$ "Tools"] =
    "Work tools used as weapons—hammers, picks, sickles, and similar implements.";

global.specialization_descriptions[$ "Improvised"] =
    "Makeshift weapons: chairs, bottles, stones, and other objects not made for combat.";

global.specialization_descriptions[$ "Unarmed"] =
    "Fists, feet, grappling, and striking without a held weapon.";

global.specialization_descriptions[$ "Bows"] =
    "Drawn bows of all sizes used for archery and ranged volleys.";

global.specialization_descriptions[$ "Crossbows"] =
    "Mechanical bow-arms spanning a stock; aimed bolts with deliberate reload.";

global.specialization_descriptions[$ "Thrown"] =
    "Weapons and objects hurled by hand—knives, axes, javelins, and similar missiles.";

global.specialization_descriptions[$ "Whips"] =
    "Flexible lash weapons used to strike, entangle, or control at short reach.";

global.specialization_descriptions[$ "Flails"] =
    "Hafted weapons with a striking head on a chain or hinge for wrapping and unpredictable arcs.";
	
	
	///SURVIVAL///
	
	
	global.specialization_descriptions[$ "Forest"] =
    "Woodlands and temperate tree cover: shelter, forage, game trails, and moving without getting lost under canopy.";

global.specialization_descriptions[$ "Jungle"] =
    "Dense tropical growth: heat, humidity, dense undergrowth, insect hazards, and finding paths and dry ground.";

global.specialization_descriptions[$ "Grassland"] =
    "Plains, savanna, and open steppe: weather exposure, long sight lines, grazing game, and scarce cover.";

global.specialization_descriptions[$ "Desert"] =
    "Arid sands and badlands: water discipline, heat and cold swings, sparse forage, and navigating featureless ground.";

global.specialization_descriptions[$ "Mountain"] =
    "High peaks, ridges, and alpine slopes: thin air, cold, unstable footing, and route-finding on steep terrain.";

global.specialization_descriptions[$ "Arctic"] =
    "Tundra, ice, and deep winter cold: insulation, frostbite risk, scarce fuel, and travel over snow and ice.";

global.specialization_descriptions[$ "Wetland"] =
    "Marshes, swamps, and bogs: soft ground, contaminated water, biting insects, and safe paths through mire.";

global.specialization_descriptions[$ "Coastal"] =
    "Shores, cliffs, and tidal zones: tides, salt spray, shoreline forage, and weather off the open water.";

global.specialization_descriptions[$ "Ocean"] =
    "Open sea and long voyages: weather, currents, rationing, and staying alive far from land.";

global.specialization_descriptions[$ "Underground"] =
    "Caves, tunnels, and deep dark: light, air, orientation, and hazards of stone and confined spaces.";

global.specialization_descriptions[$ "Urban"] =
    "Cities and towns: finding shelter, food, and safety among streets, crowds, and built structures.";

global.specialization_descriptions[$ "Wasteland"] =
    "Ruined, blighted, or barren lands: scarce resources, toxic or broken ground, and surviving where little lives.";
	
	
	///LANGUAGES///
	
	global.specialization_descriptions[$ "Common"] =
    "The widespread human trade language: used across most settled regions for everyday speech, commerce, and travel.";

global.specialization_descriptions[$ "Holf-Skull Sign"] =
    "The sign language of Hoof-Skull humans: developed among people subjected to Minos slavery and used for communication when speech is restricted or unsafe.";

global.specialization_descriptions[$ "Gnomish"] =
    "The language of gnomes: commonly spoken throughout Goldvale and its engineering-focused communities.";

global.specialization_descriptions[$ "Duren"] =
    "The language of dwarves: a sturdy and precise tongue used throughout Duren communities and dwarven settlements.";

global.specialization_descriptions[$ "Galish"] =
    "The language of elves: an elegant and expressive tongue spoken throughout Galish communities.";

global.specialization_descriptions[$ "Orcish"] =
    "The language of orcs: a direct and forceful tongue used among orcish communities and clans.";

global.specialization_descriptions[$ "Goblin"] =
    "The language of goblins: a rough and adaptable tongue spoken among goblin communities, particularly throughout the Ash Wastes.";

global.specialization_descriptions[$ "Gnoll"] =
    "The language of gnolls: a harsh tongue used among gnoll packs and communities.";

global.specialization_descriptions[$ "Minos"] =
    "The language of minotaurs: spoken throughout Minos communities and used as the primary language of Minotaur society.";

global.specialization_descriptions[$ "Xiban"] =
    "The language of Xiba: spoken by the batfolk of Xiba and their communities.";

global.specialization_descriptions[$ "Skireen"] =
    "The language of Skireen: spoken by the birdfolk of Skireen and their communities.";

global.specialization_descriptions[$ "Votalli"] =
    "The language of the Votalli: spoken by the crocodile-like Votalli people and their communities.";
	
	global.specialization_descriptions[$ "Arcane"] =
    "The language of magic: a precise and structured tongue used by spellcasters, scholars, and practitioners of arcane arts.";

global.specialization_descriptions[$ "Daemonic"] =
    "The language of daemons: an unnatural tongue used by daemons and those who study or communicate with them.";

global.specialization_descriptions[$ "Draconic"] =
    "The ancient language of dragons: a powerful and enduring tongue preserved through draconic tradition and lore.";
	
	
	////MUSIC THEORY///
	
	global.specialization_descriptions[$ "Holdstadtish Musical Theory"] =
    "The formal musical traditions of Holdstadt: structured composition, military music, ceremonial performance, and disciplined musical training.";

global.specialization_descriptions[$ "Corintish Musical Theory"] =
    "The scholarly musical traditions of Corint: refined composition, academic study, notation, and the theoretical analysis of music.";

global.specialization_descriptions[$ "Flotsam Musical Theory"] =
    "The eclectic musical traditions of Flotsam: songs and techniques gathered from sailors, travelers, merchants, and cultures encountered across the seas.";

global.specialization_descriptions[$ "Goblin Musical Theory"] =
    "The musical traditions of goblins: rhythmic, energetic music shaped by oral tradition, communal performance, and the harsh life of the Ash Wastes.";

global.specialization_descriptions[$ "Orcish Musical Theory"] =
    "The musical traditions of orcs: powerful rhythms, chants, and songs rooted in communal identity, storytelling, and martial tradition.";

global.specialization_descriptions[$ "Gnollish Musical Theory"] =
    "The musical traditions of gnolls: vocal and rhythmic traditions centered on storytelling, communal expression, and the shared experiences of the pack.";

global.specialization_descriptions[$ "Galish Musical Theory"] =
    "The musical traditions of elves: intricate melodies, careful harmonies, and long-standing traditions emphasizing beauty, expression, and refinement.";

global.specialization_descriptions[$ "Eastern Musical Theory"] =
    "The musical traditions of the eastern cultures: distinctive systems of rhythm, melody, instruments, and composition developed outside the western musical traditions.";
	
	
	
	///ARCANE ASPECTS///
	
	global.specialization_descriptions[$ "Temperature"] =
    "The manipulation of heat and cold: raising or lowering the temperature of objects, creatures, and surrounding areas.";

global.specialization_descriptions[$ "Force"] =
    "The manipulation of physical force: pushing, pulling, striking, restraining, or otherwise altering the motion of matter.";

global.specialization_descriptions[$ "Charge"] =
    "The manipulation of electrical charge: generating, storing, directing, or altering the flow of electrical energy.";

global.specialization_descriptions[$ "Present"] =
    "The manipulation of the present moment: altering events, conditions, or processes as they occur in the immediate now.";

global.specialization_descriptions[$ "Past"] =
    "The manipulation of the past: interacting with events, conditions, or information that have already occurred.";

global.specialization_descriptions[$ "Future"] =
    "The manipulation of the future: influencing potential events, outcomes, or conditions that have yet to occur.";

global.specialization_descriptions[$ "Position"] =
    "The manipulation of location: altering the position of objects or creatures within space without necessarily changing their size or mass.";

global.specialization_descriptions[$ "Mass"] =
    "The manipulation of mass: increasing, decreasing, or otherwise altering the amount of matter contained within a physical form.";

global.specialization_descriptions[$ "Volume"] =
    "The manipulation of volume: expanding, compressing, or otherwise altering the amount of space occupied by matter.";

global.specialization_descriptions[$ "Physical"] =
    "The manipulation of the physical aspect of a being: affecting the body, material form, and other tangible properties.";

global.specialization_descriptions[$ "Mental"] =
    "The manipulation of the mental aspect of a being: affecting thought, memory, perception, and other processes of the mind.";

global.specialization_descriptions[$ "Spiritual"] =
    "The manipulation of the spiritual aspect of a being: affecting the soul, spiritual presence, and other intangible aspects of existence.";
	
	
	///MARTIAL ACTION///
	
	global.specialization_descriptions[$ "Push"] =
    "Training in shoving: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Push attacks.";

global.specialization_descriptions[$ "Grapple"] =
    "Training in grabbing and holding: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Grapple attacks.";

global.specialization_descriptions[$ "Disarm"] =
    "Training in forcing a target to drop what they hold: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Disarm attacks.";

global.specialization_descriptions[$ "Trip"] =
    "Training in knocking a target off balance: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Trip attacks.";

global.specialization_descriptions[$ "Throw"] =
    "Training in tossing a target: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Throw attacks.";

global.specialization_descriptions[$ "Sunder"] =
    "Training in smashing armor and weapons: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Sunder attacks.";

global.specialization_descriptions[$ "Cleave"] =
    "Training in striking through one target into another: Rank 0 removes the untrained penalty and allows use against armed opponents without attacks of opportunity. Each rank grants +1 to Cleave attacks.";
	
	
	global.specialization_descriptions[$ "Lucid Rage"] =
    "Maintain awareness while enraged: retain the ability to recognize allies, understand your surroundings, and make deliberate tactical decisions while raging.";

global.specialization_descriptions[$ "Feel No Pain"] =
    "Ignore the distracting effects of pain while raging, allowing you to continue fighting despite wounds that would normally impair your actions.";

global.specialization_descriptions[$ "Raging Power"] =
    "Channel greater physical power through your rage, increasing the effectiveness of your brute-force attacks while enraged.";

global.specialization_descriptions[$ "Indefatigable"] =
    "Draw upon your rage to overcome exhaustion, allowing you to continue fighting through physical strain that would normally slow or weaken you.";

global.specialization_descriptions[$ "Wild Rage"] =
    "Give yourself over to uncontrolled fury, making your attacks more aggressive and unpredictable while sacrificing some control over your actions.";

global.specialization_descriptions[$ "Berserker"] =
    "Embrace the most extreme form of rage, turning yourself into a relentless combatant who becomes increasingly difficult to stop once the battle begins.";
	
	
	global.bardic_intents =
{
    "Holdstadtish Musical Theory":
    [
        "Inspiration",
        "Harmony",
        "Exaltation",
        "Dread"
    ],

    "Corintish Musical Theory":
    [
        "Cacophony",
        "Resonance",
        "Confusion",
        "Inspiration"
    ],

    "Flotsam Musical Theory":
    [
        "Inspiration",
        "Vigor",
        "Fury",
        "Harmony"
    ],

    "Goblin Musical Theory":
    [
        "Fury",
        "Cacophony",
        "Dread",
        "Exaltation"
    ],

    "Orcish Musical Theory":
    [
        "Fury",
        "Cacophony",
        "Dread",
        "Exaltation"
    ],

    "Gnollish Musical Theory":
    [
        "Awe",
        "Dread",
        "Exaltation",
        "Inspiration"
    ],

    "Elven Musical Theory":
    [
        "Harmony",
        "Calm",
        "Tranquility",
        "Vigor"
    ],

    "Eastern Musical Theory":
    [
        "Harmony",
        "Joy",
        "Calm",
        "Inspiration"
    ]
};
	
	
}