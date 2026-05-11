function set_tooltip(_text, _x, _y)
{
    var t = global.char_creation.tooltip;

    // STOP ANY OVERWRITES
    if (t.active) return;

    t.active = true;
    t.text = _text;
    t.x = _x;
    t.y = _y;
}