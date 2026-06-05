function sanitize_roll_pool(cc)
{
    if (!is_struct(cc)) return;
    if (!is_array(cc.roll_pool)) return;

    var clean = [];

    for (var i = 0; i < array_length(cc.roll_pool); i++)
    {
        var v = cc.roll_pool[i];

        if (array_find_index(clean, v) == -1)
            array_push(clean, v);
    }

    cc.roll_pool = clean;

    // IMPORTANT: do NOT silently destroy state in undo system
    // Instead enforce cap WITHOUT mutation loss
    if (array_length(cc.roll_pool) > 10)
    {
        cc.roll_pool = array_slice(cc.roll_pool, 0, 10);
    }
}