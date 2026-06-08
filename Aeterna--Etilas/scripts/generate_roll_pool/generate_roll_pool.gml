function generate_roll_pool()
{
    var pool = [];

    for (var i = 0; i < 10; i++)
    {
        var rolls = [
            irandom_range(1, 6),
            irandom_range(1, 6),
            irandom_range(1, 6),
            irandom_range(1, 6)
        ];

        // remove lowest die
        var lowest = rolls[0];
        var lowest_index = 0;

        for (var j = 1; j < 4; j++)
        {
            if (rolls[j] < lowest)
            {
                lowest = rolls[j];
                lowest_index = j;
            }
        }

        array_delete(rolls, lowest_index, 1);

        var total = rolls[0] + rolls[1] + rolls[2];

        array_push(pool, total);
    }

    return pool;
}