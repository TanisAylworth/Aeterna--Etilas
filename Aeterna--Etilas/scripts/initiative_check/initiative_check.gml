function combat_calc_initiative(reflex_score)
{
    // Reflex 10 → +0; 14 → +4; 7 → -3
    return reflex_score + (reflex_score - 10);
    // same as: 2 * reflex_score - 10
}




function combat_roll_initiative(combatant)
{
    // Your stated scaling: +1 per point over 10, -1 under 10, on top of Reflex
    return reflex + (reflex - 10);
    // If you need ~25-ish TNs with d20, use e.g.:
    // return 15 + (reflex - 10);
}

function combat_roll_initiative_margin(combatant)
{
    var tn = 10;
    
    if (is_struct(combatant) && variable_struct_exists(combatant, "initiative_tn"))
        tn = combatant.initiative_tn;
    else
        tn = combat_calc_initiative_tn(combat_get_reflex_from_combatant(combatant));
    
    var roll = irandom_range(1, 20);
    var _score = tn - roll;
    
    // Always return a plain struct with these three fields
    var result = {};
    result.tn = tn;
    result.roll = roll;
    result.score = _score;
    return result;
}

function combat_get_reflex(combatant)
{
    if (variable_struct_exists(combatant, "reflex"))
        return combatant.reflex;
    if (variable_struct_exists(combatant, "attributes"))
    {
        if (variable_struct_exists(combatant.attributes, "Reflexes"))
            return combatant.attributes.Reflexes;
        if (variable_struct_exists(combatant.attributes, "Reflex"))
            return combatant.attributes.Reflex;
    }
    return 10;
}

function combat_calc_initiative_tn(reflex)
{
    return reflex + (reflex - 10);
}

function combat_get_reflex_from_combatant(combatant)
{
    if (!is_struct(combatant))
        return 10;
    
    if (variable_struct_exists(combatant, "reflex"))
        return combatant.reflex;
    
    if (variable_struct_exists(combatant, "attributes"))
    {
        var a = combatant.attributes;
        if (variable_struct_exists(a, "Reflexes")) return a.Reflexes;
        if (variable_struct_exists(a, "reflexes")) return a.reflexes;
    }
    
    return 10;
}

function combat_test_roll_initiatives()
{
    var pc = global.test_pc;
    var en = global.test_enemy;
    
    var pc_tn = variable_struct_exists(pc, "initiative_tn")
        ? pc.initiative_tn
        : combat_calc_initiative_tn(combat_get_reflex(pc));
    
    var en_tn = variable_struct_exists(en, "initiative_tn")
        ? en.initiative_tn
        : combat_calc_initiative_tn(combat_get_reflex(en));
    
    // Roll-under: higher DoS (TN - d20) goes first; tie → player
    var pc_roll = irandom_range(1, 20);
    var en_roll = irandom_range(1, 20);
    var pc_dos = pc_tn - pc_roll;
    var en_dos = en_tn - en_roll;
    
    array_push(global.combat_log,
        "Init PC: TN " + string(pc_tn) + " d20 " + string(pc_roll) + " DoS " + string(pc_dos));
    array_push(global.combat_log,
        "Init EN: TN " + string(en_tn) + " d20 " + string(en_roll) + " DoS " + string(en_dos));
    
    if (en_dos > pc_dos)
        global.combat_first = "enemy";
    else
        global.combat_first = "player";
    
    global.combat_second = (global.combat_first == "player") ? "enemy" : "player";
    global.combat_actor = global.combat_first;
    
    array_push(global.combat_log, "First: " + global.combat_first);
}