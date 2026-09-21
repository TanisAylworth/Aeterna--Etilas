function combat_test_init()
{
    global.combat_grid = {
        cols: 16,
        rows: 10,
        cell: 48,
        origin_x: 80,
        origin_y: 60,
        feet_per_cell: 5
    };
    
    global.combat_log = [];
    global.combat_selected = noone;
    global.combat_mode = "";
    global.combat_round = 1;
    global.combat_pending = undefined;
    global.combat_dodge_inst = noone;
    global.combat_waiting = true;
    
    global.test_pc = build_combatant_from_creation(global.char_creation);
    global.test_enemy = build_combatant_placeholder_enemy();
    
    combat_economy_reset(global.test_pc);
    combat_economy_reset(global.test_enemy);
    
    with (combatant_obj)
        instance_destroy();
    
    // 20 ft apart for easier melee tests; use 12 for 50 ft
    spawn_combatant(global.test_pc, 2, 4, true);
    spawn_combatant(global.test_enemy, 6, 4, false);
    
    combat_test_roll_initiatives(); // sets first, second, actor
global.combat_phase = "round1_order";
global.combat_enemy_pending = (global.combat_actor == "enemy");
    
    array_push(global.combat_log, "Init complete.");
    array_push(global.combat_log,
        "Round 1 — " + string(global.combat_first) + " first."
        + (global.combat_enemy_pending ? " Space = enemy acts." : " Your turn."));
}

function combat_grid_to_world(gx, gy)
{
    var g = global.combat_grid;
    return {
        x: g.origin_x + gx * g.cell + g.cell * 0.5,
        y: g.origin_y + gy * g.cell + g.cell * 0.5
    };
}

function combat_test_draw_grid()
{
    var g = global.combat_grid;
    
    for (var cx = 0; cx < g.cols; cx++)
    {
        for (var cy = 0; cy < g.rows; cy++)
        {
            var x1 = g.origin_x + cx * g.cell;
            var y1 = g.origin_y + cy * g.cell;
            var x2 = x1 + g.cell;
            var y2 = y1 + g.cell;
            
            var shade = ((cx + cy) mod 2 == 0)
                ? make_color_rgb(70, 70, 70)
                : make_color_rgb(45, 45, 45);
            
            draw_set_color(shade);
            draw_rectangle(x1, y1, x2 - 1, y2 - 1, false);
            draw_set_color(make_color_rgb(110, 110, 110));
            draw_rectangle(x1, y1, x2 - 1, y2 - 1, true);
        }
    }
}


function spawn_combatant(data, gx, gy, is_player)
{
    var pos = combat_grid_to_world(gx, gy);
    var inst = instance_create_layer(pos.x, pos.y, "Instances", combatant_obj);
    
    inst.combatant_data = data;
    inst.grid_x = gx;
    inst.grid_y = gy;
    inst.is_player = is_player;
    
    var key = variable_struct_exists(data, "species_key") ? data.species_key : "muttish_human";
    inst.sprite_index = species_to_sprite(key);
    inst.image_speed = 0;
    
    // Optional tint: player blue-ish, enemy red-ish
    inst.image_blend = is_player ? c_white : make_color_rgb(255, 200, 200);
    
    return inst;
}


function build_combatant_from_creation(cc)
{
    var species_key = cc.locked_species;
    var sp = global.species_data[$ species_key];
    
    var attrs = {};
    // copy from cc.assigned — keys match your ATTRIBUTES list
    if (variable_struct_exists(cc, "assigned"))
    {
        var names = variable_struct_get_names(cc.assigned);
        for (var i = 0; i < array_length(names); i++)
            attrs[$ names[i]] = cc.assigned[$ names[i]];
    }
	
	var reflex = 10;
	var dexterity = 10;
	var	move_speed_ft = 30;
if (variable_struct_exists(cc, "assigned"))
{
    if (variable_struct_exists(cc.assigned, "Reflexes"))
        reflex = cc.assigned.Reflexes;
    else if (variable_struct_exists(cc.assigned, "reflexes"))
        reflex = cc.assigned.reflexes;
		if (variable_struct_exists(cc.assigned, "Dexterity"))
        dexterity = cc.assigned.Dexterity;
    else if (variable_struct_exists(cc.assigned, "dexterity"))
        dexterity = cc.assigned.dexterity;
		
}


    
    return {
        name: "Player",
        species_key: species_key,
        species_name: sp.name,
        attributes: attrs,
		reflex: reflex,
		dexterity: dexterity,
		move_speed_ft: 30,
		initiative_tn: combat_calc_initiative_tn(reflex),
        skill_ranks: variable_struct_exists(cc, "skill_ranks") ? cc.skill_ranks : {},
        talent_ranks: variable_struct_exists(cc, "talent_ranks") ? cc.talent_ranks : {},
        cdt: get_current_cdt(cc), // or whatever you use
        is_player: true,
		// Melee only
weapon: {
    name: "Short Sword",
    range_ft: 5          // no Range (X) → melee
},

    };
}

