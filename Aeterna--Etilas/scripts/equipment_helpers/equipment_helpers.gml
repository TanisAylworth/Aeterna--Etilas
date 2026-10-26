function equipment_layout(L)
{
    var col_w = 320;
    var gap = 24;
    var cx = L.center_x;

    return {
        weapons_x: cx - col_w - gap,
        armor_x:   cx,
        gear_x:    cx + col_w + gap,
        col_w:     col_w,
        panel_y:   300,
        panel_h:   520
    };
}

function handle_equipment_column(cc, x, column_id, lay, mx, my, clicked, right_clicked)
{
    var panel_w = lay.col_w;
    var panel_x = x - panel_w * 0.5;
    var panel_y = lay.panel_y;
    var btn_w   = panel_w - 24;
    var btn_x   = panel_x + 12;
    
    var is_weapons = (column_id == "weapons");
    var has_sub    = (cc.equipment.selected_column == column_id && cc.equipment.selected_category != "");
    var showing_items = false;
    
    if (is_weapons)
        showing_items = (has_sub && cc.equipment.selected_subcategory != "");
    else
        showing_items = has_sub;
    
    // =====================================================
    // LEVEL 3: Items
    // =====================================================
    if (showing_items)
    {
        // Click header → go back one level
        if (clicked && point_in_rectangle(mx, my, panel_x, panel_y, panel_x + panel_w, panel_y + 48))
        {
            if (is_weapons)
                cc.equipment.selected_subcategory = "";
            else
            {
                cc.equipment.selected_category = "";
                cc.equipment.selected_column   = "";
            }
            return;
        }
        
        var items = get_equipment_items(column_id, cc.equipment.selected_category, 
                                        is_weapons ? cc.equipment.selected_subcategory : "");
        var row_h  = 28;
        var start_y = panel_y + 78;
        
        for (var i = 0; i < array_length(items); i++)
        {
            var item = items[i];
            var by   = start_y + i * (row_h + 4);
            
            if (!point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h))
                continue;
            
            if (clicked)
{
    // Buy
    var cost = equipment_cost_total_gold(item);
    
    if (cc.equipment.gold >= cost)
    {
        cc.equipment.gold -= cost;
        
        if (!variable_struct_exists(cc.equipment.owned, item.id))
            cc.equipment.owned[$ item.id] = 0;
        cc.equipment.owned[$ item.id]++;
        
        var snd = audio_play_sound(scribble, 0.5, false);
        audio_sound_pitch(snd, random_range(0.90, 1.10));
    }
    else
    {
        audio_play_sound(error_snd, 0.5, false);
    }
}
else if (right_clicked)
{
    // Sell one
    if (variable_struct_exists(cc.equipment.owned, item.id)
        && cc.equipment.owned[$ item.id] > 0)
    {
        var cost = equipment_cost_total_gold(item);
        
        cc.equipment.owned[$ item.id]--;
        cc.equipment.gold += cost;
        
        if (cc.equipment.owned[$ item.id] <= 0)
            variable_struct_remove(cc.equipment.owned, item.id);
            
        var snd = audio_play_sound(scribble, 0.5, false);
        audio_sound_pitch(snd, random_range(0.90, 1.10));
    }
}
            return;
        }
        return;
    }
    
    // =====================================================
    // LEVEL 2: Subcategories (Weapons only)
    // =====================================================
    if (is_weapons && has_sub)
    {
        // Click header → back to main categories
        if (clicked && point_in_rectangle(mx, my, panel_x, panel_y, panel_x + panel_w, panel_y + 48))
        {
            cc.equipment.selected_category = "";
            cc.equipment.selected_column   = "";
            cc.equipment.selected_subcategory = "";
            return;
        }
        
        var subs = get_equipment_subcategories(column_id, cc.equipment.selected_category);
        var row_h  = 30;
        var start_y = panel_y + 78;
        
        for (var i = 0; i < array_length(subs); i++)
        {
            var sub = subs[i];
            var by  = start_y + i * (row_h + 6);
            
            if (!point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h))
                continue;
            
            if (clicked)
            {
                cc.equipment.selected_subcategory = sub;
                
                var snd = audio_play_sound(page_turn, 0.5, false);
                audio_sound_pitch(snd, random_range(0.90, 1.10));
            }
            return;
        }
        return;
    }
    
    // =====================================================
    // LEVEL 1: Main categories
    // =====================================================
    var cats = get_equipment_categories(column_id);
    var row_h  = 30;
    var start_y = panel_y + 78;
    
    for (var i = 0; i < array_length(cats); i++)
    {
        var cat = cats[i];
        var by  = start_y + i * (row_h + 6);
        
        if (!point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h))
            continue;
        
        if (clicked)
        {
            cc.equipment.selected_column     = column_id;
            cc.equipment.selected_category   = cat;
            cc.equipment.selected_subcategory = "";   // clear any previous sub
            
            var snd = audio_play_sound(page_turn, 0.5, false);
            audio_sound_pitch(snd, random_range(0.90, 1.10));
        }
        return;
    }
}






