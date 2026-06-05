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