function build_combatant_placeholder_enemy()
{
	var reflex = 12;
	var move_speed_ft = 30;
    return {
        name: "Goblin Raider",
        species_key: "goblin",
        species_name: "Goblin",
		move_speed_ft: 30,
        attributes: {
            Strength: 8, Dexterity: 12, Endurance: 8, Reflex: 12
            // ... fill defaults
        },
		reflex: reflex,
    initiative_tn: combat_calc_initiative_tn(reflex),
        skill_ranks: { "Weapon Skill (Knives)": 1 },
        talent_ranks: {},
        cdt: 4,
        is_player: false,
		// Melee only
weapon: {
    name: "Short Sword",
    range_ft: 5          // no Range (X) → melee
},

    };
}


function combat_test_update()
{
    if (!variable_global_exists("combat_mode"))
        return;
    
    // ----- Esc -----
    if (keyboard_check_pressed(vk_escape))
    {
        if (global.combat_mode == "attack" || global.combat_mode == "move")
        {
            global.combat_mode = "";
            array_push(global.combat_log, "Cancelled.");
            return;
        }
        room_goto(Character_Creator);
        return;
    }
    
    if (variable_global_exists("combat_enemy_pending") && global.combat_enemy_pending)
{
    if (global.combat_actor != "enemy")
    {
        global.combat_enemy_pending = false;
    }
    else if (keyboard_check_pressed(vk_space))
    {
        global.combat_enemy_pending = false;
        combat_enemy_take_turn();
    }
    else
        return; // wait for Space only on enemy turn
}
    
    // ----- Choose defense -----
    if (global.combat_mode == "choose_defense")
    {
        if (keyboard_check_pressed(ord("P")))
        {
            combat_resolve_defense("parry");
            return;
        }
        if (keyboard_check_pressed(ord("O")))
        {
            combat_resolve_defense("dodge");
            return;
        }
        if (mouse_check_button_pressed(mb_left))
        {
            var bx = 16;
            var by = 200;
            if (point_in_rectangle(mouse_x, mouse_y, bx, by, bx + 200, by + 28))
            {
                combat_resolve_defense("parry");
                return;
            }
            if (point_in_rectangle(mouse_x, mouse_y, bx, by + 32, bx + 200, by + 60))
            {
                combat_resolve_defense("dodge");
                return;
            }
        }
        return;
    }
    
    // ----- Dodge step (5 ft) -----
    if (global.combat_mode == "dodge_step")
    {
        if (!mouse_check_button_pressed(mb_left))
            return;
        
        var inst = global.combat_dodge_inst;
        if (inst == noone || !instance_exists(inst))
        {
            global.combat_mode = "";
            global.combat_pending = undefined;
            combat_finish_actor_action();
            return;
        }
        
        var g = global.combat_grid;
        var gx = floor((mouse_x - g.origin_x) / g.cell);
        var gy = floor((mouse_y - g.origin_y) / g.cell);
        var dist = combat_grid_distance_cells(inst.grid_x, inst.grid_y, gx, gy);
        
        if (gx < 0 || gy < 0 || gx >= g.cols || gy >= g.rows || dist != 1)
        {
            array_push(global.combat_log, "Dodge step: click adjacent cell (5 ft).");
            return;
        }
        
        var blocked = false;
        with (combatant_obj)
        {
            if (id != inst && grid_x == gx && grid_y == gy)
                blocked = true;
        }
        if (blocked)
        {
            array_push(global.combat_log, "Cell occupied.");
            return;
        }
        
        combat_snap_instance_to_grid(inst, gx, gy);
        array_push(global.combat_log,
            inst.combatant_data.name + " steps to " + string(gx) + "," + string(gy));
        global.combat_mode = "";
        global.combat_pending = undefined;
        global.combat_dodge_inst = noone;
        combat_finish_actor_action();
        return;
    }
    
    // ----- Mouse actions below -----
    if (!mouse_check_button_pressed(mb_left))
        return;
    
    var mx = mouse_x;
    var my = mouse_y;
    
    // Move
    if (global.combat_mode == "move")
    {
        if (global.combat_selected == noone || !instance_exists(global.combat_selected))
        {
            global.combat_mode = "";
            return;
        }
        
        var g = global.combat_grid;
        var gx = floor((mx - g.origin_x) / g.cell);
        var gy = floor((my - g.origin_y) / g.cell);
        
        if (gx < 0 || gy < 0 || gx >= g.cols || gy >= g.rows)
        {
            array_push(global.combat_log, "Click a square on the grid.");
            return;
        }
        
        var inst = global.combat_selected;
        var data = inst.combatant_data;
        var max_c = combat_max_move_cells(data);
        var dist_c = combat_grid_distance_cells(inst.grid_x, inst.grid_y, gx, gy);
        
        if (dist_c > max_c)
        {
            array_push(global.combat_log,
                "Too far (" + string(dist_c * 5) + " ft; max " + string(max_c * 5) + " ft).");
            return;
        }
        
        var blocked = false;
        with (combatant_obj)
        {
            if (id != inst && grid_x == gx && grid_y == gy)
                blocked = true;
        }
        if (blocked)
        {
            array_push(global.combat_log, "Cell occupied.");
            return;
        }
        
        combat_snap_instance_to_grid(inst, gx, gy);
        array_push(global.combat_log,
            data.name + " moves to " + string(gx) + "," + string(gy)
            + " (" + string(dist_c * 5) + " ft).");
        global.combat_mode = "";
        return;
    }
    
    // Attack
    if (global.combat_mode == "attack")
    {
        if (global.combat_selected == noone || !instance_exists(global.combat_selected))
        {
            global.combat_mode = "";
            return;
        }
        
        var atk = global.combat_selected;
        var target = noone;
        with (combatant_obj)
        {
            if (id == atk) continue;
            if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom))
                target = id;
        }
        
        if (target == noone)
        {
            array_push(global.combat_log, "No target under cursor.");
            return;
        }
        
        if (!combat_in_weapon_range(atk, target))
        {
            array_push(global.combat_log,
                "Out of range (" + string(combat_instances_distance_feet(atk, target))
                + " ft; need " + string(combat_get_weapon_range_ft(atk.combatant_data)) + " ft).");
            return;
        }
        
        if (!combat_economy_spend(atk.combatant_data, "complex"))
        {
            array_push(global.combat_log, "No complex action left.");
            global.combat_mode = "";
            return;
        }
        
        combat_resolve_attack(atk.combatant_data, target.combatant_data);
        global.combat_mode = ""; // may become choose_defense inside resolve
        return;
    }
    
    // Panel
    if (global.combat_selected != noone && instance_exists(global.combat_selected))
    {
        if (combat_try_click_action_panel(mx, my))
            return;
    }
    
    // Select
    var hit = noone;
    with (combatant_obj)
    {
        if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom))
            hit = id;
    }
    global.combat_selected = hit;
    if (hit != noone)
        array_push(global.combat_log, "Selected " + hit.combatant_data.name);
}