function draw_equipment_column(cc, x, column_id, title, lay)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var panel_w = lay.col_w;
    var panel_x = x - panel_w * 0.5;
    var panel_y = lay.panel_y;
    var panel_h = lay.panel_h;
    
    // Outer panel
    draw_set_color(make_color_rgb(18, 18, 18));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_color(c_gray);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
    
    // Header
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x, panel_y + 12, title);
    
    var is_weapons = (column_id == "weapons");
    var has_sub    = (cc.equipment.selected_column == column_id && cc.equipment.selected_category != "");
    var showing_items = false;
    
    if (is_weapons)
        showing_items = (has_sub && cc.equipment.selected_subcategory != "");
    else
        showing_items = has_sub;
    
    // =====================================================
    // LEVEL 3: Items
    // =====================================================
    if (showing_items)
    {
        draw_set_color(c_aqua);
        var header_txt = is_weapons 
            ? "< " + cc.equipment.selected_subcategory 
            : "< " + cc.equipment.selected_category;
			    // Clear hover each frame so tooltip does not stick
    cc.equipment.hovered_item = "";
    cc.equipment.hovered_skill_key = "";
        draw_text(x, panel_y + 36, header_txt);
        draw_set_halign(fa_left);
        
        var items = get_equipment_items(column_id, cc.equipment.selected_category, 
                                        is_weapons ? cc.equipment.selected_subcategory : "");
        var row_h  = 28;
        var start_y = panel_y + 78;
        var btn_w  = panel_w - 24;
        var btn_x  = panel_x + 12;
        
        for (var i = 0; i < array_length(items); i++)
        {
            var item = items[i];
            var by   = start_y + i * (row_h + 4);
            var hovered = point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h);
            
                        if (hovered)
            {
                cc.equipment.hovered_item = item.id;
                cc.equipment.hovered_skill_key = equipment_weapon_skill_key(
                    cc.equipment.selected_category,
                    cc.equipment.selected_subcategory
                );
            }
            
            draw_set_color(hovered ? make_color_rgb(60, 55, 25) : make_color_rgb(28, 28, 28));
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, false);
            draw_set_color(hovered ? c_yellow : c_dkgray);
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, true);
            
            var qty = variable_struct_exists(cc.equipment.owned, item.id)
                ? cc.equipment.owned[$ item.id] : 0;
            
            draw_set_color(hovered ? c_yellow : c_white);
            draw_set_halign(fa_left);
            draw_text(btn_x + 8, by + 5, item.name);
            draw_set_halign(fa_right);
            draw_text(btn_x + btn_w - 8, by + 5,
				equipment_cost_string(item) + (qty > 0 ? "  x" + string(qty) : ""));
            draw_set_halign(fa_left);
        }
        return;
    }
    
    // =====================================================
    // LEVEL 2: Subcategories (Weapons only)
    // =====================================================
    if (is_weapons && has_sub)
    {
        draw_set_color(c_aqua);
        draw_text(x, panel_y + 36, "< " + cc.equipment.selected_category);
        draw_set_halign(fa_left);
        
        var subs = get_equipment_subcategories(column_id, cc.equipment.selected_category);
        var row_h  = 30;
        var start_y = panel_y + 78;
        var btn_w  = panel_w - 24;
        var btn_x  = panel_x + 12;
        
        for (var i = 0; i < array_length(subs); i++)
        {
            var sub = subs[i];
            var by  = start_y + i * (row_h + 6);
            var hovered = point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h);
            
            if (hovered)
                cc.equipment.hovered_category = column_id + ":" + cc.equipment.selected_category + ":" + sub;
            
            draw_set_color(hovered ? make_color_rgb(50, 50, 30) : make_color_rgb(30, 30, 30));
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, false);
            draw_set_color(hovered ? c_yellow : c_gray);
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, true);
            
            draw_set_color(hovered ? c_yellow : c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(btn_x + btn_w * 0.5, by + row_h * 0.5, sub + "  >");
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        return;
    }
    
    // =====================================================
    // LEVEL 1: Main categories
    // =====================================================
    draw_set_halign(fa_left);
    var cats = get_equipment_categories(column_id);
    var row_h  = 30;
    var start_y = panel_y + 78;
    var btn_w  = panel_w - 24;
    var btn_x  = panel_x + 12;
    
    for (var i = 0; i < array_length(cats); i++)
    {
        var cat = cats[i];
        var by  = start_y + i * (row_h + 6);
        var hovered = point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h);
        
        if (hovered)
            cc.equipment.hovered_category = column_id + ":" + cat;
        
        draw_set_color(hovered ? make_color_rgb(50, 50, 30) : make_color_rgb(30, 30, 30));
        draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, false);
        draw_set_color(hovered ? c_yellow : c_gray);
        draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, true);
        
        draw_set_color(hovered ? c_yellow : c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(btn_x + btn_w * 0.5, by + row_h * 0.5, cat + "  >");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}


