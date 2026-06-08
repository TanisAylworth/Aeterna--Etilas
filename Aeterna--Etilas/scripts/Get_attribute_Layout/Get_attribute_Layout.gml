function get_attribute_layout()
{
    var left  = get_attribute_rect(0);
    var right = get_attribute_rect(1);

    return {
        left_x  : left.x,
        top_y   : left.y,
        right_x : right.x + right.w
    };
}