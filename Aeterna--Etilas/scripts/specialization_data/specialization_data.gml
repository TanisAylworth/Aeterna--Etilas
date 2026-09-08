function initialize_specialization_descriptions()
{
    global.specialization_descriptions = {};

    // =========================================
    // WEAPON SPECIALIZATIONS
    // =========================================

    global.specialization_descriptions[$ "Martial Arts"] =
        "A style which utilizes controlled motions of the body to inflict damage with the natural weapons of the body.\n\n"+
		"Stances: At the start of the combat round the user may switch stance as a Free Action, but can do so no more than once per round.\n\n"+
		"-  Attack Stance: In this stance the user is poised to spring forward and strike. Gains a free Simple Action move once per combat round. Can make an additional strike at a -2 penalty to include their usual off hand strike.\n"+
		"-  Defensive Stance: In this stance the user is more focused on parrying and checking incoming attacks rather than striking. While in this stance the user may make two Defensive Actions without taking the Full Defense Action. If the Full Defense Action is taken in this stance they may make two Dodge and two Parry actions that round.\n\n"+
		"Strikes: As a replacement to one of their attack actions they may use a strike from the following list.\n\n"+
		"-  Kick: Grants the attack Reach (5), Cleave (1), and increases the damage die of the attack by 1 step. If the user made a Charge Action and used this strike the attack may be converted into a Flying Kick. In this case the user counts this as an All In strike, and is considered to be performing a Flying Charge.\n"+
		"-  Elbows and Knees: The user does not suffer the penalties for close quarters combat. Additionally their attacks increase their damage by 2 dice steps. They also gain Sunder (1), and Grapple (1). If the user initiates or uses their Grapple Action to harm they may replace the normal attack with one of these strikes instead.";

    global.specialization_descriptions[$ "Grappling"] =
        "Training focused on holds, throws, takedowns, and controlling an opponent through physical leverage.";

    global.specialization_descriptions[$ "Brawling"] =
        "Practical unarmed fighting emphasizing powerful strikes, dirty tactics, and fighting without formal technique.";

    global.specialization_descriptions[$ "Knife Fighting"] =
        "Training in the use of knives and other small blades in close combat.";

    global.specialization_descriptions[$ "Sword Play"] =
        "Training in the use of swords, emphasizing controlled attacks, footwork, and effective blade technique.";

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