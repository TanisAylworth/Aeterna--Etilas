function step_complete(step) {

    var cc = global.char_creation;

    switch (step.id) {

        // =========================
        // SPECIES
        // =========================
        case "species":
            return cc.species != undefined;

        // =========================
        // ATTRIBUTES
        // =========================
        case "attributes":

            var assigned_count = 0;

            var attrs = variable_struct_get_names(cc.assigned);

            for (var i = 0; i < array_length(attrs); i++) {

                var val = variable_struct_get(cc.assigned, attrs[i]);

                if (!is_undefined(val)) {
                    assigned_count++;
                }
            }

            return assigned_count >= step.rolls;

        // =========================
        // KNOWLEDGE TABLES
        // =========================
        case "knowledge_tables":

            return array_length(cc.selections.knowledge_tables)
                >= step.choices;

        // =========================
        // SKILLS
        // =========================
        case "skills":

            return array_length(cc.selections.skills)
                >= step.choices;

        // =========================
        // FINALIZE
        // =========================
        case "finalize":
            return false;
    }

    return false;
}