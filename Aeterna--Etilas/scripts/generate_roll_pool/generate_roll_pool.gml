function generate_roll_pool()
{
    var pool = [];

    for (var i = 0; i < 10; i++)
    {
        array_push(pool, irandom_range(8, 15));
    }

    return pool;
}