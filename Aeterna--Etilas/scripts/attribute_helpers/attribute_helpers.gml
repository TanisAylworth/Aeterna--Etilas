function array_copy_simple(arr)
{
    if (!is_array(arr)) return [];

    var new_arr = [];
    var len = array_length(arr);

    for (var i = 0; i < len; i++)
    {
        new_arr[i] = arr[i];
    }

    return new_arr;
}



function array_delete_value(arr, value)
{
    if (!is_array(arr)) return [];

    var out = array_copy_simple(arr);

    for (var i = 0; i < array_length(out); i++)
    {
        if (out[i] == value)
        {
            array_delete(out, i, 1);
            break;
        }
    }

    return out;
}


function array_index_of(arr, value)
{
    if (!is_array(arr)) return -1;

    var len = array_length(arr);

    for (var i = 0; i < len; i++)
    {
        if (is_struct(arr[i]) && is_struct(value))
        {
            if (arr[i] == value) return i; // strict reference check (GMS 2.3+ safe behavior equivalent)
        }
        else if (arr[i] == value)
        {
            return i;
        }
    }

    return -1;
}


function assign_roll_raw(cc, attr, roll_index)
{
    if (!is_struct(cc)) return undefined;
    if (!is_array(cc.roll_pool)) return undefined;

    var len = array_length(cc.roll_pool);
    if (roll_index < 0 || roll_index >= len) return undefined;

    var roll = cc.roll_pool[roll_index];

    if (!is_struct(cc.assigned))
        cc.assigned = {};

    var old = undefined;

    if (is_real(cc.assigned[$ attr]))
        old = cc.assigned[$ attr];

    // REMOVE from pool ONLY (no snapshot logic here)
    array_delete(cc.roll_pool, roll_index, 1);

    return old;
}


function assign_roll(cc, attr)
{
	
	
	show_debug_message(
    "ASSIGN | attr=" + string(attr) +
    " selected=" + string(cc.selected_roll_index) +
    " pool_size=" + string(array_length(cc.roll_pool))
);

    if (!is_struct(cc)) return;
    if (cc.selected_roll_index < 0) return;
    if (!is_array(cc.roll_pool)) return;

    var idx = cc.selected_roll_index;
    if (idx >= array_length(cc.roll_pool)) return;
	show_debug_message(
    "USING INDEX " + string(idx)
);
    var new_roll = cc.roll_pool[idx];
    if (!is_real(new_roll)) return;

    // SNAPSHOT FIRST (critical)
    push_history(cc);

    var old_roll = undefined;

    if (is_real(cc.assigned[$ attr]))
        old_roll = cc.assigned[$ attr];

    // assign
    cc.assigned[$ attr] = new_roll;

    // remove from pool
    array_delete(cc.roll_pool, idx, 1);

    // restore old roll if valid
    if (is_real(old_roll))
        array_push(cc.roll_pool, old_roll);

    sanitize_roll_pool(cc);

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}


function get_attribute_rect(i)
{
    var cols = 2;
    var attr_w = 280;          // was 200 → +40 width
    var attr_h = 120;          // taller so derived effects fit cleanly
    var col_spacing = 140;     // was 100 → more horizontal space
    var row_spacing = 140;     // was 100 → more vertical space
    var screen_w = display_get_gui_width();
    
    var total_w = cols * attr_w + (cols - 1) * col_spacing;
    var start_x = (screen_w - total_w) * 0.5;
    var attr_y = 220;
    
    var col = i mod cols;
    var row = floor(i / cols);
    
    return {
        x : start_x + col * (attr_w + col_spacing),
        y : attr_y + row * row_spacing,
        w : attr_w,
        h : attr_h
    };
}



function auto_assign_attributes(cc)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.roll_pool)) return;

    // ==========================================
    // SNAPSHOT (NEW SYSTEM RULE)
    // ==========================================
    push_history(cc);

    // ==========================================
    // BUILD UNASSIGNED LIST
    // ==========================================
    var unassigned = [];

    for (var i = 0; i < array_length(global.ATTRIBUTES); i++)
    {
        var attr = global.ATTRIBUTES[i];

        if (!variable_struct_exists(cc.assigned, attr))
            array_push(unassigned, attr);
    }

    // ==========================================
    // RANDOM ASSIGNMENT
    // ==========================================
    while (array_length(unassigned) > 0
    && array_length(cc.roll_pool) > 0)
    {
        var attr_index = irandom(array_length(unassigned) - 1);
        var roll_index = irandom(array_length(cc.roll_pool) - 1);

        var attr = unassigned[attr_index];
        var roll = cc.roll_pool[roll_index];

        cc.assigned[$ attr] = roll;
        array_delete(cc.roll_pool, roll_index, 1);

        array_delete(unassigned, attr_index, 1);
    }

    // ==========================================
    // CLEANUP
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}



function generate_roll_pool()
{
    var pool = [];

    for (var i = 0; i < 10; i++)
    {
        var rolls = [
            irandom_range(1, 6),
            irandom_range(1, 6),
            irandom_range(1, 6),
            irandom_range(1, 6)
        ];

        // remove lowest die
        var lowest = rolls[0];
        var lowest_index = 0;

        for (var j = 1; j < 4; j++)
        {
            if (rolls[j] < lowest)
            {
                lowest = rolls[j];
                lowest_index = j;
            }
        }

        array_delete(rolls, lowest_index, 1);

        var total = rolls[0] + rolls[1] + rolls[2];

        array_push(pool, total);
    }

    return pool;
}


function safe_get_assigned(cc, attr)
{
    if (!is_struct(cc)) return undefined;
    if (!is_struct(cc.assigned)) return undefined;

    if (!variable_struct_exists(cc.assigned, attr))
        return undefined;

    var v = cc.assigned[$ attr];

    if (is_undefined(v)) return undefined;

    return v;
}


