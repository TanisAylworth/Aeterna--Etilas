function DropLow4D6(){
    var rolls = [];

    // roll 4 dice
    for (var i = 0; i < 4; i++) {
        array_push(rolls, irandom_range(1, 6));
    }

    // sort ascending (smallest first)
    array_sort(rolls, true);

    // sum highest 3 (ignore index 0)
    return rolls[1] + rolls[2] + rolls[3];

}