function combat_test_draw()
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    
    combat_test_draw_grid();
    
    // move / attack overlays (same as you had)...
    if (variable_global_exists("combat_mode") && global.combat_mode == "move"
        && global.combat_selected != noone && instance_exists(global.combat_selected))
    {
        var inst = global.combat_selected;
        var max_c = combat_max_move_cells(inst.combatant_data);
        var g = global.combat_grid;
        for (var cx = 0; cx < g.cols; cx++)
        for (var cy = 0; cy < g.rows; cy++)
        {
            if (combat_grid_distance_cells(inst.grid_x, inst.grid_y, cx, cy) <= max_c)
            {
                var x1 = g.origin_x + cx * g.cell;
                var y1 = g.origin_y + cy * g.cell;
                draw_set_alpha(0.25);
                draw_set_color(c_aqua);
                draw_rectangle(x1, y1, x1 + g.cell - 1, y1 + g.cell - 1, false);
                draw_set_alpha(1);
            }
        }
    }
    
    if (variable_global_exists("combat_mode") && global.combat_mode == "attack"
        && global.combat_selected != noone && instance_exists(global.combat_selected))
    {
        var atk = global.combat_selected;
        with (combatant_obj)
        {
            if (id == atk) continue;
            draw_set_color(combat_in_weapon_range(atk, id) ? c_lime : c_red);
            draw_circle(x, y, 22, true);
        }
    }
    
    // Log
    if (variable_global_exists("combat_log") && is_array(global.combat_log))
    {
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        var ly = 8;
        var n = array_length(global.combat_log);
        var start = max(0, n - 14);
        for (var i = start; i < n; i++)
        {
            draw_text(8, ly, global.combat_log[i]);
            ly += 16;
        }
    }
    
    // Status
    draw_set_color(c_yellow);
    var status = "actor=" + string(global.combat_actor)
        + "  mode=" + string(global.combat_mode)
        + "  phase=" + string(global.combat_phase);
    if (variable_global_exists("combat_enemy_pending") && global.combat_enemy_pending)
        status += "  [SPACE = enemy]";
    draw_text(8, room_height - 24, status);
    
    combat_draw_action_panel();
    
    // Defense UI on top
    if (variable_global_exists("combat_mode") && global.combat_mode == "choose_defense")
    {
        draw_set_color(c_yellow);
        draw_text(16, 180, "DEFEND: [P] Parry   [O] Dodge");
        draw_set_color(make_color_rgb(60, 60, 40));
        draw_rectangle(16, 200, 216, 228, false);
        draw_rectangle(16, 232, 216, 260, false);
        draw_set_color(c_white);
        draw_text(24, 206, "Parry");
        draw_text(24, 238, "Dodge");
    }
}

