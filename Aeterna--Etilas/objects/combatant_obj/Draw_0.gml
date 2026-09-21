// Draw event
draw_self();

if (is_undefined(combatant_data) || !is_struct(combatant_data))
    exit;

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

var label = variable_struct_exists(combatant_data, "name")
    ? combatant_data.name
    : "?";

draw_text(x, y - sprite_get_height(sprite_index) * 0.5 - 4, label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);