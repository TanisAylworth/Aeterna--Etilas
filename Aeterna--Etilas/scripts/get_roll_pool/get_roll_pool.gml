function get_roll_pool(cc)
{
    if (!is_struct(cc)) return [];

    if (!is_array(cc.roll_pool))
        return [];

    return array_copy_simple(cc.roll_pool);
}