function combat_action_panel_layout()
{
    var g = global.combat_grid;
    var panel_y = room_height - 160;
    if (variable_global_exists("combat_grid"))
        panel_y = min(room_height - 160, g.origin_y + g.rows * g.cell + 16);
    
    return {
        x: 16,
        y: panel_y,
        w: 280,
        row_h: 28,
        labels: ["Attack (Complex)", "Move (Simple)", "Parry (Defensive)", "Dodge (Defensive)"],
        kinds:  ["complex", "simple", "defensive", "defensive"],
        ids:    ["attack", "move", "parry", "dodge"]
    };
}

function combat_draw_action_panel()
{
    if (!variable_global_exists("combat_selected"))
        return;
    if (global.combat_selected == noone || !instance_exists(global.combat_selected))
        return;
    
    var data = global.combat_selected.combatant_data;
    if (!variable_struct_exists(data, "economy"))
        combat_economy_reset(data);
    
    var e = data.economy;
    var P = combat_action_panel_layout();
    
    draw_set_color(make_color_rgb(25, 25, 30));
    draw_rectangle(P.x, P.y, P.x + P.w, P.y + 150, false);
    draw_set_color(c_white);
    draw_rectangle(P.x, P.y, P.x + P.w, P.y + 150, true);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(P.x + 8, P.y + 6, data.name);
    draw_text(P.x + 8, P.y + 24,
        "C:" + string(e.complex)
        + "  S:" + string(e.simple)
        + "  D:" + string(e.defensive)
        + "  R:" + string(e.reaction));
    
    var mx = mouse_x;
    var my = mouse_y;
    
    for (var i = 0; i < array_length(P.labels); i++)
    {
        var by = P.y + 48 + i * P.row_h;
        var can = combat_economy_can(data, P.kinds[i]);
        var hover = point_in_rectangle(mx, my, P.x + 8, by, P.x + P.w - 8, by + P.row_h - 4);
        
        draw_set_color(!can ? make_color_rgb(40, 40, 40)
            : (hover ? make_color_rgb(70, 70, 40) : make_color_rgb(45, 45, 55)));
        draw_rectangle(P.x + 8, by, P.x + P.w - 8, by + P.row_h - 4, false);
        draw_set_color(can ? c_white : c_dkgray);
        draw_text(P.x + 14, by + 4, P.labels[i]);
    }
}

