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
                cc.equipment.hovered_item = item.id;
            
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
    
    // Build text
    var lines = [];
    array_push(lines, item.name);
    array_push(lines, "");
    array_push(lines, "Cost: " + equipment_cost_string(item));
    array_push(lines, "Damage: " + item.damage.dice + "  (" + string(item.damage.min) + "–" + string(item.damage.max) + ")");
    array_push(lines, "Weight Penalty: " + string(item.weight));
    array_push(lines, "Integrity: " + string(item.integrity));
    array_push(lines, "");
    array_push(lines, "Traits:");
    
    for (var i = 0; i < array_length(item.traits); i++)
        array_push(lines, "  • " + string(item.traits[i]));
    
    var text = string_join(lines, "\n");
    
    var pad = 12;
    var tw = 280;
    var th = string_height_ext(text, 18, tw - pad * 2) + pad * 2;
    
    var tx = mx + 18;
    var ty = my + 18;
    if (tx + tw > display_get_gui_width() - 8)  tx = mx - tw - 18;
    if (ty + th > display_get_gui_height() - 8) ty = my - th - 18;
    
    draw_set_color(make_color_rgb(20, 20, 25));
    draw_rectangle(tx, ty, tx + tw, ty + th, false);
    draw_set_color(c_yellow);
    draw_rectangle(tx, ty, tx + tw, ty + th, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(tx + pad, ty + pad, text, 18, tw - pad * 2);
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

function equipment_cost_string(item)
{
    var parts = [];
    if (item.cost.gold   > 0) array_push(parts, string(item.cost.gold)   + "g");
    if (item.cost.silver > 0) array_push(parts, string(item.cost.silver) + "s");
    if (item.cost.copper > 0) array_push(parts, string(item.cost.copper) + "c");
    if (array_length(parts) == 0) return "0c";
    return string_join(parts, " ");
}


function equipment_cost_total_gold(item)
{
    // Simple conversion: 1g = 10s = 100c  (adjust if your economy is different)
    return item.cost.gold + (item.cost.silver / 10) + (item.cost.copper / 100);
}