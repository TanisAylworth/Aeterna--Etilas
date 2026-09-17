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
        "Training focused on single combat against an armed opponent, emphasizing timing, defense, and precision.";

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
}