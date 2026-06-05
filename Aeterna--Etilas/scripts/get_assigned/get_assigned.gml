function safe_get_assigned(cc, attr)
{
    if (!is_struct(cc)) return undefined;
    if (!is_struct(cc.assigned)) return undefined;

    if (!variable_struct_exists(cc.assigned, attr))
        return undefined;

    var v = cc.assigned[$ attr];

    if (is_undefined(v)) return undefined;

    return v;
}