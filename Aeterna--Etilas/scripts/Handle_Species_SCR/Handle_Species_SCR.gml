function handle_species_select(step) {

    if (!mouse_check_button_pressed(mb_left)) return;

    var cc = global.char_creation;

    var xx = 100;
    var yy = 100;
    var h = 40;

    for (var i = 0; i < array_length(global.species_list); i++) {

        var yy = y + i * h;

        // click check
        if (mouse_x > x && mouse_x < x + 200 &&
            mouse_y > yy && mouse_y < yy + 30) {

            cc.species = global.species_list[i];

            show_debug_message("Selected Species: " + string(cc.species));

            break;
        }
    }
}