function get_equipment_categories(column)
{
    if (column != "weapons") 
    {
        // keep your existing armor/gear lists
        switch (column)
        {
            case "armor": return ["Light", "Medium", "Heavy", "Helmets", "Shields"];
            case "gear":  return ["Adventuring", "Survival", "Clerical", "Arcane", "Herbalism", "Crafting", "Occult"];
        }
        return [];
    }
    
    // Weapons – clean top-level groups
    return [
        "Small Blades",
        "Straight Blades",
        "Curved Blades",
        "Axes",
        "Bludgeons",
        "Polearms",
        "Whips & Flails",
        "Tools & Improvised",
        "Ranged"
    ];
}

function get_equipment_subcategories(column, category)
{
    if (column != "weapons") return [];
    
    switch (category)
    {
        case "Small Blades":
            return ["Knives", "Daggers", "Curved Knives"];
            
        case "Straight Blades":
            return ["Short Swords", "Long Swords", "Fencing Swords", "Great Swords"];
            
        case "Curved Blades":
            return ["Curved Short Swords", "Curved Swords", "Great Curved Swords"];
            
        case "Axes":
            return ["Hand Axes", "Battle Axes", "Great Axes"];
            
        case "Bludgeons":
            return ["Small Bludgeons", "Medium Bludgeons", "Great Bludgeons"];
            
        case "Polearms":
            return ["Spears", "Bladed Polearms", "Hooked Polearms", "Great Polearms", "Short Polearms"];
            
        case "Whips & Flails":
            return ["Whips", "Flails"];
            
        case "Tools & Improvised":
            return ["Tools", "Improvised"];
            
        case "Ranged":
            return ["Bows", "Crossbows", "Thrown", "Steam Guns", "Siege Engines"];
            
        default:
            return [];
    }
}

function get_equipment_items(column, category, subcategory = "")
{
    if (column == "weapons")
    {
        if (!variable_struct_exists(global.equipment_data.weapons, category)) return [];
        var cat_data = global.equipment_data.weapons[$ category];
        
        if (subcategory == "" || !variable_struct_exists(cat_data, subcategory))
            return [];
            
        return cat_data[$ subcategory];   // already an array of weapon structs
    }
    
    // Armor / Gear stubs for now
    return [
        { id: category + "_sample_1", name: category + " Item A", cost: {gold:0, silver:25, copper:0}, damage:{dice:"—",min:0,max:0}, weight:0, integrity:10, traits:[], sprite:-1 },
        { id: category + "_sample_2", name: category + " Item B", cost: {gold:1, silver:0, copper:0}, damage:{dice:"—",min:0,max:0}, weight:1, integrity:15, traits:[], sprite:-1 }
    ];
}


function equipment_cost_total_copper(item)
{
    // 1 gold = 10 silver = 100 copper (adjust to your economy)
    return item.cost.gold * 100 + item.cost.silver * 10 + item.cost.copper;
}


function draw_equipment_preview(cc)
{
    // Simple centered preview box under the gold display
    var pw = 180;
    var ph = 140;
    var px = display_get_gui_width() * 0.5 - pw * 0.5;
    var py = 160;
    
    draw_set_color(make_color_rgb(18, 18, 18));
    draw_rectangle(px, py, px + pw, py + ph, false);
    draw_set_color(c_gray);
    draw_rectangle(px, py, px + pw, py + ph, true);
    
    draw_set_halign(fa_center);
    draw_set_color(c_ltgray);
    draw_text(px + pw * 0.5, py + 8, "PREVIEW");
    
    // Show sprite of currently hovered item (or last selected)
    var item = equipment_get_hovered_item(cc);
    if (item != undefined && item.sprite != -1)
    {
        var scale = min(2.5, (pw - 20) / sprite_get_width(item.sprite));
        draw_sprite_ext(item.sprite, 0, px + pw * 0.5, py + ph * 0.55, scale, scale, 0, c_white, 1);
    }
    else
    {
        draw_set_color(c_dkgray);
        draw_text(px + pw * 0.5, py + ph * 0.5, "(no item)");
    }
    draw_set_halign(fa_left);
}

