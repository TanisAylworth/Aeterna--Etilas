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