function set_tooltip(_text, _x, _y)
{
    global.char_creation.tooltip.active = true;
    global.char_creation.tooltip.text = _text;
    global.char_creation.tooltip.x = _x;
    global.char_creation.tooltip.y = _y;
}