function get_skill_check_value(cc, skill_key)
{
    // Try to find the skill data
    var base_key = skill_key;
    if (string_pos(" (", skill_key) > 0)
    {
        var parts = string_split(skill_key, " (");
        base_key = parts[0] + " (X)";
    }
    
    if (!variable_global_exists("skill_data") || !variable_struct_exists(global.skill_data, base_key))
        return "—";
    
    var skill = global.skill_data[$ base_key];
    var rank = get_skill_rank(cc, skill_key);
    var trained = skill_is_trained(cc, skill_key);
    
    // Handle "all" mode simply for the sheet (show best or first)
    if (variable_struct_exists(skill, "check") && skill.check.mode == "all")
    {
        var checks = get_skill_check_nodes(skill, cc);
        if (array_length(checks) == 0) return "—";
        
        var best = -999;
        for (var i = 0; i < array_length(checks); i++)
        {
            var node = checks[i];
            var attr = variable_struct_exists(node, "attribute") ? node.attribute : "Strength";
            var mod_val = variable_struct_exists(node, "modifier") ? node.modifier : 0;
            var val = get_final_attribute(cc, attr) + mod_val + (trained ? rank : 0);
            if (val > best) best = val;
        }
        return string(best);
    }
    
    // Normal single-check skills
    var info = get_skill_check_result(cc, skill);
    var total = variable_struct_exists(info, "total") ? info.total : 0;
    
    if (trained)
    {
        total += rank;
    }
    else
    {
        if (variable_struct_exists(skill, "difficulty"))
        {
            if (skill.difficulty == SKILL_DIFFICULTY.ADVANCED)
                return "Unt";
            // Simple / Intermediate get -4
            total -= 4;
        }
    }
    
    return string(total);
}




function get_all_characteristics(cc)
{
    var result = {};
    
    // ===== STRENGTH =====
    var str = get_final_attribute(cc, "Strength");
    var car = 0;
    var dmg_str = 0;
    
    if (str >= 10) dmg_str = floor((str - 10) / 2);
    else           dmg_str = ceil((str - 10) / 2);
    if (str <= 0)  dmg_str = 0;
    
    var size = "medium";
    if (variable_global_exists("get_size_category"))
        size = get_size_category(cc);
    else if (variable_struct_exists(cc, "size"))
        size = string_lower(string(cc.size));
    
    switch (size) {
        case "tiny":   car = 20 + ((str - 10) * 5);  break;
        case "small":  car = 30 + ((str - 10) * 10); break;
        case "large":  car = 60 + ((str - 10) * 30); break;
        case "huge":   car = 80 + ((str - 10) * 40); break;
        default:       car = 40 + ((str - 10) * 20);
    }
    car = max(0, floor(car));
    
    result.carry_weight     = car;
    result.str_damage_bonus = dmg_str;
    
    // ===== DEXTERITY =====
    var dex = get_final_attribute(cc, "Dexterity");
    var atk = 0, move = 0, dmg_dex = 0;
    
    if (dex >= 10) {
        atk     = dex;
        move    = floor(30 + ((dex - 10) * 5));
        dmg_dex = floor((dex - 10) / 3);
    } else {
        atk     = dex;
        move    = ceil(30 + (ceil((dex - 10) / 2) * 5));
        dmg_dex = ceil((dex - 10) / 2);
    }
    if (dex <= 0) { atk = 0; move = 0; dmg_dex = 0; }
    
    result.base_attack      = atk;
    result.move_speed       = move;
    result.dex_damage_bonus = dmg_dex;
    
    // ===== ENDURANCE =====
    var endu = get_final_attribute(cc, "Endurance");
    var fat = 0, rec = 0;
    
    if (endu >= 10) {
        fat = 5 + floor((endu - 10) / 2);
        rec = 3 + floor((endu - 10) / 3);
    } else {
        fat = 5 - floor((10 - endu) / 2);
        rec = 3 - floor((10 - endu) / 4);
    }
    if (endu <= 0) { fat = 0; rec = 0; }
    
    result.fatigue_limit    = fat;
    result.fatigue_recovery = rec;
    
    // ===== REFLEXES =====
    var ref = get_final_attribute(cc, "Reflexes");
    var init = 0, def = 0;
    
    if (ref >= 10) {
        init = ref + (ref - 10);
        def  = ref;
    } else {
        init = ref - (10 - ref);
        def  = ref;
    }
    if (ref <= 0) { init = 0; def = 0; }
    
    result.initiative   = init;
    result.base_defense = def;
    
    // ===== INTELLIGENCE =====
    var intel = get_final_attribute(cc, "Intelligence");
    var slots = 0, logi = 0;
    
    if (intel >= 10) {
        slots = 20 + (intel - 10);
        logi  = intel + (intel - 10);
    } else {
        slots = 20 + ceil((intel - 10) / 2);
        logi  = ceil(intel + (intel - 10));
    }
    if (intel <= 0) { slots = 0; logi = 0; }
    
    result.character_points = slots;
    result.logic_test       = logi;
    
    // ===== PERCEPTION =====
    var per = get_final_attribute(cc, "Perception");
    var pass = 0, act = 0;
    
    if (per >= 10) {
        pass = per - 10;
        act  = (per - 10) + per;
    } else {
        pass = per - 10;
        act  = per;
    }
    if (per <= 0) { pass = 0; act = 0; }
    
    result.passive_perception = pass;
    result.active_perception  = act;
    
    // ===== WILLPOWER =====
    var wil = get_final_attribute(cc, "Willpower");
    var con = 0, psy = 0;
    
    if (wil >= 10) {
        con = floor(((wil - 10) / 2) + wil);
        psy = floor((wil - 10) / 3);
    } else {
        con = floor((1 + (wil - 10) / 2) + wil);
        psy = floor(1 + (wil - 10) / 3);
    }
    if (wil <= 0) { con = 0; psy = 0; }
    
    result.consciousness_save = con;
    result.psychic_dr         = psy;
    
    // ===== CHARM =====
    var cha = get_final_attribute(cc, "Charm");
    var pers = 0, app = 0;
    
    if (cha >= 10) {
        pers = floor(((cha - 10) / 2) + cha);
        app  = cha - 10;
    } else {
        pers = floor(((cha - 10) / 2) + cha);
        app  = cha - 10;
    }
    if (cha <= 0) { pers = 0; app = 0; }
    
    result.persuasion = pers;
    result.appeal     = app;
    
    // ===== LEADERSHIP =====
    var lea = get_final_attribute(cc, "Leadership");
    var com = 0, fol = 0;
    
    if (lea >= 10) {
        com = floor(((lea - 10) / 2) + lea);
        fol = 2 + (lea - 10);
    } else {
        com = ceil((1 + (lea - 10) / 2) + lea);
        fol = ceil(2 + (1 + (lea - 10) / 4));
    }
    if (lea <= 0) { com = 0; fol = 0; }
    
    result.command        = com;
    result.follower_limit = fol;
    
    // ===== TOUGHNESS =====
    var tou = get_final_attribute(cc, "Toughness");
    var cdt = 0, heal = 0;
    
    if (tou >= 10) {
        cdt  = floor((tou - 10) / 2);
        heal = 2 + floor((tou - 10) / 4);
    } else {
        cdt  = ceil((tou - 10) / 2);
        heal = 2 + ceil((tou - 10) / 4);
    }
    if (tou <= 0) { cdt = 0; heal = 0; }
    
    result.cdt_bonus         = cdt;
    result.natural_heal_rate = heal;
    
    return result;
}