function draw_equipment_tooltip(cc)
{
    var item = equipment_get_hovered_item(cc);
    if (item == undefined) return;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var skill_key = "";
    if (variable_struct_exists(cc.equipment, "hovered_skill_key"))
        skill_key = cc.equipment.hovered_skill_key;

    var text =
        string(item.name) + "\n\n"
        + "Cost: " + equipment_cost_string(item) + "\n"
        + equipment_attack_line(cc, skill_key) + "\n"
        + equipment_defense_line(cc, skill_key) + "\n"
        + equipment_damage_line(cc, item) + "\n"
        + "Weight Penalty: " + string(item.weight) + "\n"
        + "Integrity Value: " + string(item.integrity) + "\n\n"
        + equipment_traits_line(item);

    var pad = 12;
    var line_sep = 18;
    var tw = 320;
    var th = string_height_ext(text, line_sep, tw - pad * 2) + pad * 2;

    var tx = mx + 18;
    var ty = my + 18;
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    if (tx + tw > gw - 8) tx = mx - tw - 18;
    if (ty + th > gh - 8) ty = my - th - 18;
    if (tx < 8) tx = 8;
    if (ty < 8) ty = 8;

    draw_set_color(make_color_rgb(20, 20, 25));
    draw_rectangle(tx, ty, tx + tw, ty + th, false);
    draw_set_color(c_yellow);
    draw_rectangle(tx, ty, tx + tw, ty + th, true);

    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(tx + pad, ty + pad, text, line_sep, tw - pad * 2);
}

function equipment_get_hovered_item(cc)
{
    if (cc.equipment.hovered_item == "") return undefined;
    
    // Search all weapons for the id (you can optimize later with a flat lookup map)
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
                if (items[i].id == cc.equipment.hovered_item)
                    return items[i];
            }
        }
    }
    return undefined;
}







function equipment_weapon_skill_key(category, subcategory)
{
    // Prefer subcategory when it matches a Weapon Skill choice
    switch (subcategory)
    {
        case "Knives":
        case "Daggers":
        case "Curved Knives":
            return "Weapon Skill (Small Blades)";

        case "Short Swords":
        case "Fencing Swords":
        case "Curved Short Swords":
            return "Weapon Skill (Blades)";

        case "Long Swords":
        case "Curved Swords":
            return "Weapon Skill (Blades)";

        case "Great Swords":
        case "Great Curved Swords":
            return "Weapon Skill (Great Blades)";

        case "Hand Axes":
            return "Weapon Skill (Hand Axes)";

        case "Battle Axes":
            return "Weapon Skill (Axes)";

        case "Great Axes":
            return "Weapon Skill (Great Axes)";

        case "Small Bludgeons":
            return "Weapon Skill (Small Bludgeons)";

        case "Medium Bludgeons":
            return "Weapon Skill (Bludgeons)";

        case "Great Bludgeons":
            return "Weapon Skill (Great Bludgeons)";

        case "Spears":
        case "Short Polearms":
            return "Weapon Skill (Tipped Polearms)";

        case "Bladed Polearms":
            return "Weapon Skill (Bladed Polearms)";

        case "Hooked Polearms":
            return "Weapon Skill (Axe Bladed Polearms)";

        case "Great Polearms":
            return "Weapon Skill (Tipped Polearms)";

        case "Whips":
            return "Weapon Skill (Whips)";

        case "Flails":
            return "Weapon Skill (Flails)";

        case "Tools":
            return "Weapon Skill (Tools)";

        case "Improvised":
            return "Weapon Skill (Improvised)";

        case "Bows":
            return "Weapon Skill (Bows)";

        case "Crossbows":
            return "Weapon Skill (Crossbows)";

        case "Thrown":
            return "Weapon Skill (Thrown)";
    }

    // Fallbacks by top-level category
    switch (category)
    {
        case "Small Blades":   return "Weapon Skill (Small Blades)";
        case "Straight Blades": return "Weapon Skill (Blades)";
        case "Curved Blades":  return "Weapon Skill (Blades)";
        case "Axes":           return "Weapon Skill (Axes)";
        case "Bludgeons":      return "Weapon Skill (Bludgeons)";
        case "Polearms":       return "Weapon Skill (Tipped Polearms)";
        case "Whips & Flails": return "Weapon Skill (Whips)";
        case "Tools & Improvised": return "Weapon Skill (Tools)";
        case "Ranged":         return "Weapon Skill (Bows)";
    }

    return "";
}





