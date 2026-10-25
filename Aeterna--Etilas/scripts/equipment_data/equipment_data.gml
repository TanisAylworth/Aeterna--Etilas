function equipment_data_init()
{
    // TEMP: always rebuild while editing prices
    // if (variable_global_exists("equipment_data")) return;
    global.equipment_data = { weapons: {} };
    
    // =========================================================
    // Helper
    // =========================================================
    function make_weapon(_id, _name, _cost_g, _cost_s, _cost_c, _dmg, _weight, _integrity, _traits, _sprite = -1)
    {
        return {
            id: _id,
            name: _name,
            cost: { gold: _cost_g, silver: _cost_s, copper: _cost_c },
            damage: {
                dice: _dmg,
                min: damage_min(_dmg),
                max: damage_max(_dmg)
            },
            weight: _weight,
            integrity: _integrity,
            traits: _traits,
            sprite: _sprite
        };
    }
    
    function damage_min(d) {
        var p = string_split(d, "d");
        if (array_length(p) < 2) return 1;
        return max(1, real(p[0]));
    }
    function damage_max(d) {
        var p = string_split(d, "d");
        if (array_length(p) < 2) return 1;
        var num = real(p[0]);
        var rest = p[1];
        var sides = real(string_digits(rest));
        var bonus = 0;
        if (string_pos("+", rest) > 0)
            bonus = real(string_digits(string_copy(rest, string_pos("+", rest), 10)));
        return num * sides + bonus;
    }
    
    // =========================================================
    // SMALL BLADES
    // =========================================================
    global.equipment_data.weapons[$ "Small Blades"] = {
        "Knives": [
            make_weapon("hunting_knife",   "Hunting Knife",   0, 3, 0, "1d3 S/P", 0.1, 4,  ["Dismounted(4)","Rapid(3)","Agile(2)","Hide(3)","Acc(2)","Thrown","Light","Precise(1)"]),
            make_weapon("parrying_knife",  "Parrying Knife",  3, 0, 0, "1d2 S",   0.0, 7,  ["Dismounted(4)","Rapid(4)","Agile(2)","Hide(2)","Acc(1)","Light","Parry(3)","Catching(2)"]),
            make_weapon("boot_knife",      "Boot Knife",      0, 3, 0, "1d3 P",   0.1, 3,  ["Dismounted(4)","Rapid(3)","Agile(3)","Hide(5)","Acc(3)","Thrown","Light"]),
            make_weapon("dive_knife",      "Dive Knife",      0, 5, 0, "1d4 P",   0.1, 5,  ["Dismounted(4)","Rapid(5)","Agile(2)","Hide(2)","Acc(4)","Light","Thrown","Precise(1)"]),
            make_weapon("flensing_knife",  "Flensing Knife",  0, 5, 0, "1d4 S",   0.1, 5,  ["Dismounted(4)","Rapid(2)","Agile(2)","Hide(1)","Acc(1)","Cleave(3)","Light","Bleed"]),
            make_weapon("blade_breaker",   "Blade Breaker",   5, 0, 0, "1d3 P",   0.3, 9,  ["Dismounted(4)","Rapid(1)","Agile(3)","Parry(3)","Brk(5)","Light","Catch(3)"]),
            make_weapon("folding_knife",   "Folding Knife",   0, 8, 0, "1d2 S",   0.0, 3,  ["Dismounted(4)","Rapid(3)","Agile(3)","Hide(3)","Acc(3)","Collapsible","Light","Thrown"]),
            make_weapon("throwing_knife",  "Throwing Knife",  0, 7, 0, "1d4 P",   0.0, 4,  ["Dismounted(4)","Rapid(5)","Hide(2)","Acc(2)","Light","Thrown Range(15)","Balanced(3)"]),
        ],
        "Daggers": [
            make_weapon("stiletto",        "Stiletto",        8, 0, 0, "1d3 P",   0.1, 5,  ["Dismounted(4)","Rapid(2)","Agile(1)","Acc(5)","Hide(5)","Light","AP(3)","Precise(2)"]),
            make_weapon("rondel",          "Rondel",          8, 0, 0, "1d4 P",   0.2, 8,  ["Dismounted(4)","Rapid(2)","Agile(2)","Acc(2)","Hide(2)","Light","AP(5)","ArBrk(4)","Precise(1)"]),
            make_weapon("dirk",            "Dirk",            0, 5, 0, "1d4 S",   0.2, 5,  ["Dismounted(4)","Rapid(3)","Agile(2)","Acc(3)","Hide(2)","Light","Thrown","Balanced(1)","Range(15)","Versatile"]),
            make_weapon("broad_dagger",    "Broad Dagger",    0, 8, 0, "1d4+1 S", 0.4, 7,  ["Dismounted(4)","Rapid(2)","Agile(1)","Acc(2)","Light","Thrown","Range(10)"]),
            make_weapon("parry_dagger",    "Parry Dagger",    5, 0, 0, "1d3 S",   0.2, 7,  ["Dismounted(4)","Rapid(3)","Agile(3)","Catching(3)","Light","Acc(1)","Hide(2)","Parry(4)"]),
            make_weapon("mail_breaker",    "Mail Breaker",    5, 0, 0, "1d3 P",   0.3, 6,  ["Dismounted(4)","Rapid(2)","Agile(2)","ArBrk(4)","Light","Acc(2)","Hide(2)"]),
            make_weapon("seax",            "Seax",            0, 8, 0, "1d6 S",   0.7, 7,  ["Dismounted(4)","Rapid(2)","Agile(1)","Cleave(1)","Light","Acc(1)"]),
            make_weapon("throwing_dagger", "Throwing Dagger", 0, 7, 0, "1d4 P",   0.2, 5,  ["Dismounted(4)","Rapid(3)","Agile(3)","Hide(2)","Acc(2)","Light","Thrown","Range(15)","Balanced(3)"]),
        ],
        "Curved Knives": [
            make_weapon("karambit",        "Karambit",        0, 5, 0, "1d3 S",   0.0, 3,  ["Dismounted(4)","Accurate(3)","Rapid(6)","Agile(3)","Light","Hide(5)","Natural","Multi-Attack","Precise(1)"]),
            make_weapon("kukri",           "Kukri",           1, 0, 0, "1d6 S",   0.5, 5,  ["Dismounted(4)","Hooking(3)","Rapid(3)","Agile(2)","Light","Cleave(2)"]),
            make_weapon("sickle",          "Sickle",          0, 3, 0, "1d4+1 S", 0.75,4,  ["Dismounted(4)","Hooking(4)","Rapid(1)","Light"]),
            make_weapon("hook_knife",      "Hook Knife",      0, 5, 0, "1d4 S",   0.5, 5,  ["Dismounted(4)","Hooking(1)","Rapid(2)","Agile(2)","Light","Parry(1)","Hide(1)"]),
        ]
    };
    
    // =========================================================
    // STRAIGHT BLADES
    // =========================================================
    global.equipment_data.weapons[$ "Straight Blades"] = {
        "Short Swords": [
            make_weapon("arming_sword",    "Arming Sword",    5, 0, 0, "2d3 P/S", 1.0, 8,  ["Rapid(1)","Parry(2)","Agile(1)","Light"]),
            make_weapon("side_sword",      "Side Sword",      4, 0, 0, "1d6 P/S", 1.0, 7,  ["Rapid(2)","Parry(2)","Agile(2)","Light"]),
            make_weapon("hunting_sword",   "Hunting Sword",   4, 0, 0, "2d3 P/S", 1.5, 9,  ["Parry(1)","Cleaving(1)","Reinforced","Light","Precise(1)","Accurate(1)"]),
            make_weapon("to",              "To",              6, 0, 0, "1d6 P/S", 0.5, 6,  ["Hide(2)","Rapid(2)","Parry(1)","Light"]),
            make_weapon("broadsword",      "Broadsword",     10, 0, 0, "2d4 P/S", 1.5,12,  ["Cleaving(3)","Parry(1)","Crushing(2)","Splitting(2)"]),
            make_weapon("spatha",          "Spatha",         10, 0, 0, "1d8 P/S", 1.5,10,  ["Cleaving(1)","Parry(1)","Charge(2)","Splitting(2)","Mounted(2)"]),
            make_weapon("gladius",         "Gladius",         8, 0, 0, "1d4+1 P/S",1.0, 9,  ["Rapid(2)","Parry(1)","Light"]),
            make_weapon("cinquedea",       "Cinquedea",       8, 0, 0, "1d4 P/S", 1.0, 7,  ["Rapid(2)","Parry(1)","Light","Armor Piercing(2)"]),
            make_weapon("baselard",        "Baselard",        8, 0, 0, "1d4+1 P/S",0.5, 7,  ["Rapid(2)","Parry(1)","Light","Agile(1)","Catching(1)"]),
        ],
        "Long Swords": [
            make_weapon("longsword",       "Longsword",      15, 0, 0, "1d8+1 P/S",1.8,12, ["Versatile","Parry(3)","Cleave(1)","Reach(1)"]),
            make_weapon("bastard_sword",   "Bastard Sword",  18, 0, 0, "1d10 P/S", 2.0,13, ["Versatile","Parry(2)","Cleave(2)"]),
            make_weapon("war_sword",       "War Sword",      16, 0, 0, "1d8+1 P/S",2.2,14, ["Reinforced","Cleave(2)","Parry(2)"]),
            make_weapon("langsax",         "Langsax",        12, 0, 0, "1d8 S",    1.6,11, ["Cleave(2)","Light"]),
            make_weapon("jian",            "Jian",           14, 0, 0, "1d6+1 P/S",1.4,10, ["Precise(2)","Rapid(2)","Parry(2)","Light"]),
            make_weapon("claymore",        "Claymore",       22, 0, 0, "2d6 S",    2.8,15, ["Two-Handed","Cleave(3)","Reach(1)","Crushing(1)"]),
        ],
        "Fencing Swords": [
            make_weapon("rapier",          "Rapier",         20, 0, 0, "1d6 P",    1.0, 8,  ["Rapid(4)","Precise(3)","Parry(3)","Light","Acc(2)"]),
            make_weapon("estoc",           "Estoc",          18, 0, 0, "1d6+1 P",  1.2, 9,  ["AP(4)","Precise(2)","Parry(2)"]),
            make_weapon("smallsword",      "Smallsword",     15, 0, 0, "1d4+1 P",  0.6, 6,  ["Rapid(5)","Precise(3)","Light","Parry(2)"]),
            make_weapon("spadroon",        "Spadroon",       14, 0, 0, "1d6 P/S",  1.0, 8,  ["Rapid(3)","Parry(2)","Light"]),
            make_weapon("foil",            "Foil",           10, 0, 0, "1d3 P",    0.5, 5,  ["Rapid(4)","Precise(2)","Light","Training"]),
            make_weapon("epee",            "Épée",           16, 0, 0, "1d4+1 P",  0.8, 7,  ["Rapid(3)","Precise(3)","Parry(2)"]),
            make_weapon("colichemarde",    "Colichemarle",   22, 0, 0, "1d6 P",    1.1, 9,  ["Rapid(3)","Parry(4)","Precise(2)"]),
            make_weapon("dueling_sword",   "Dueling Sword",  18, 0, 0, "1d6 P/S",  1.0, 8,  ["Rapid(3)","Parry(3)","Light"]),
        ],
        "Great Swords": [
            make_weapon("zweihander",      "Zweihander",     30, 0, 0, "2d6+1 S",  3.5,16, ["Two-Handed","Reach(2)","Cleave(4)","Parry(1)"]),
            make_weapon("montante",        "Montante",       28, 0, 0, "2d6 S",    3.2,15, ["Two-Handed","Reach(2)","Cleave(3)"]),
            make_weapon("greatsword",      "Greatsword",     26, 0, 0, "2d6 S",    3.0,14, ["Two-Handed","Cleave(3)","Reach(1)"]),
            make_weapon("spadone",         "Spadone",        27, 0, 0, "2d6 S",    3.3,15, ["Two-Handed","Reach(2)","Cleave(3)"]),
            make_weapon("changdao",        "Changdao",       24, 0, 0, "1d12 S",   2.8,13, ["Two-Handed","Cleave(3)"]),
            make_weapon("zhanmadao",       "Zhanmadao",      28, 0, 0, "2d6 S",    3.4,15, ["Two-Handed","Anti-Mount","Cleave(3)"]),
            make_weapon("bearing_sword",   "Bearing Sword",  35, 0, 0, "2d8 S",    4.0,18, ["Two-Handed","Ceremonial","Reach(2)"]),
            make_weapon("parade_sword",    "Parade Sword",   40, 0, 0, "1d10 S",   3.0,12, ["Two-Handed","Ceremonial","Parry(2)"]),
        ]
    };
    
    // =========================================================
    // CURVED BLADES
    // =========================================================
    global.equipment_data.weapons[$ "Curved Blades"] = {
        "Curved Short Swords": [
            make_weapon("scimitar",        "Scimitar",       12, 0, 0, "1d8 S",   1.5, 7,  ["Rapid(2)","Light","Cleave(2)","Parry(1)"]),
            make_weapon("saber",           "Saber",          10, 0, 0, "1d6 S",   1.0, 6,  ["Rapid(2)","Light","Mounted(2)","Charge(2)"]),
            make_weapon("kilij",           "Kilij",          10, 0, 0, "2d3 S",   1.5, 9,  ["Cleave(3)","Splitting(3)","Breaker(1)"]),
            make_weapon("shamshir",        "Shamshir",       12, 0, 0, "1d6 S",   1.0, 6,  ["Rapid(3)","Precise(2)","Light","Parry(1)"]),
            make_weapon("messer",          "Messer",         12, 0, 0, "1d8 S",   2.0,10,  ["Durable","Reinforced","Cleave(2)","Parry(1)"]),
            make_weapon("dusack",          "Dusack",         10, 0, 0, "1d6 S",   1.0, 6,  ["Rapid(2)","Agile(2)","Parry(2)","Light"]),
            make_weapon("yatagan",         "Yatagan",         8, 0, 0, "1d6 S",   1.5, 8,  ["Hooking(2)","Rapid(2)","Agile(2)","Light"]),
            make_weapon("flyssa",          "Flyssa",          8, 0, 0, "1d6 P/S", 1.0, 7,  ["Precise(1)","Agile(2)","Parry(2)"]),
            make_weapon("pulwar",          "Pulwar",         10, 0, 0, "1d8 S",   2.0,10,  ["Charge(2)","Cleave(2)","Mounted(1)"]),
            make_weapon("cutlass",         "Cutlass",         8, 0, 0, "2d3 S",   1.5,10,  ["Reinforced","Cleave(3)","Parry(1)"]),
            make_weapon("talwar",          "Talwar",          8, 0, 0, "1d8 S",   1.5, 8,  ["Wind-Up(2)","Versatile","Precise(1)"]),
        ],
        "Curved Swords": [
            make_weapon("katana",          "Katana",         25, 0, 0, "1d10 S",   1.8,12, ["Precise(2)","Cleave(2)","Rapid(1)","Two-Handed"]),
            make_weapon("falchion",        "Falchion",       14, 0, 0, "1d8 S",    1.6,10, ["Cleave(3)","Light"]),
            make_weapon("kriegsmesser",    "Kriegsmesser",   18, 0, 0, "1d10 S",   2.2,13, ["Cleave(3)","Reinforced","Two-Handed"]),
            make_weapon("tachi",           "Tachi",          22, 0, 0, "1d8+1 S",  1.9,11, ["Mounted(2)","Cleave(2)","Charge(1)"]),
            make_weapon("miaodao",         "Miaodao",        16, 0, 0, "1d8 S",    1.7,10, ["Cleave(2)","Rapid(1)"]),
        ],
        "Great Curved Swords": [
            make_weapon("dadao",           "Dadao",          20, 0, 0, "1d12 S",   2.8,13, ["Two-Handed","Cleave(4)"]),
            make_weapon("odachi",          "Odachi",         30, 0, 0, "2d6+1 S",  3.2,14, ["Two-Handed","Reach(1)","Cleave(3)"]),
            make_weapon("nodachi",         "Nodachi",        32, 0, 0, "2d6+1 S",  3.4,15, ["Two-Handed","Reach(2)","Cleave(3)"]),
            make_weapon("great_falchion",  "Great Falchion", 22, 0, 0, "1d12 S",   2.9,13, ["Two-Handed","Cleave(4)"]),
            make_weapon("great_kilij",     "Great Kilij",    24, 0, 0, "2d6 S",    3.0,14, ["Two-Handed","Cleave(3)","Splitting(2)"]),
            make_weapon("horse_cleaver",   "Horse Cleaver",  26, 0, 0, "2d6 S",    3.2,14, ["Two-Handed","Anti-Mount","Cleave(3)"]),
        ]
    };
    
    // =========================================================
    // AXES
    // =========================================================
    global.equipment_data.weapons[$ "Axes"] = {
        "Hand Axes": [
            make_weapon("hand_axe",        "Hand Axe",        3, 0, 0, "1d6 S",    1.2, 8,  ["Thrown","Light"]),
            make_weapon("hatchet",         "Hatchet",         2, 0, 0, "1d6 S",    1.0, 7,  ["Thrown","Light","Tool"]),
            make_weapon("francisca",       "Francisca",       4, 0, 0, "1d6 S",    1.3, 8,  ["Thrown Range(20)","Light"]),
            make_weapon("tomahawk",        "Tomahawk",        3, 0, 0, "1d6 S",    1.1, 7,  ["Thrown","Light"]),
            make_weapon("adze",            "Adze",            2, 0, 0, "1d6 S",    1.4, 8,  ["Tool"]),
            make_weapon("ice_axe",         "Ice Axe",         5, 0, 0, "1d6 P/S",  1.3, 9,  ["Tool","Hooking(1)"]),
        ],
        "Battle Axes": [
            make_weapon("battle_axe",      "Battle Axe",      8, 0, 0, "1d8 S",    2.0,11, ["Cleave(2)"]),
            make_weapon("bearded_axe",     "Bearded Axe",     9, 0, 0, "1d8 S",    2.1,11, ["Cleave(2)","Hooking(1)"]),
            make_weapon("broad_axe",       "Broad Axe",      10, 0, 0, "1d10 S",   2.4,12, ["Cleave(3)"]),
            make_weapon("war_axe",         "War Axe",        11, 0, 0, "1d10 S",   2.5,13, ["Cleave(2)","Reinforced"]),
            make_weapon("double_headed_axe","Double-Headed Axe",14,0,0,"1d10 S",  2.8,13, ["Cleave(3)"]),
            make_weapon("tabar",           "Tabar",          10, 0, 0, "1d8 S",    2.2,12, ["Cleave(2)","Mounted(1)"]),
            make_weapon("shepherds_axe",   "Shepherd's Axe",  6, 0, 0, "1d8 S",    2.0,10, ["Tool","Cleave(1)"]),
        ],
        "Great Axes": [
            make_weapon("dane_axe",        "Dane Axe",       16, 0, 0, "1d12 S",   3.2,14, ["Two-Handed","Cleave(4)","Reach(1)"]),
            make_weapon("great_axe",       "Great Axe",      15, 0, 0, "1d12 S",   3.5,15, ["Two-Handed","Cleave(4)"]),
            make_weapon("lochaber_axe",    "Lochaber Axe",   17, 0, 0, "1d12 S",   3.4,14, ["Two-Handed","Cleave(3)","Hooking(1)"]),
            make_weapon("spiked_great_axe","Spiked Great Axe",18,0,0,"1d12 S/P",3.6,15, ["Two-Handed","Cleave(3)"]),
            make_weapon("executioners_axe","Executioner's Axe",20,0,0,"2d6 S",  4.0,16, ["Two-Handed","Cleave(4)","Brutal"]),
        ]
    };
    
    // =========================================================
    // BLUDGEONS
    // =========================================================
    global.equipment_data.weapons[$ "Bludgeons"] = {
        "Small Bludgeons": [
            make_weapon("truncheon",       "Truncheon",       0, 5, 0, "1d4 B",    0.8, 6,  ["Light","Nonlethal"]),
            make_weapon("spiked_truncheon","Spiked Truncheon",1, 0, 0, "1d4+1 B",  0.9, 7,  ["Light"]),
            make_weapon("cudgel",          "Cudgel",          0, 3, 0, "1d4 B",    1.0, 5,  ["Light"]),
            make_weapon("baton",           "Baton",           0, 4, 0, "1d3 B",    0.6, 6,  ["Light","Nonlethal"]),
            make_weapon("nightstick",      "Nightstick",      0, 6, 0, "1d4 B",    0.7, 7,  ["Light","Nonlethal"]),
            make_weapon("sap",             "Sap",             0, 8, 0, "1d3 B",    0.4, 4,  ["Light","Hide(3)","Nonlethal"]),
            make_weapon("tonfa",           "Tonfa",           1, 0, 0, "1d4 B",    0.8, 8,  ["Light","Parry(2)"]),
        ],
        "Medium Bludgeons": [
            make_weapon("warhammer",       "Warhammer",       8, 0, 0, "1d8 B",    2.0,11, ["Crushing(2)","AP(1)"]),
            make_weapon("morningstar",     "Morningstar",    10, 0, 0, "1d8 B",    2.2,12, ["Crushing(2)"]),
            make_weapon("flanged_mace",    "Flanged Mace",    9, 0, 0, "1d8 B",    2.1,12, ["Crushing(3)"]),
            make_weapon("goedendag",       "Goedendag",       6, 0, 0, "1d8 B/P",  2.3,10, ["Versatile"]),
            make_weapon("club",            "Club",            0, 2, 0, "1d6 B",    1.5, 6,  []),
            make_weapon("mace",            "Mace",            5, 0, 0, "1d6+1 B",  1.8,10, ["Crushing(1)"]),
            make_weapon("spiked_club",     "Spiked Club",     1, 0, 0, "1d6+1 B",  1.7, 7,  []),
        ],
        "Great Bludgeons": [
            make_weapon("maul",            "Maul",           12, 0, 0, "2d6 B",    4.0,14, ["Two-Handed","Crushing(3)"]),
            make_weapon("great_club",      "Great Club",      4, 0, 0, "1d10 B",   3.5,10, ["Two-Handed"]),
            make_weapon("great_mace",      "Great Mace",     14, 0, 0, "1d12 B",   3.8,15, ["Two-Handed","Crushing(3)"]),
            make_weapon("kanabo",          "Kanabo",         15, 0, 0, "1d12 B",   4.2,16, ["Two-Handed","Crushing(4)"]),
            make_weapon("flanged_great_mace","Flanged Great Mace",16,0,0,"2d6 B", 4.0,16, ["Two-Handed","Crushing(4)"]),
            make_weapon("lucerne_hammer",  "Lucerne Hammer", 18, 0, 0, "1d10 B/P",3.5,14, ["Two-Handed","Versatile","Hooking(1)"]),
            make_weapon("bec_de_corbin",   "Bec de Corbin",  17, 0, 0, "1d10 B/P",3.4,14, ["Two-Handed","AP(2)","Hooking(1)"]),
        ]
    };
    
    // =========================================================
    // POLEARMS
    // =========================================================
    global.equipment_data.weapons[$ "Polearms"] = {
        "Spears": [
            make_weapon("spear",           "Spear",           2, 0, 0, "1d6 P",    1.5, 8,  ["Reach(2)","Thrown","Versatile"]),
            make_weapon("javelin",         "Javelin",         1, 5, 0, "1d6 P",    1.0, 6,  ["Thrown Range(30)","Light"]),
            make_weapon("partisan",        "Partisan",        8, 0, 0, "1d8 P",    2.0,10,  ["Reach(2)","Parry(1)"]),
            make_weapon("spetum",          "Spetum",          9, 0, 0, "1d8 P",    2.1,10,  ["Reach(2)","Hooking(1)"]),
            make_weapon("ranseur",         "Ranseur",         9, 0, 0, "1d8 P",    2.2,11,  ["Reach(2)","Disarm(2)"]),
            make_weapon("pilum",           "Pilum",           3, 0, 0, "1d6 P",    1.8, 7,  ["Thrown","Armor Piercing(2)"]),
            make_weapon("angon",           "Angon",           3, 0, 0, "1d6 P",    1.7, 7,  ["Thrown","Hooking(1)"]),
            make_weapon("boar_spear",      "Boar Spear",      5, 0, 0, "1d8 P",    2.0, 9,  ["Reach(1)","Stop"]),
            make_weapon("trident",         "Trident",         6, 0, 0, "1d8 P",    2.0, 9,  ["Reach(2)","Disarm(1)"]),
            make_weapon("yari",            "Yari",            7, 0, 0, "1d8 P",    1.9,10,  ["Reach(2)","Precise(1)"]),
            make_weapon("dory",            "Dory",            4, 0, 0, "1d8 P",    2.0, 9,  ["Reach(2)","Formation"]),
        ],
        "Bladed Polearms": [
            make_weapon("halberd",         "Halberd",        12, 0, 0, "1d10 S/P", 2.8,12, ["Reach(2)","Cleave(2)","Hooking(1)","Versatile"]),
            make_weapon("bardiche",        "Bardiche",       11, 0, 0, "1d12 S",   3.0,12, ["Reach(1)","Cleave(3)"]),
            make_weapon("pollaxe",         "Pollaxe",        14, 0, 0, "1d10 S/P", 2.9,13, ["Reach(1)","Versatile","Crushing(2)","Hooking(1)"]),
            make_weapon("glaive",          "Glaive",         10, 0, 0, "1d10 S",   2.5,11, ["Reach(2)","Cleave(2)"]),
            make_weapon("naginata",        "Naginata",       13, 0, 0, "1d10 S",   2.4,11, ["Reach(2)","Cleave(2)","Precise(1)"]),
            make_weapon("guandao",         "Guandao",        14, 0, 0, "1d12 S",   2.8,12, ["Reach(2)","Cleave(3)"]),
            make_weapon("voulge",          "Voulge",         10, 0, 0, "1d10 S",   2.6,11, ["Reach(2)","Cleave(2)"]),
            make_weapon("fauchard",        "Fauchard",       11, 0, 0, "1d10 S",   2.5,11, ["Reach(2)","Hooking(2)"]),
            make_weapon("war_scythe",      "War Scythe",      8, 0, 0, "1d10 S",   2.4, 9,  ["Reach(2)","Cleave(2)"]),
            make_weapon("lochaber_axe_p",  "Lochaber Axe",   12, 0, 0, "1d12 S",   2.9,12, ["Reach(1)","Cleave(3)","Hooking(1)"]),
        ],
        "Hooked Polearms": [
            make_weapon("billhook",        "Billhook",        9, 0, 0, "1d8 S",    2.4,10, ["Reach(2)","Hooking(3)","Disarm(2)"]),
            make_weapon("guisarme",        "Guisarme",       10, 0, 0, "1d8 S",    2.5,11, ["Reach(2)","Hooking(3)"]),
            make_weapon("kama_yari",       "Kama Yari",      11, 0, 0, "1d8 P/S",  2.3,10, ["Reach(2)","Hooking(2)"]),
            make_weapon("ge",              "Ge",              9, 0, 0, "1d8 P/S",  2.4,10, ["Reach(2)","Hooking(2)"]),
            make_weapon("ji",              "Ji",             10, 0, 0, "1d8 P/S",  2.5,11, ["Reach(2)","Hooking(2)","Cleave(1)"]),
            make_weapon("eye_catcher",     "Eye Catcher",    12, 0, 0, "1d6 P",    2.2, 9,  ["Reach(2)","Hooking(4)","Disarm(3)"]),
        ],
        "Great Polearms": [
            make_weapon("pike",            "Pike",            6, 0, 0, "1d8 P",    3.5,12, ["Reach(4)","Formation","Two-Handed"]),
            make_weapon("sarissa",         "Sarissa",         7, 0, 0, "1d8 P",    4.0,13, ["Reach(5)","Formation","Two-Handed"]),
            make_weapon("changqiang",      "Changqiang",      8, 0, 0, "1d10 P",   3.2,12, ["Reach(3)","Two-Handed"]),
            make_weapon("langxian",        "Langxian",       10, 0, 0, "1d8 P",    3.0,11, ["Reach(3)","Entangle"]),
            make_weapon("great_glaive",    "Great Glaive",   15, 0, 0, "1d12 S",   3.5,13, ["Reach(3)","Cleave(3)","Two-Handed"]),
            make_weapon("great_bardiche",  "Great Bardiche", 14, 0, 0, "2d6 S",    3.6,14, ["Reach(2)","Cleave(4)","Two-Handed"]),
        ],
        "Short Polearms": [
            make_weapon("awl_pike",        "Awl Pike",        5, 0, 0, "1d6 P",    1.8, 8,  ["Reach(1)","AP(2)"]),
            make_weapon("short_spear",     "Short Spear",     2, 0, 0, "1d6 P",    1.2, 7,  ["Thrown","Versatile"]),
            make_weapon("assegai",         "Assegai",         3, 0, 0, "1d6 P",    1.3, 7,  ["Thrown","Light"]),
            make_weapon("ikwa",            "Ikwa",            3, 0, 0, "1d6 P",    1.1, 7,  ["Thrown","Light"]),
        ]
    };
    
    // =========================================================
    // WHIPS & FLAILS
    // =========================================================
    global.equipment_data.weapons[$ "Whips & Flails"] = {
        "Whips": [
            make_weapon("whip",            "Whip",            2, 0, 0, "1d3 S",    0.8, 5,  ["Reach(2)","Disarm(2)","Nonlethal"]),
            make_weapon("bull_whip",       "Bull Whip",       3, 0, 0, "1d4 S",    1.0, 6,  ["Reach(3)","Disarm(2)"]),
            make_weapon("chain_whip",      "Chain Whip",      6, 0, 0, "1d4 B/S",  1.5, 8,  ["Reach(2)","Disarm(3)"]),
            make_weapon("nine_tail",       "Nine Tail",       4, 0, 0, "1d4 S",    1.1, 6,  ["Reach(2)","Bleed"]),
            make_weapon("urumi",           "Urumi",          12, 0, 0, "1d6 S",    1.4, 7,  ["Reach(2)","Multi-Attack","Light"]),
            make_weapon("meteor_hammer",   "Meteor Hammer",   8, 0, 0, "1d6 B",    2.0, 9,  ["Reach(3)","Crushing(1)"]),
            make_weapon("rope_dart",       "Rope Dart",       5, 0, 0, "1d4 P",    0.9, 5,  ["Reach(3)","Thrown"]),
            make_weapon("kusarigama",      "Kusarigama",     10, 0, 0, "1d6 S/B",  1.8, 9,  ["Reach(2)","Hooking(2)","Versatile"]),
        ],
        "Flails": [
            make_weapon("grain_flail",     "Grain Flail",     1, 0, 0, "1d6 B",    1.8, 7,  ["Tool","Ignore Shield"]),
            make_weapon("ball_and_chain",  "Ball and Chain",  6, 0, 0, "1d8 B",    2.5,10, ["Ignore Shield","Crushing(1)"]),
            make_weapon("morning_star_flail","Morning Star Flail",9,0,0,"1d8 B", 2.6,11, ["Ignore Shield","Crushing(2)"]),
            make_weapon("one_ball_flail",  "One Ball Flail",  7, 0, 0, "1d8 B",    2.4,10, ["Ignore Shield"]),
            make_weapon("two_ball_flail",  "Two Ball Flail",  9, 0, 0, "1d8 B",    2.8,11, ["Ignore Shield","Multi-Attack"]),
            make_weapon("three_ball_flail","Three Ball Flail",11,0,0,"1d8 B",   3.0,12, ["Ignore Shield","Multi-Attack"]),
            make_weapon("spiked_ball_flail","Spiked Ball Flail",10,0,0,"1d8+1 B",2.7,11, ["Ignore Shield"]),
            make_weapon("flanged_head_flail","Flanged Head Flail",10,0,0,"1d8 B",2.6,12, ["Ignore Shield","Crushing(2)"]),
            make_weapon("great_flail",     "Great Flail",    14, 0, 0, "1d12 B",   3.8,14, ["Two-Handed","Ignore Shield","Crushing(2)"]),
        ]
    };
    
    // =========================================================
    // TOOLS & IMPROVISED
    // =========================================================
    global.equipment_data.weapons[$ "Tools & Improvised"] = {
        "Tools": [
            make_weapon("hammer",          "Hammer",          0, 5, 0, "1d4 B",    1.2, 8,  ["Tool"]),
            make_weapon("wrench",          "Wrench",          0, 8, 0, "1d4 B",    1.0, 9,  ["Tool"]),
            make_weapon("pitchfork",       "Pitchfork",       1, 0, 0, "1d6 P",    2.0, 7,  ["Tool","Reach(1)"]),
            make_weapon("shovel",          "Shovel",          0, 8, 0, "1d6 B",    2.2, 8,  ["Tool"]),
            make_weapon("rake",            "Rake",            0, 4, 0, "1d4 S",    1.5, 5,  ["Tool"]),
            make_weapon("stoker",          "Stoker",          0, 6, 0, "1d4 B",    1.3, 7,  ["Tool"]),
            make_weapon("branding_iron",   "Branding Iron",   2, 0, 0, "1d4 B",    1.4, 9,  ["Tool","Fire"]),
            make_weapon("tongs",           "Tongs",           0, 7, 0, "1d3 B",    1.0, 8,  ["Tool","Grapple"]),
        ],
        "Improvised": [
            make_weapon("pot_pan",         "Pot/Pan",         0, 2, 0, "1d4 B",    1.5, 5,  ["Improvised"]),
            make_weapon("table_leg",       "Table Leg",       0, 0, 0, "1d6 B",    2.0, 4,  ["Improvised"]),
            make_weapon("bottle",          "Bottle",          0, 1, 0, "1d3 S",    0.5, 2,  ["Improvised","Thrown","Shatter"]),
            make_weapon("wooden_flagon",   "Wooden Flagon",   0, 1, 0, "1d3 B",    0.8, 3,  ["Improvised"]),
            make_weapon("metal_flagon",    "Metal Flagon",    0, 3, 0, "1d4 B",    1.0, 5,  ["Improvised"]),
        ]
    };
    
    // =========================================================
    // RANGED
    // =========================================================
    global.equipment_data.weapons[$ "Ranged"] = {
        "Bows": [
            make_weapon("shortbow",        "Shortbow",        8, 0, 0, "—",        1.5, 8,  ["Ranged","Two-Handed"]),
            make_weapon("longbow",         "Longbow",        15, 0, 0, "—",        2.0,10,  ["Ranged","Two-Handed","Range+"]),
            make_weapon("recurve_bow",     "Recurve Bow",    18, 0, 0, "—",        1.7, 9,  ["Ranged","Two-Handed","Powerful"]),
            make_weapon("composite_bow",   "Composite Bow",  25, 0, 0, "—",        1.8,11,  ["Ranged","Two-Handed","Powerful","Mounted"]),
        ],
        "Crossbows": [
            make_weapon("light_crossbow",  "Light Crossbow", 12, 0, 0, "—",        2.0, 9,  ["Ranged","Reload(1)"]),
            make_weapon("heavy_crossbow",  "Heavy Crossbow", 20, 0, 0, "—",        3.5,12,  ["Ranged","Reload(2)","Powerful"]),
            make_weapon("hand_crossbow",   "Hand Crossbow",  18, 0, 0, "—",        1.2, 7,  ["Ranged","One-Handed","Reload(1)"]),
            make_weapon("repeating_crossbow","Repeating Crossbow",35,0,0,"—",     2.8,10,  ["Ranged","Reload(0)","Complex"]),
        ],
        "Thrown": [
            // You can expand this later with dedicated thrown weapons
        ],
        "Steam Guns": [
            // Placeholder for later
        ],
        "Siege Engines": [
            // Placeholder for later
        ]
    };
    
    show_debug_message("Weapon data fully reorganized and loaded");
}