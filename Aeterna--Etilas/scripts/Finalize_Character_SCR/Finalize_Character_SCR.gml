function finalize_character() {

    var cc = global.char_creation;

    global.player_character = {
        species: cc.species,
        attributes: cc.assigned,
        knowledge_tables: cc.selections.knowledge_tables,
        skills: cc.selections.skills
    };

    show_debug_message("Character Created!");

    room_goto(rm_game);
}