function equipment_traits_line(item)
{
    if (!variable_struct_exists(item, "traits") || !is_array(item.traits)
        || array_length(item.traits) == 0)
        return "Traits: —";

    var t = "Traits:";
    for (var i = 0; i < array_length(item.traits); i++)
        t += "\n  • " + string(item.traits[i]);
    return t;
}


function equipment_get_attribute(cc, attr_name)
{
    // Prefer final assigned value from attribute step
    if (variable_struct_exists(cc, "assigned")
        && variable_struct_exists(cc.assigned, attr_name)
        && is_real(cc.assigned[$ attr_name]))
    {
        var v = cc.assigned[$ attr_name];

        // Optional species bonus map (if you store +1s there)
        if (variable_struct_exists(cc, "species_bonus_map")
            && variable_struct_exists(cc.species_bonus_map, attr_name)
            && is_real(cc.species_bonus_map[$ attr_name]))
        {
            v += cc.species_bonus_map[$ attr_name];
        }
        return v;
    }

    // Fallback if you store lowercase on the character later
    var lower = string_lower(attr_name);
    if (variable_struct_exists(cc, "attributes")
        && variable_struct_exists(cc.attributes, lower)
        && is_real(cc.attributes[$ lower]))
        return cc.attributes[$ lower];

    return 0;
}

function equipment_weapon_rank(cc, skill_key)
{
    if (skill_key == "") return -1;

    var rank = get_skill_rank(cc, skill_key);
    if (!is_real(rank)) return -1;

    // Treat "not owned" as untrained.
    // If your system uses rank 0 as first owned rank, keep this:
    //   owned if variable_struct_exists(cc.skill_ranks, skill_key)
    if (!variable_struct_exists(cc, "skill_ranks")
        || !variable_struct_exists(cc.skill_ranks, skill_key))
        return -1;

    return rank;
}

function equipment_attack_value(cc, skill_key)
{
    var dex = equipment_get_attribute(cc, "Dexterity");
    var rank = equipment_weapon_rank(cc, skill_key);

    if (rank < 0)
        return dex - 4;          // untrained

    return rank + dex;           // trained
}

function equipment_defense_value(cc, skill_key)
{
    var ref = equipment_get_attribute(cc, "Reflexes");
    var rank = equipment_weapon_rank(cc, skill_key);

    if (rank < 0)
        return ref - 4;          // untrained

    return rank + ref;           // trained
}

function equipment_attack_line(cc, skill_key)
{
    var val = equipment_attack_value(cc, skill_key);
    var rank = equipment_weapon_rank(cc, skill_key);

    if (rank < 0)
        return "Attack: " + string(val) + "  (Untrained: Dex - 4)";

    return "Attack: " + string(val) + "  (Rank " + string(rank) + " + Dex)";
}

function equipment_defense_line(cc, skill_key)
{
    var val = equipment_defense_value(cc, skill_key);
    var rank = equipment_weapon_rank(cc, skill_key);

    if (rank < 0)
        return "Defense: " + string(val) + "  (Untrained: Ref - 4)";

    return "Defense: " + string(val) + "  (Rank " + string(rank) + " + Ref)";
}


function equipment_cost_string(item)
{
    if (item == undefined) return "—";
    if (!variable_struct_exists(item, "cost") || !is_struct(item.cost))
        return "—";

    var g = variable_struct_exists(item.cost, "gold")   ? item.cost.gold   : 0;
    var s = variable_struct_exists(item.cost, "silver") ? item.cost.silver : 0;
    var c = variable_struct_exists(item.cost, "copper") ? item.cost.copper : 0;

    if (!is_real(g)) g = 0;
    if (!is_real(s)) s = 0;
    if (!is_real(c)) c = 0;

    var parts = [];
    if (g > 0) array_push(parts, string(g) + "G");
    if (s > 0) array_push(parts, string(s) + "S");
    if (c > 0) array_push(parts, string(c) + "C");

    if (array_length(parts) == 0) return "0C";

    // Avoid string_join if your runtime is older
    var out = parts[0];
    for (var i = 1; i < array_length(parts); i++)
        out += " " + parts[i];
    return out;
}

function equipment_cost_total_gold(item)
{
    if (item == undefined || !variable_struct_exists(item, "cost")) return 0;
    var g = variable_struct_exists(item.cost, "gold")   ? item.cost.gold   : 0;
    var s = variable_struct_exists(item.cost, "silver") ? item.cost.silver : 0;
    var c = variable_struct_exists(item.cost, "copper") ? item.cost.copper : 0;
    if (!is_real(g)) g = 0;
    if (!is_real(s)) s = 0;
    if (!is_real(c)) c = 0;
    // 1g = 10s = 100c
    return g + (s / 10) + (c / 100);
}