function combat_try_click_action_panel(mx, my)
{
    if (global.combat_selected == noone || !instance_exists(global.combat_selected))
        return false;
    
    var data = global.combat_selected.combatant_data;
    var P = combat_action_panel_layout();
    
    for (var i = 0; i < array_length(P.ids); i++)
    {
        var by = P.y + 48 + i * P.row_h;
        if (!point_in_rectangle(mx, my, P.x + 8, by, P.x + P.w - 8, by + P.row_h - 4))
            continue;
        
        var _id = P.ids[i];
        var kind = P.kinds[i];
        
        if (!combat_economy_can(data, kind))
        {
            array_push(global.combat_log, "No " + kind + " action left.");
            return true;
        }
        
        if (!global.combat_selected.is_player)
        {
            array_push(global.combat_log, "Enemy actions are automatic for now.");
            return true;
        }
        if (_id == "attack" || _id == "move")
		{
		    if (!combat_is_player_turn())
		    {
		        array_push(global.combat_log, "Not your turn.");
		        return true;
		    }
		}
        if (_id == "attack")
        {
            global.combat_mode = "attack";
            array_push(global.combat_log, "Attack: click a target.");
            return true;
        }
        else if (_id == "move")
        {
            if (!combat_economy_spend(data, "simple"))
            {
                array_push(global.combat_log, "No simple action left.");
                return true;
            }
            global.combat_mode = "move";
            array_push(global.combat_log, "Move: click a target cell.");
            return true;
        }
        else if (_id == "parry" || _id == "dodge")
        {
            if (!combat_economy_spend(data, "defensive"))
                return true;
            data.declared_defense = _id;
            array_push(global.combat_log, data.name + " readies " + _id + ".");
            return true;
        }
        
        return true;
    }
    return false;
}




function combat_economy_new()
{
    return {
        complex: 1,
        simple: 1,
        defensive: 1,
        reaction: 1
    };
}

function combat_economy_reset(combatant)
{
    combatant.economy = combat_economy_new();
}

function combat_economy_can(combatant, kind)
{
    if (!is_struct(combatant))
        return false;
    if (!variable_struct_exists(combatant, "economy"))
        combat_economy_reset(combatant);
    return combatant.economy[$ kind] > 0;
}

function combat_economy_spend(combatant, kind)
{
    if (!combat_economy_can(combatant, kind))
        return false;
    combatant.economy[$ kind] -= 1;
    return true;
}


function combat_get_move_speed_ft(combatant)
{
    if (is_struct(combatant) && variable_struct_exists(combatant, "move_speed_ft"))
        return combatant.move_speed_ft;
    return 30;
}

function combat_max_move_cells(combatant)
{
    var fpc = 5;
    if (variable_global_exists("combat_grid")
        && variable_struct_exists(global.combat_grid, "feet_per_cell"))
        fpc = global.combat_grid.feet_per_cell;
    
    return max(1, floor(combat_get_move_speed_ft(combatant) / fpc));
}

function combat_grid_distance_cells(ax, ay, bx, by)
{
    return max(abs(ax - bx), abs(ay - by));
}

function combat_grid_distance_feet(ax, ay, bx, by)
{
    var fpc = 5;
    if (variable_global_exists("combat_grid")
        && variable_struct_exists(global.combat_grid, "feet_per_cell"))
        fpc = global.combat_grid.feet_per_cell;
    
    return combat_grid_distance_cells(ax, ay, bx, by) * fpc;
}

function combat_instances_distance_feet(inst_a, inst_b)
{
    return combat_grid_distance_feet(inst_a.grid_x, inst_a.grid_y, inst_b.grid_x, inst_b.grid_y);
}

function combat_get_weapon_range_ft(combatant)
{
    if (is_struct(combatant)
        && variable_struct_exists(combatant, "weapon")
        && variable_struct_exists(combatant.weapon, "range_ft"))
        return combatant.weapon.range_ft;
    return 5;
}

function combat_in_weapon_range(attacker_inst, defender_inst)
{
    var range_ft = combat_get_weapon_range_ft(attacker_inst.combatant_data);
    var dist = combat_instances_distance_feet(attacker_inst, defender_inst);
    if (range_ft <= 5)
        return dist <= 5;
    return dist <= range_ft;  // you cut off here at "return dist <="
}

function combat_snap_instance_to_grid(inst, gx, gy)
{
    inst.grid_x = gx;
    inst.grid_y = gy;
    var pos = combat_grid_to_world(gx, gy);
    inst.x = pos.x;
    inst.y = pos.y;
}

