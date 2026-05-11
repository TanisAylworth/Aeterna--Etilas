function draw_tooltip()
{
    var t = global.char_creation.tooltip;
    if (!t.active) return;

    var pad = 6;
    var max_w = 240;
    var line_h = 18;

    var sw = display_get_gui_width();
    var sh = display_get_gui_height();

    var w = max_w + pad * 2;
    var h = string_height_ext(t.text, line_h, max_w) + pad * 2;

    var xx = t.x;
    var yy = t.y;

    // screen clamp
    if (xx + w > sw) xx = sw - w;
    if (yy + h > sh) yy = sh - h;

    // background
    draw_set_color(c_black);
    draw_rectangle(xx, yy, xx + w, yy + h, false);

    draw_set_color(c_white);
    draw_rectangle(xx, yy, xx + w, yy + h, true);

    // text (wrapped)
    draw_text_ext(xx + pad, yy + pad, t.text, line_h, max_w);
}







    