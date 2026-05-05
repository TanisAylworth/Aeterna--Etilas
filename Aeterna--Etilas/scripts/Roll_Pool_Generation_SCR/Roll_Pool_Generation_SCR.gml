function generate_roll_pool() {
    var pool = [];

    for (var i = 0; i < 10; i++) {
        array_push(pool, DropLow4D6());
    }

    return pool;
}