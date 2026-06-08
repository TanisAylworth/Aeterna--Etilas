function get_toughness_cdt_bonus(cc)
{
    var val = get_final_attribute(cc, "Toughness");

    var cdt;

    if (val >= 10)
    {
        cdt = floor((val - 10) / 2);
    }
    else
    {
        cdt = ceil((val - 10) / 2);
    }

    if (val <= 0)
    {
        cdt = 0;
    }

    return cdt;
}