function equipment_find_item_by_id(item_id)
{
    if (!variable_global_exists("equipment_data")) return undefined;
    
    var cats = variable_struct_get_names(global.equipment_data.weapons);
    for (var c = 0; c < array_length(cats); c++)
    {
        var cat = cats[c];
        var subcats = variable_struct_get_names(global.equipment_data.weapons[$ cat]);
        for (var s = 0; s < array_length(subcats); s++)
        {
            var items = global.equipment_data.weapons[$ cat][$ subcats[s]];
            for (var i = 0; i < array_length(items); i++)
            {
                if (items[i].id == item_id)
                    return items[i];
            }
        }
    }
    return undefined;
}




function get_cdt_thresholds(cc)
{
    // Final Critical threshold (already calculated during generation)
    var critical = 0;
    
    // Prefer the value stored from generation
    if (variable_struct_exists(cc, "generation") && variable_struct_exists(cc.generation, "cdt_bonus"))
    {
        // Use the full current CDT if you have a helper, otherwise reconstruct
        if (variable_global_exists("get_current_cdt"))
            critical = get_current_cdt(cc);
        else
            critical = cc.generation.cdt_bonus; // fallback
    }
    else if (variable_global_exists("get_current_cdt"))
    {
        critical = get_current_cdt(cc);
    }
    
    // Toughness CDT bonus (the extra from the Toughness attribute)
    var tou_bonus = 0;
    var ch = get_all_characteristics(cc);
    if (variable_struct_exists(ch, "cdt_bonus"))
        tou_bonus = ch.cdt_bonus;
    
    // Thresholds
    var minor    = 0 + tou_bonus;
	if (minor <= 0)
	{
		minor = string("-");
	}
    var light    = 1 + tou_bonus;
	if (light <= 0)
	{
	
		light = 0;
		
	}
    
    var step = floor((critical - light) / 3);
    
    var moderate = light + step;
    var serious  = moderate + step;
    var fatal    = critical * 2;
    
    return {
        minor:    minor,
        light:    light,
        moderate: moderate,
        serious:  serious,
        critical: critical,
        fatal:    fatal
    };
}