function get_attribute_rect(i)
{
    var cols = 2;
    var attr_w = 200;
    var attr_h = 25;
    var col_spacing = 100;
    var row_spacing = 100;

    var screen_w = display_get_gui_width();

    var total_w =
        cols * attr_w +
        (cols - 1) * col_spacing;

    var start_x =
        (screen_w - total_w) * 0.5;

    var attr_y = 220;

    var col = i mod cols;
    var row = floor(i / cols);

    return {
        x : start_x + col * (attr_w + col_spacing),
        y : attr_y + row * row_spacing,
        w : attr_w,
        h : attr_h
    };
}