function damage_parse(dice_str)
{
    var result = { num: 0, sides: 0, bonus: 0, type: "", raw: "" };

    if (dice_str == undefined) return result;
    var s = string_trim(string(dice_str));
    result.raw = s;

    if (s == "" || s == "—" || s == "-" || string_lower(s) == "none")
        return result;

    // Pull trailing damage type: P, S, B, P/S, S/P, B/P, etc.
    var type = "";
    var core = s;
    var sp = string_pos(" ", s);
    if (sp > 0)
    {
        // Prefer last space-separated token if it looks like a type
        var last = string_trim(string_copy(s, sp + 1, string_length(s) - sp));
        var last_u = string_upper(last);
        if (string_length(last) <= 5
            && string_length(string_letters(string_replace_all(last_u, "/", ""))) == string_length(string_replace_all(last_u, "/", "")))
        {
            type = last_u;
            core = string_trim(string_copy(s, 1, sp - 1));
        }
    }

    // core like "1d6", "2d3", "1d4+1", "1d12+0"
    core = string_lower(core);
    var dpos = string_pos("d", core);
    if (dpos <= 0)
    {
        // Fallback: any NdN in the string
        // leave result zero → caller shows base raw
        return result;
    }

    var num_str = string_copy(core, 1, dpos - 1);
    var rest = string_copy(core, dpos + 1, string_length(core) - dpos);

    result.num = max(1, real(string_digits(num_str)));
    if (result.num <= 0) result.num = 1;

    var plus = string_pos("+", rest);
    var minus = string_pos("-", rest);

    if (plus > 0)
    {
        result.sides = max(1, real(string_digits(string_copy(rest, 1, plus - 1))));
        result.bonus = real(string_digits(string_copy(rest, plus + 1, string_length(rest) - plus)));
    }
    else if (minus > 0)
    {
        result.sides = max(1, real(string_digits(string_copy(rest, 1, minus - 1))));
        result.bonus = -real(string_digits(string_copy(rest, minus + 1, string_length(rest) - minus)));
    }
    else
    {
        result.sides = max(1, real(string_digits(rest)));
        result.bonus = 0;
    }

    result.type = type;
    return result;
}

function damage_format_dice(num, sides, bonus, type)
{
    var t = string(num) + "d" + string(sides);
    if (bonus > 0) t += "+" + string(bonus);
    else if (bonus < 0) t += string(bonus);
    if (type != "") t += " " + type;
    return string_trim(t);
}

// Simple die-step ladder (tweak to match your rules)
function damage_die_ladder()
{
    // Index 0 = lowest
    return [
        "0d0",
        "1/4d4",
        "1/2d4",
        "3/4d4",
        "1d2",
        "1d3",
        "1d4",
        "2d2",
        "1d6",
        "2d3",
        "1d8",
        "2d4",
        "1d10",
        "1d12",
        "2d6",
        "3d4",
        "4d4",
        "2d8",
        "3d6",
        "1d20",
        "2d10",
        "2d12",
        "3d8",
        "4d6"
    ];
}

function damage_die_key(num, sides, frac)
{
    // frac: 0 = normal, 1 = 1/4, 2 = 1/2, 3 = 3/4
    if (frac == 1) return "1/4d4";
    if (frac == 2) return "1/2d4";
    if (frac == 3) return "3/4d4";
    if (num <= 0 || sides <= 0) return "0d0";
    return string(num) + "d" + string(sides);
}

function damage_die_index_from_parts(num, sides, frac)
{
    var key = damage_die_key(num, sides, frac);
    var ladder = damage_die_ladder();
    for (var i = 0; i < array_length(ladder); i++)
    {
        if (ladder[i] == key)
            return i;
    }
    // Fallback: nearest normal NdM on the ladder
    var fallback = string(max(1, num)) + "d" + string(max(1, sides));
    for (var i = 0; i < array_length(ladder); i++)
    {
        if (ladder[i] == fallback)
            return i;
    }
    // Default to 1d4 if unknown
    return 6;
}

function damage_die_parts_from_key(key)
{
    // Returns { num, sides, frac, key }
    // frac: 0 normal, 1=1/4, 2=1/2, 3=3/4
    var r = { num: 0, sides: 0, frac: 0, key: key };

    if (key == "0d0") return r;
    if (key == "1/4d4") { r.num = 1; r.sides = 4; r.frac = 1; return r; }
    if (key == "1/2d4") { r.num = 1; r.sides = 4; r.frac = 2; return r; }
    if (key == "3/4d4") { r.num = 1; r.sides = 4; r.frac = 3; return r; }

    var dpos = string_pos("d", key);
    if (dpos <= 0) return r;
    r.num   = real(string_copy(key, 1, dpos - 1));
    r.sides = real(string_copy(key, dpos + 1, string_length(key) - dpos));
    return r;
}

