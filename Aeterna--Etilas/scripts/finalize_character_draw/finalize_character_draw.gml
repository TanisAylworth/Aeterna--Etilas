function draw_character_sheet(cc)
{
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Background
    draw_set_color(make_color_rgb(22, 22, 26));
    draw_rectangle(0, 0, screen_w, screen_h, false);
    
    // =====================================================
    // TOP HEADER
    // =====================================================
    draw_set_color(make_color_rgb(40, 40, 48));
    draw_rectangle(20, 15, screen_w - 20, 70, false);
    draw_set_color(c_gray);
    draw_rectangle(20, 15, screen_w - 20, 70, true);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
    var char_name = variable_struct_exists(cc, "name") ? cc.name : "Unnamed";
    var species   = variable_struct_exists(cc, "locked_species") ? cc.locked_species : "—";
    
    draw_text(40, 42, char_name);
    
    draw_set_halign(fa_right);
    draw_set_color(c_ltgray);
    draw_text(screen_w - 40, 42, species + "   |   Age —   Ht —   Wt —");
    
    // =====================================================
    // COLUMN LAYOUT
    // =====================================================
    var col1_x = 30;
    var col2_x = 340;
    var col3_x = 720;
    var top_y  = 90;
    
    // =====================================================
    // LEFT COLUMN – Attributes + Characteristics + Species
    // =====================================================
    draw_section_header(col1_x, top_y, 290, "ATTRIBUTES");
    
    var attrs = [
        ["Strength (P)",   "Strength"],
        ["Dexterity (P)",  "Dexterity"],
        ["Endurance (P)",  "Endurance"],
        ["Reflexes (M)",   "Reflexes"],
        ["Intelligence (M)","Intelligence"],
        ["Perception (M)", "Perception"],
        ["Willpower (S)",  "Willpower"],
        ["Toughness (S)",  "Toughness"],
        ["Charm (S*)",     "Charm"],
        ["Leadership (S*)","Leadership"]
    ];
    
    var ay = top_y + 32;
    for (var i = 0; i < array_length(attrs); i++)
    {
        var label = attrs[i][0];
        var key   = attrs[i][1];
        var val   = get_final_attribute(cc, key);   // you already have this helper
        
        draw_set_color(c_ltgray);
        draw_text(col1_x + 8, ay, label);
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_text(col1_x + 280, ay, string(val));
        draw_set_halign(fa_left);
        ay += 20;
    }
    
    // ===== CHARACTERISTICS =====
ay += 12;
draw_section_header(col1_x, ay, 290, "CHARACTERISTICS");
ay += 28;

var ch = get_all_characteristics(cc);

var char_lines = [
    ["Carry Weight",          string(ch.carry_weight) + " lbs"],
    ["Move Speed",            string(ch.move_speed) + " ft"],
    ["Fatigue Limit",         string(ch.fatigue_limit)],
    ["Fatigue Recovery",      string(ch.fatigue_recovery)],
    ["Natural Healing Rate",  string(ch.natural_heal_rate)],
    ["Logic Test",            string(ch.logic_test)],
    ["Passive Perception",    string(ch.passive_perception)],
    ["Active Perception",     string(ch.active_perception)],
    ["Consciousness Save",    string(ch.consciousness_save)],
    ["Persuasion",            string(ch.persuasion)],
    ["Physical Appeal",       string(ch.appeal)],
    ["Command",               string(ch.command)],
    ["Follower Limit",        string(ch.follower_limit)],
    ["Str Damage Bonus",      string(ch.str_damage_bonus)],
    ["Dex Damage Bonus",      string(ch.dex_damage_bonus)],
    ["CDT Bonus",             string(ch.cdt_bonus)]
];

for (var i = 0; i < array_length(char_lines); i++)
{
    draw_set_color(c_ltgray);
    draw_text(col1_x + 8, ay, char_lines[i][0]);
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_text(col1_x + 280, ay, char_lines[i][1]);
    draw_set_halign(fa_left);
    ay += 17;
}
    
    // ===== SPECIES =====
ay += 14;
draw_section_header(col1_x, ay, 290, "SPECIES");
ay += 28;

if (!variable_struct_exists(cc, "locked_species") || cc.locked_species == "")
{
    draw_set_color(c_dkgray);
    draw_text(col1_x + 8, ay, "(no species selected)");
}
else
{
    var sp_name = cc.locked_species;
    var sp = global.species_data[$ sp_name];
    
    // --- Abilities ---
    draw_set_color(c_aqua);
    draw_text(col1_x + 8, ay, "Abilities");
    ay += 18;
    
    var abilities = [];
    if (variable_struct_exists(sp, "abilities"))           abilities = sp.abilities;
    else if (variable_struct_exists(sp, "stats") && variable_struct_exists(sp.stats, "abilities"))
        abilities = sp.stats.abilities;
    
    if (array_length(abilities) == 0)
    {
        draw_set_color(c_dkgray);
        draw_text(col1_x + 16, ay, "—");
        ay += 16;
    }
    else
    {
        for (var i = 0; i < min(4, array_length(abilities)); i++)
        {
            draw_set_color(c_white);
            draw_text(col1_x + 16, ay, "• " + string(abilities[i]));
            ay += 16;
        }
    }
    
    // --- Negatives ---
    ay += 6;
    draw_set_color(c_aqua);
    draw_text(col1_x + 8, ay, "Negatives");
    ay += 18;
    
    var negatives = [];
    if (variable_struct_exists(sp, "negatives"))           negatives = sp.negatives;
    else if (variable_struct_exists(sp, "stats") && variable_struct_exists(sp.stats, "negatives"))
        negatives = sp.stats.negatives;
    
    if (array_length(negatives) == 0)
    {
        draw_set_color(c_dkgray);
        draw_text(col1_x + 16, ay, "—");
        ay += 16;
    }
    else
    {
        for (var i = 0; i < min(4, array_length(negatives)); i++)
        {
            draw_set_color(c_white);
            draw_text(col1_x + 16, ay, "• " + string(negatives[i]));
            ay += 16;
        }
    }
    
    // --- Traits ---
    ay += 6;
    draw_set_color(c_aqua);
    draw_text(col1_x + 8, ay, "Traits");
    ay += 18;
    
    var traits = [];
    if (variable_struct_exists(sp, "traits"))              traits = sp.traits;
    else if (variable_struct_exists(sp, "stats") && variable_struct_exists(sp.stats, "traits"))
        traits = sp.stats.traits;
    
    if (array_length(traits) == 0)
    {
        draw_set_color(c_dkgray);
        draw_text(col1_x + 16, ay, "—");
        ay += 16;
    }
    else
    {
        for (var i = 0; i < min(5, array_length(traits)); i++)
        {
            draw_set_color(c_white);
            draw_text(col1_x + 16, ay, "• " + string(traits[i]));
            ay += 16;
        }
    }
}
    
    // ===== SKILLS =====
draw_section_header(col2_x, top_y, 360, "SKILLS");

var sy = top_y + 32;

// Header row
draw_set_color(c_gray);
draw_text(col2_x + 8,   sy, "Skill");
draw_text(col2_x + 210,  sy, "Rank");
draw_text(col2_x + 270,  sy, "Check");
sy += 18;

if (variable_struct_exists(cc, "skill_ranks"))
{
    var keys = variable_struct_get_names(cc.skill_ranks);
    
    // Sort alphabetically for nicer display (optional)
    // array_sort(keys, true);   // uncomment if you want sorted
    
    var max_show = min(20, array_length(keys));   // density limit
    
    for (var i = 0; i < max_show; i++)
    {
        var sk   = keys[i];
        var rank = cc.skill_ranks[$ sk];
        var check_val = get_skill_check_value(cc, sk);
        
        // Name
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(col2_x + 8, sy, sk);
        
        // Rank
        draw_set_halign(fa_center);
        draw_text(col2_x + 225, sy, string(rank));
        
        // Check value
        draw_set_color(c_aqua);
        draw_text(col2_x + 295, sy, check_val);
        
        draw_set_halign(fa_left);
        sy += 17;
    }
    
    if (array_length(keys) > max_show)
    {
        draw_set_color(c_dkgray);
        draw_text(col2_x + 8, sy, "... +" + string(array_length(keys) - max_show) + " more");
    }
}
else
{
    draw_set_color(c_dkgray);
    draw_text(col2_x + 8, sy, "(no skills)");
}
    
    // Talents
    sy += 16;
    draw_section_header(col2_x, sy, 360, "TALENTS");
    sy += 28;
    
    draw_set_color(c_gray);
    draw_text(col2_x + 8,  sy, "Talent");
    draw_text(col2_x + 260, sy, "Rank");
    sy += 18;
    
    if (variable_struct_exists(cc, "talent_ranks"))
    {
        var tkeys = variable_struct_get_names(cc.talent_ranks);
        var tmax = min(20, array_length(tkeys));
        for (var i = 0; i < tmax; i++)
        {
            var t = tkeys[i];
            var tr = cc.talent_ranks[$ t];
            draw_set_color(c_white);
            draw_text(col2_x + 8, sy, t);
            draw_set_halign(fa_center);
            draw_text(col2_x + 280, sy, string(tr));
            draw_set_halign(fa_left);
            sy += 18;
        }
    }
    
    // =====================================================
    // RIGHT COLUMN – Combat + Equipment + Inventory
    // =====================================================
    // ===== COMBAT STATISTICS =====
draw_section_header(col3_x, top_y, 340, "COMBAT STATISTICS");

var cy = top_y + 32;
var ch = get_all_characteristics(cc);   // already calculated earlier

// Equipment Penalty = max(0, total WP of equipped items - Strength)
var equip_penalty = 0;
if (variable_struct_exists(cc, "equipment") && variable_struct_exists(cc.equipment, "owned"))
{
    // Temporary simple version – sums WP of everything owned
    // Later you can restrict this to only currently equipped items
    var total_wp = 0;
    var inv = cc.equipment.owned;
    var ids = variable_struct_get_names(inv);
    
    for (var i = 0; i < array_length(ids); i++)
    {
        var item = equipment_find_item_by_id(ids[i]);
        if (item != undefined && variable_struct_exists(item, "weight"))
            total_wp += item.weight * inv[$ ids[i]];   // qty aware
    }
    
    equip_penalty = max(0, total_wp - get_final_attribute(cc, "Strength"));
}

// Average DR placeholder (you’ll fill this properly once armor data exists)
var avg_dr = "—";   // later: total_DR / hit_locations

var combat_lines = [
    ["Initiative Check",   string(ch.initiative)],
    ["Base Attack Check",  string(ch.base_attack)],
    ["Base Defense Check", string(ch.base_defense)],
    ["Str. Damage Bonus",  string(ch.str_damage_bonus)],
    ["Dex. Damage Bonus",  string(ch.dex_damage_bonus)],
    ["Equipment Penalty",  string(equip_penalty)],
    ["Average DR",         avg_dr]
];

for (var i = 0; i < array_length(combat_lines); i++)
{
    draw_set_color(c_ltgray);
    draw_text(col3_x + 8, cy, combat_lines[i][0]);
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_text(col3_x + 320, cy, combat_lines[i][1]);
    draw_set_halign(fa_left);
    cy += 20;
}
    
    // ===== CDT / WOUND THRESHOLDS =====
cy += 16;
draw_section_header(col3_x, cy, 340, "CDT THRESHOLDS");
cy += 28;

var cdt = get_cdt_thresholds(cc);


var cdt_lines = [
    ["Minor",    string(cdt.minor)],
    ["Light",    string(cdt.light)],
    ["Moderate", string(cdt.moderate)],
    ["Serious",  string(cdt.serious)],
    ["Critical", string(cdt.critical)],
    ["Fatal",    string(cdt.fatal)]
];

for (var i = 0; i < array_length(cdt_lines); i++)
{
    draw_set_color(c_ltgray);
    draw_text(col3_x + 8, cy, cdt_lines[i][0]);
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_text(col3_x + 320, cy, cdt_lines[i][1]);
    draw_set_halign(fa_left);
    cy += 18;
}
    
    // Weapons & Armor summary
    cy += 40;
    draw_section_header(col3_x, cy, 340, "WEAPONS & ARMOR");
    cy += 28;
    
    draw_set_color(c_ltgray);
    draw_text(col3_x + 8, cy, "(Equipped items summary)");
    cy += 20;
    draw_set_color(c_white);
    draw_text(col3_x + 8, cy, "Populate from equipment.owned later");
    
    // Inventory
    cy += 40;
    draw_section_header(col3_x, cy, 340, "INVENTORY");
    cy += 28;
    
    if (variable_struct_exists(cc, "equipment") && variable_struct_exists(cc.equipment, "owned"))
    {
        var inv_keys = variable_struct_get_names(cc.equipment.owned);
        var shown = 0;
        for (var i = 0; i < array_length(inv_keys) && shown < 8; i++)
        {
            var _id = inv_keys[i];
            var qty = cc.equipment.owned[$ _id];
            if (qty <= 0) continue;
            
            draw_set_color(c_white);
            draw_text(col3_x + 8, cy, _id + "  x" + string(qty));
            cy += 18;
            shown++;
        }
        if (array_length(inv_keys) == 0)
        {
            draw_set_color(c_dkgray);
            draw_text(col3_x + 8, cy, "(empty)");
        }
    }
    
    // =====================================================
    // BOTTOM BUTTONS
    // =====================================================
    var back_x = 40;
    var back_y = screen_h - 70;
    var back_w = 160;
    var back_h = 50;
    
    var fin_w = 260;
    var fin_h = 50;
    var fin_x = (screen_w - fin_w) * 0.5;
    var fin_y = screen_h - 70;
    
    // Back
    var hover_back = point_in_rectangle(mx, my, back_x, back_y, back_x + back_w, back_y + back_h);
    draw_set_color(hover_back ? make_color_rgb(60, 60, 30) : make_color_rgb(40, 40, 40));
    draw_rectangle(back_x, back_y, back_x + back_w, back_y + back_h, false);
    draw_set_color(hover_back ? c_yellow : c_white);
    draw_rectangle(back_x, back_y, back_x + back_w, back_y + back_h, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(back_x + back_w * 0.5, back_y + back_h * 0.5, "BACK");
    
    // Finish
    var hover_fin = point_in_rectangle(mx, my, fin_x, fin_y, fin_x + fin_w, fin_y + fin_h);
    draw_set_color(hover_fin ? make_color_rgb(30, 80, 30) : make_color_rgb(25, 55, 25));
    draw_rectangle(fin_x, fin_y, fin_x + fin_w, fin_y + fin_h, false);
    draw_set_color(hover_fin ? c_lime : c_green);
    draw_rectangle(fin_x, fin_y, fin_x + fin_w, fin_y + fin_h, true);
    draw_set_color(c_white);
    draw_text(fin_x + fin_w * 0.5, fin_y + fin_h * 0.5, "FINISH CHARACTER");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// Small helper used above
function draw_section_header(xx, yy, w, title)
{
    draw_set_color(make_color_rgb(50, 50, 60));
    draw_rectangle(xx, yy, xx + w, yy + 24, false);
    draw_set_color(c_gray);
    draw_rectangle(xx, yy, xx + w, yy + 24, true);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(xx + w * 0.5, yy + 12, title);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}