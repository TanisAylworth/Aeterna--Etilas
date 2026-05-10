function draw_tooltip()
{
    var t = global.char_creation.tooltip;

    if (!t.active) return;

    var pad = 8;
    var w = string_width(t.text) + pad * 2;
    var h = string_height(t.text) + pad * 2;

    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(t.x, t.y, t.x + w, t.y + h, false);

    draw_set_color(c_white);
    draw_rectangle(t.x, t.y, t.x + w, t.y + h, true);

    draw_text(t.x + pad, t.y + pad, t.text);
}