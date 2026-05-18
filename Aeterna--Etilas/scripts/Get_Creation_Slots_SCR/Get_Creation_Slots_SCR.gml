function get_creation_slots(cc)
{
    var total = 20;

    var intelligence =
        get_final_attribute(cc, "Intelligence");

    total += max(0, floor((intelligence - 10) / 2));

    return total;
}