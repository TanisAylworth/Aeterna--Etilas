function get_final_attribute(attr) {

    var cc = global.char_creation;

    var base =
        variable_struct_get(cc.assigned, attr);

    if (is_undefined(base)) {
        base = 0;
    }

    var species =
        global.species_data[$ cc.species];

    var total = base;

    // fixed bonuses
    if (variable_struct_exists(species.attributes, attr)) {
        total += species.attributes[$ attr];
    }

    // flexible bonuses
    if (!is_undefined(species.flex_attributes)) {

        var amount =
            species.flex_attributes.amount;

        for (var i = 0;
             i < array_length(cc.species_bonus_choices);
             i++) {

            if (cc.species_bonus_choices[i] == attr) {
                total += amount;
            }
        }
    }

    return total;
}