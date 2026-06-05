function array_index_of(arr, value)
{
    if (!is_array(arr)) return -1;

    var len = array_length(arr);

    for (var i = 0; i < len; i++)
    {
        if (is_struct(arr[i]) && is_struct(value))
        {
            if (arr[i] == value) return i; // strict reference check (GMS 2.3+ safe behavior equivalent)
        }
        else if (arr[i] == value)
        {
            return i;
        }
    }

    return -1;
}