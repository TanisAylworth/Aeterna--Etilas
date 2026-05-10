function build_available_skills_pool() {

    var cc = global.char_creation;

    var chosen_tables = cc.knowledge_tables;

    var pool = [];

    for (var t = 0; t < array_length(chosen_tables); t++) {

        var table_name = chosen_tables[t];

        var table = global.skill_tables[$ table_name];

        var keys = variable_struct_get_names(table);

        for (var i = 0; i < array_length(keys); i++) {

            var skill = table[$ keys[i]];

            array_push(pool, skill);
        }
    }

    return pool;
}