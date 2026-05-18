function generation_shop_draw(step)
{
    var cc = global.char_creation;

    draw_text(100, 100, "CHARACTER GENERATION");

    draw_text(
        100,
        140,
        "Remaining Slots: "
        + string(cc.generation_slots_remaining)
    );

    draw_text(100, 200, "TABLES");
    draw_text(100, 220, "SKILLS");
    draw_text(100, 240, "TALENTS");
    draw_text(100, 260, "CDT");
    draw_text(100, 280, "GOLD");
}