function scr_fmt_label(_str)
{
    var s = string_replace_all(_str, "_", " ");
    var parts = string_split(s, " ");
    var out = "";

    for (var i = 0; i < array_length(parts); i++)
    {
        var p = parts[i];

        if (string_length(p) > 0)
        {
            out += string_upper(string_copy(p, 1, 1)) +
                   string_lower(string_copy(p, 2, string_length(p) - 1));
        }

        if (i < array_length(parts) - 1)
            out += " ";
    }

    return out;
}