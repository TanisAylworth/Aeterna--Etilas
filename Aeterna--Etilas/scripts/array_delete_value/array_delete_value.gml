function array_delete_value(arr, value)
{
    if (!is_array(arr)) return [];

    var out = array_copy_simple(arr);

    for (var i = 0; i < array_length(out); i++)
    {
        if (out[i] == value)
        {
            array_delete(out, i, 1);
            break;
        }
    }

    return out;
}