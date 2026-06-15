function refund_table_skill_discount(cc, table_name)
{
    if (!variable_struct_exists(
        global.knowledge_table_data,
        table_name))
    {
        return;
    }

    var table =
        global.knowledge_table_data[$ table_name];

    var refund = 0;

    for (var i = 0; i < array_length(table.skills); i++)
    {
        var skill_name = table.skills[i];

        var rank =
            get_skill_rank(
                cc,
                skill_name
            );

        refund += rank;
    }

    cc.generation_slots_remaining += refund;
}