function combat_get_weapon_tn(combatant)
{
    var dex = 10;
    if (variable_struct_exists(combatant, "attributes"))
    {
        if (variable_struct_exists(combatant.attributes, "Dexterity"))
            dex = combatant.attributes.Dexterity;
        else if (variable_struct_exists(combatant.attributes, "dexterity"))
            dex = combatant.attributes.dexterity;
    }
    
    var ranks = 0;
    if (variable_struct_exists(combatant, "skill_ranks"))
    {
        var keys = variable_struct_get_names(combatant.skill_ranks);
        for (var i = 0; i < array_length(keys); i++)
        {
            if (string_pos("Weapon Skill", keys[i]) == 1)
            {
                ranks = combatant.skill_ranks[$ keys[i]];
                break;
            }
        }
    }
    
    return dex + ranks;
}

function combat_resolve_attack(attacker, defender)
{
    var atk = combat_roll_under_dos(combat_get_weapon_tn(attacker));
    
    array_push(global.combat_log,
        attacker.name + " attacks: TN " + string(atk.tn)
        + " d20 " + string(atk.roll) + " → DoS " + string(atk.dos));
    
    global.combat_pending = {
        attacker: attacker,
        defender: defender,
        attack_dos: atk.dos,
        attack_tn: atk.tn,
        attack_roll: atk.roll
    };
    
    if (!defender.is_player)
    {
        if (combat_get_weapon_skill_ranks(defender) > 0)
            combat_resolve_defense("parry");
        else
            combat_resolve_defense("dodge");
    }
    else
    {
        global.combat_mode = "choose_defense";
        array_push(global.combat_log, "Choose defense: P = Parry, O = Dodge");
    }
}

function combat_resolve_defense(kind)
{
    if (!variable_global_exists("combat_pending") || global.combat_pending == undefined)
        return;
    
    var pend = global.combat_pending;
    var def = pend.defender;
    var atk_dos = pend.attack_dos;
    
    var tn = (kind == "parry") ? combat_parry_tn(def) : combat_dodge_tn(def);
    var label = (kind == "parry") ? "Parry" : "Dodge";
    var chk = combat_roll_under_dos(tn);
    
    array_push(global.combat_log,
        def.name + " " + label + ": TN " + string(chk.tn)
        + " d20 " + string(chk.roll) + " → DoS " + string(chk.dos));
    
    if (chk.dos >= atk_dos)
    {
        array_push(global.combat_log,
            label + " succeeds (DoS " + string(chk.dos) + " vs " + string(atk_dos) + ").");
    }
    else
    {
        array_push(global.combat_log,
            "Attack lands (DoS " + string(atk_dos) + " vs " + label + " " + string(chk.dos) + ").");
        
        var dmg = irandom_range(1, 6);
        if (!variable_struct_exists(def, "cdt"))
            def.cdt = 6;
        def.cdt -= dmg;
        
        array_push(global.combat_log,
            def.name + " takes " + string(dmg) + " → CDT " + string(def.cdt));
        
        if (def.cdt <= 0)
            array_push(global.combat_log, def.name + " is down!");
    }
    
    if (kind == "dodge")
    {
        global.combat_mode = "dodge_step";
        global.combat_dodge_inst = combat_find_instance_for_data(def);
        array_push(global.combat_log, "Dodge: click adjacent cell (5 ft).");
        return;
    }
    
    global.combat_pending = undefined;
    global.combat_mode = "";
    combat_finish_actor_action();
}


function combat_roll_under_dos(tn)
{
    var roll = irandom_range(1, 20);
    var dos = tn - roll; // + = success degrees, - = failure
    return {
        tn: tn,
        roll: roll,
        dos: dos
    };
}



function combat_get_weapon_skill_ranks(combatant)
{
    var ranks = 0;
    if (!variable_struct_exists(combatant, "skill_ranks"))
        return ranks;
    var keys = variable_struct_get_names(combatant.skill_ranks);
    for (var i = 0; i < array_length(keys); i++)
    {
        if (string_pos("Weapon Skill", keys[i]) == 1)
        {
            ranks = combatant.skill_ranks[$ keys[i]];
            break;
        }
    }
    return ranks;
}

function combat_parry_tn(combatant)
{
    return combat_get_reflex(combatant) + combat_get_weapon_skill_ranks(combatant);
}

function combat_dodge_tn(combatant)
{
    // Later: Reflex + Tumbling / Dancing / etc.
    return combat_get_reflex(combatant);
}




function combat_find_instance_for_data(data)
{
    var found = noone;
    with (combatant_obj)
    {
        if (combatant_data == data)
            found = id;
    }
    // Fallback by name
    if (found == noone)
    {
        with (combatant_obj)
        {
            if (combatant_data.name == data.name)
                found = id;
        }
    }
    return found;
}



