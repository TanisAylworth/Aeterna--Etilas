function get_attribute_rect(i)
{
    var cols = 2;
    var attr_w = 280;          // was 200 → +40 width
    var attr_h = 120;          // taller so derived effects fit cleanly
    var col_spacing = 140;     // was 100 → more horizontal space
    var row_spacing = 140;     // was 100 → more vertical space
    var screen_w = display_get_gui_width();
    
    var total_w = cols * attr_w + (cols - 1) * col_spacing;
    var start_x = (screen_w - total_w) * 0.5;
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