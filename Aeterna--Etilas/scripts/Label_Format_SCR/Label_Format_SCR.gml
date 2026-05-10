function scr_fmt_label(str)
{
    var s = string_replace_all(str, "_", " ");

    if (string_length(s) <= 0) return s;

    return string_upper(string_copy(s, 1, 1)) +
           string_lower(string_copy(s, 2, string_length(s) - 1));
}