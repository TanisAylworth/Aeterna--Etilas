function array_copy_simple(arr)
{
    if (!is_array(arr)) return [];

    var new_arr = [];
    var len = array_length(arr);

    for (var i = 0; i < len; i++)
    {
        new_arr[i] = arr[i];
    }

    return new_arr;
}