function get_attribute_layout()
{
    var left  = get_attribute_rect(0);
    var right = get_attribute_rect(1);

    return {
        left_x  : left.x,
        top_y   : left.y,
        right_x : right.x + right.w
    };
}


function get_carry_capacity(){
global.size_data = {};

global.size_data.tiny = {
    carry_base : 20,
    carry_per_strength : 10
};

global.size_data.small = {
    carry_base : 30,
    carry_per_strength : 15
};

global.size_data.medium = {
    carry_base : 40,
    carry_per_strength : 20
};

global.size_data.large = {
    carry_base : 60,
    carry_per_strength : 30
};

global.size_data.huge = {
    carry_base : 80,
    carry_per_strength : 40
};
}



function get_roll_pool(cc)
{
    if (!is_struct(cc)) return [];

    if (!is_array(cc.roll_pool))
        return [];

    return array_copy_simple(cc.roll_pool);
}



function push_history(cc)
{
    if (!is_struct(cc)) return;

    if (!is_struct(cc.assigned))
        cc.assigned = {};

    if (!is_array(cc.roll_pool))
        cc.roll_pool = [];

    var snap = {
        assigned : {},
        roll_pool : array_copy_simple(cc.roll_pool),
        version  : 1
    };

    var keys = variable_struct_get_names(cc.assigned);

    for (var i = 0; i < array_length(keys); i++)
    {
        var k = keys[i];

        if (variable_struct_exists(cc.assigned, k))
            snap.assigned[$ k] = cc.assigned[$ k];
    }

    array_push(cc.history, snap);
}


function remove_assignment(cc, attr)
{
    if (!is_struct(cc)) return;
    if (!is_struct(cc.assigned)) return;
    if (!variable_struct_exists(cc.assigned, attr)) return;

    var roll = cc.assigned[$ attr];
    if (!is_real(roll)) return;

    // ==========================================
    // NEW METHOD: SNAPSHOT FIRST
    // ==========================================
    push_history(cc);

    show_debug_message("REMOVE CALLED: " + string(attr));
    show_debug_message("ROLL FOUND: " + string(roll));

    // ==========================================
    // MUTATION
    // ==========================================
    variable_struct_remove(cc.assigned, attr);

    if (is_array(cc.roll_pool))
        array_push(cc.roll_pool, roll);

    // ==========================================
    // CLEANUP
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}



function reroll_all()
{
    var cc = global.char_creation;
    if (!is_struct(cc)) return;

    // ==========================================
    // SNAPSHOT BEFORE FULL RESET
    // ==========================================
    push_history(cc);

    // ==========================================
    // REGENERATE STATE
    // ==========================================
    cc.base_pool = generate_roll_pool();
    cc.roll_pool = array_copy_simple(cc.base_pool);

    cc.assigned = {};

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;

    cc.species_bonus_map = {};

var species = global.species_data[$ cc.locked_species];

if (species.creation.attribute_adjustments.type == "choice")
{
    cc.species_bonus_remaining =
        species.creation.attribute_adjustments.count;
}
else
{
    cc.species_bonus_remaining = 0;
}
}



function sanitize_roll_pool(cc)
{
    if (!is_array(cc.roll_pool))
    {
        cc.roll_pool = [];
        return;
    }

    // Remove invalid values only
    var clean = [];

    for (var i = 0; i < array_length(cc.roll_pool); i++)
    {
        var v = cc.roll_pool[i];

        if (is_real(v))
            array_push(clean, v);
    }

    // Hard cap
    while (array_length(clean) > 10)
    {
        array_pop(clean);
    }

    cc.roll_pool = clean;
}



function swap_roll_with_attribute(cc, attr)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.roll_pool)) return;
    if (cc.selected_roll_index < 0) return;

    if (!variable_struct_exists(cc.assigned, attr)) return;

    var idx = cc.selected_roll_index;
    if (idx < 0 || idx >= array_length(cc.roll_pool)) return;

    var new_roll = cc.roll_pool[idx];
    var old_roll = safe_get_assigned(cc, attr);

    if (is_undefined(old_roll)) return;

    // ==========================================
    // NEW METHOD: SNAPSHOT FIRST
    // ==========================================
    push_history(cc);

    // ==========================================
    // MUTATION
    // ==========================================
    cc.assigned[$ attr] = new_roll;

    array_delete(cc.roll_pool, idx, 1);
    array_push(cc.roll_pool, old_roll);

    sanitize_roll_pool(cc);

    // ==========================================
    // RESET SELECTION
    // ==========================================
    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}



function undo_last(cc)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.history)) return;
    if (array_length(cc.history) <= 0) return;

    var snap = array_pop(cc.history);

    // ==========================================
    // VALIDATE SNAPSHOT FORMAT
    // ==========================================
    if (!variable_struct_exists(snap, "assigned")
    ||  !variable_struct_exists(snap, "roll_pool"))
    {
        show_debug_message("UNDO SKIPPED: invalid history entry");
        return;
    }

    // ==========================================
    // RESTORE STATE (PURE)
    // ==========================================
    cc.assigned = {};

    var keys = variable_struct_get_names(snap.assigned);

    for (var i = 0; i < array_length(keys); i++)
    {
        var k = keys[i];

        if (variable_struct_exists(snap.assigned, k))
            cc.assigned[$ k] = snap.assigned[$ k];
    }

    cc.roll_pool = array_copy_simple(snap.roll_pool);

    // ==========================================
    // IMPORTANT: DO NOT SANITIZE HERE
    // ==========================================
    // undo must restore EXACT snapshot state

    cc.selected_roll_index = -1;
    cc.selected_roll_value = undefined;
}