function damage_die_step_by(num, sides, frac, steps)
{
    var ladder = damage_die_ladder();
    var idx = damage_die_index_from_parts(num, sides, frac);
    idx = clamp(idx + steps, 0, array_length(ladder) - 1);
    return damage_die_parts_from_key(ladder[idx]);
}

function damage_die_step_up(num, sides, steps)
{
    // Old API (no frac) → assume normal dice
    var p = damage_die_step_by(num, sides, 0, steps);
    return { num: p.num, sides: p.sides, frac: p.frac, key: p.key };
}

function damage_die_step_down(num, sides, steps)
{
    var p = damage_die_step_by(num, sides, 0, -steps);
    return { num: p.num, sides: p.sides, frac: p.frac, key: p.key };
}


function equipment_damage_attr_bonus(cc, item)
{
    var str = equipment_get_attribute(cc, "Strength");
    var dex = equipment_get_attribute(cc, "Dexterity");

    // EXAMPLE formula — replace with your real bonus table
    var str_bonus = max(0, str - 10);
    var dex_bonus = max(0, dex - 10);

    var is_light = false;
    if (variable_struct_exists(item, "traits") && is_array(item.traits))
    {
        for (var i = 0; i < array_length(item.traits); i++)
        {
            var tr = string(item.traits[i]);
            if (tr == "Light"
                || string_pos("Light", tr) == 1
                || string_pos("Finesse", tr) > 0)
            {
                is_light = true;
                break;
            }
        }
    }

    if (is_light)
    {
        // Light: use whichever attribute gives the better damage bonus
        if (dex_bonus > str_bonus)
            return { amount: dex_bonus, label: "Dexterity Damage Bonus" };
        else
            return { amount: str_bonus, label: "Strength Damage Bonus" };
    }

    // Non-light: Strength only
    return { amount: str_bonus, label: "Strength Damage Bonus" };
}



function equipment_damage_die_steps(cc, item)
{
    // Return { steps, notes: ["+1 Die Step Weapon Mastery (Side Sword)", ...] }
    var steps = 0;
    var notes = [];

    // Example: ranked talent "Weapon Mastery (Side Sword)" or generic mastery
    // Adjust names to whatever you store in talent_ranks
    if (variable_struct_exists(cc, "talent_ranks"))
    {
        var keys = variable_struct_get_names(cc.talent_ranks);
        for (var i = 0; i < array_length(keys); i++)
        {
            var key = keys[i];
            var rank = cc.talent_ranks[$ key];
            if (!is_real(rank) || rank < 0) continue;

            // Match mastery that names this weapon
            if (string_pos("Weapon Mastery", key) == 1
                && string_pos(item.name, key) > 0)
            {
                var add = max(1, rank); // or rank itself
                steps += add;
                array_push(notes, "+" + string(add) + " Die Step " + key);
            }
        }
    }

    return { steps: steps, notes: notes };
}




function equipment_get_size_name(cc)
{
    // 1) Explicit on character
    if (variable_struct_exists(cc, "size") && is_string(cc.size) && cc.size != "")
        return string_lower(cc.size);

    if (!variable_struct_exists(cc, "locked_species"))
        return "medium";
    if (!variable_global_exists("species_data"))
        return "medium";
    if (!variable_struct_exists(global.species_data, cc.locked_species))
        return "medium";

    var sp = global.species_data[$ cc.locked_species];

    // 2) stats.size = "small"
    if (variable_struct_exists(sp, "stats") && variable_struct_exists(sp.stats, "size"))
        return string_lower(string(sp.stats.size));

    // 3) stats.traits array
    if (variable_struct_exists(sp, "stats")
        && variable_struct_exists(sp.stats, "traits")
        && is_array(sp.stats.traits))
    {
        var size = equipment_size_from_trait_list(sp.stats.traits);
        if (size != "") return size;
    }

    // 4) top-level traits
    if (variable_struct_exists(sp, "traits") && is_array(sp.traits))
    {
        var size2 = equipment_size_from_trait_list(sp.traits);
        if (size2 != "") return size2;
    }

    return "medium";
}

