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