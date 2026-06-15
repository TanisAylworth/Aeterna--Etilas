function refund_table_skills(cc, table_name)
{
    if (!variable_struct_exists(
        global.knowledge_table_data,
        table_name))
    {
        return;
    }

    var table =
        global.knowledge_table_data[$ table_name];

    for (var i = 0; i < array_length(table.skills); i++)
    {
        var skill_name = table.skills[i];

        var rank =
            get_skill_rank(
                cc,
                skill_name
            );

        if (rank > 0)
        {
            cc.generation_slots_remaining += rank;

            set_skill_rank(
                cc,
                skill_name,
                0
            );
        }
    }
}