function equipment_size_from_trait_list(traits)
{
    for (var i = 0; i < array_length(traits); i++)
    {
        var t = string_lower(string(traits[i]));
        t = string_replace_all(t, "_", " ");
        t = string_trim(t);

        // Direct sizes
        if (t == "tiny") return "tiny";
        if (t == "small") return "small";
        if (t == "medium") return "medium";
        if (t == "large") return "large";
        if (t == "giant") return "giant";
        if (t == "huge") return "huge";

        // Aliases used in your species text
        if (t == "stunty" || string_pos("small (", t) == 1)
            return "small";
        if (string_pos("count as being small", t) > 0)
            return "small";
        if (string_pos("count as being large", t) > 0)
            return "large";
    }
    return "";
}



function equipment_size_die_steps(cc)
{
    // Medium = 0
    // Each category under Medium: -1 step
    // Each category over Medium: +1 step
    var size = equipment_get_size_name(cc);
    switch (size)
    {
        case "tiny":       return -2;
        case "small":      return -1;
        case "medium":     return  0;
        case "large":      return  1;
        case "giant":       return  2;
        case "huge": return  3;
    }
    return 0;
}


function equipment_talent_die_steps(cc, item)
{
    var steps = 0;
    var notes = [];

    if (!variable_struct_exists(cc, "talent_ranks"))
        return { steps: steps, notes: notes };

    var keys = variable_struct_get_names(cc.talent_ranks);
    for (var i = 0; i < array_length(keys); i++)
    {
        var key = keys[i];
        var rank = cc.talent_ranks[$ key];
        if (!is_real(rank) || rank < 0) continue;

        // Weapon Mastery (Weapon Name) — +1 step per rank (or +1 total; change if needed)
        if (string_pos("Weapon Mastery", key) == 1)
        {
            // Only if it matches this weapon, or is a generic mastery you allow
            var applies = (string_pos(item.name, key) > 0);
            if (applies)
            {
                var add = max(1, rank); // use `1` if mastery is unranked
                steps += add;
                array_push(notes, "+" + string(add) + " Die Step " + key);
            }
        }

        // Fighting Style (X) — +1 die step when style applies to this loadout
        if (string_pos("Fighting Style", key) == 1)
        {
            // Optional filter: only styles that should boost damage
            // e.g. skip pure defensive styles if you want
            var add = 1;
            if (rank > 0) add = max(1, rank);
            steps += add;
            array_push(notes, "+" + string(add) + " Die Step " + key);
        }
    }

    return { steps: steps, notes: notes };
}

function equipment_damage_line(cc, item)
{
    if (item == undefined) return "Damage: —";

    var raw = "—";
    if (variable_struct_exists(item, "damage") && is_struct(item.damage)
        && variable_struct_exists(item.damage, "dice"))
        raw = string(item.damage.dice);

    var parsed = damage_parse(raw);

    // Bows / empty dice
    if (parsed.num <= 0 || parsed.sides <= 0)
        return "Damage: " + raw;

    var base_txt = string(parsed.num) + "d" + string(parsed.sides);

    var size_steps = equipment_size_die_steps(cc);
    var talent     = equipment_talent_die_steps(cc, item);
    var total_steps = size_steps + talent.steps;

    var num = parsed.num;
    var sides = parsed.sides;

    if (total_steps > 0)
    {
        var up = damage_die_step_up(num, sides, total_steps);
        num = up.num; sides = up.sides;
    }
    else if (total_steps < 0)
    {
        var down = damage_die_step_down(num, sides, -total_steps);
        num = down.num; sides = down.sides;
    }

    var attr = equipment_damage_attr_bonus(cc, item);
    var flat = parsed.bonus + attr.amount;

    var final_core = string(num) + "d" + string(sides);
    if (flat > 0) final_core += " +" + string(flat);
    else if (flat < 0) final_core += " " + string(flat);
    if (parsed.type != "") final_core += " " + parsed.type;

    var bits = [];
    array_push(bits, base_txt + " Base");

    if (size_steps != 0)
    {
            // Always show size (even Medium / 0 steps)
    {
        var size_name = equipment_get_size_name(cc);
        var _sign = (size_steps > 0) ? "+" : "";
        array_push(bits,
            _sign + string(size_steps) + " Die Step Size (" + size_name + ")");
    }
    }

    for (var i = 0; i < array_length(talent.notes); i++)
        array_push(bits, talent.notes[i]);

    if (attr.amount != 0)
        array_push(bits, (attr.amount >= 0 ? "+" : "") + string(attr.amount) + " " + attr.label);

    if (parsed.bonus != 0)
        array_push(bits, (parsed.bonus >= 0 ? "+" : "") + string(parsed.bonus) + " Weapon");

    var detail = bits[0];
    for (var i = 1; i < array_length(bits); i++)
        detail += ", " + bits[i];

    return "Damage: " + final_core + " (" + detail + ")";
}