function combat_is_player_turn()
{
    return variable_global_exists("combat_actor")
        && global.combat_actor == "player";
}

function combat_is_enemy_turn()
{
    return variable_global_exists("combat_actor")
        && global.combat_actor == "enemy";
}



function combat_finish_actor_action()
{
    // Never leave enemy "pending" unless we intentionally start their turn
    global.combat_enemy_pending = false;
    
    if (!variable_global_exists("combat_phase"))
        return;
    
    if (global.combat_phase != "round1_order")
    {
        array_push(global.combat_log, "Action resolved.");
        return;
    }
    
    if (global.combat_actor == global.combat_first)
    {
        // First actor done → second actor
        global.combat_actor = global.combat_second;
        array_push(global.combat_log, "— " + string(global.combat_actor) + "'s turn —");
        
        if (global.combat_actor == "enemy")
            global.combat_enemy_pending = true; // Space to act
        else
            global.combat_enemy_pending = false; // player can act now
    }
    else
    {
        // Second actor done → round 2
        global.combat_phase = "simultaneous";
        global.combat_round = 2;
        global.combat_actor = "player";
        global.combat_enemy_pending = false;
        combat_economy_reset(global.test_pc);
        combat_economy_reset(global.test_enemy);
        array_push(global.combat_log, "— Round 2 (open) —");
    }
}


function combat_enemy_take_turn()
{
    array_push(global.combat_log, "Goblin acts...");
    
    // Find instances
    var enemy_inst = noone;
    var player_inst = noone;
    with (combatant_obj)
    {
        if (is_player) player_inst = id;
        else enemy_inst = id;
    }
    if (enemy_inst == noone || player_inst == noone)
        return;
    
    var ed = enemy_inst.combatant_data;
    var pd = player_inst.combatant_data;
    
    // If in melee range → attack player
    if (combat_in_weapon_range(enemy_inst, player_inst))
    {
        if (combat_economy_can(ed, "complex"))
        {
            combat_economy_spend(ed, "complex");
            // Reuse same resolve — player will get choose_defense
            combat_resolve_attack(ed, pd);
            // finish_actor runs after defense / dodge step
            return;
        }
    }
    
    // Else move closer (up to move speed)
    if (combat_economy_can(ed, "simple"))
    {
        combat_economy_spend(ed, "simple");
        combat_enemy_step_toward(enemy_inst, player_inst);
    }
    
    // If still no attack this turn, pass
    if (global.combat_mode != "choose_defense" && global.combat_mode != "dodge_step")
        combat_finish_actor_action();
}

function combat_enemy_step_toward(enemy_inst, player_inst)
{
    var max_c = combat_max_move_cells(enemy_inst.combatant_data);
    var best_gx = enemy_inst.grid_x;
    var best_gy = enemy_inst.grid_y;
    var best_d = combat_grid_distance_cells(
        enemy_inst.grid_x, enemy_inst.grid_y,
        player_inst.grid_x, player_inst.grid_y);
    
    // Try cells within move range; pick one that reduces distance
    for (var dx = -max_c; dx <= max_c; dx++)
    for (var dy = -max_c; dy <= max_c; dy++)
    {
        var nx = enemy_inst.grid_x + dx;
        var ny = enemy_inst.grid_y + dy;
        if (combat_grid_distance_cells(enemy_inst.grid_x, enemy_inst.grid_y, nx, ny) > max_c)
            continue;
        if (nx < 0 || ny < 0 || nx >= global.combat_grid.cols || ny >= global.combat_grid.rows)
            continue;
        
        var occupied = false;
        with (combatant_obj)
        {
            if (grid_x == nx && grid_y == ny) occupied = true;
        }
        if (occupied) continue;
        
        var d = combat_grid_distance_cells(nx, ny, player_inst.grid_x, player_inst.grid_y);
        if (d < best_d)
        {
            best_d = d;
            best_gx = nx;
            best_gy = ny;
        }
    }
    
    if (best_gx != enemy_inst.grid_x || best_gy != enemy_inst.grid_y)
    {
        combat_snap_instance_to_grid(enemy_inst, best_gx, best_gy);
        array_push(global.combat_log,
            enemy_inst.combatant_data.name + " moves to "
            + string(best_gx) + "," + string(best_gy));
    }
    else
        array_push(global.combat_log, "Goblin holds position.");
}

