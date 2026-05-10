function get_attribute_details(attr, val) {

    if (is_undefined(val)) return ["-"];

    switch (attr) {

        case "strength":
            return [
                "Carry Capacity: " + string((40 + ((val-10)* 20))),
                "Strength Damage Bonus: +" + string(floor((val - 10) / 2))
            ];

        case "dexterity":
            return [
                "Attack Bonus: " + string((val - 10),
                "Move Speed: +" + string(floor((30 + ((val - 10) * 5))))),
				"Dexterity Damage Bonus: +" + string(floor((val - 10) / 3))
            ];

        case "endurance":
            return [
                "Fatigue Limit: " + string(floor(5 + ((val - 10) / 3))),
                "Fatigue Recovery Rate: +" + string(floor(3 + ((val - 10) / 3)))
            ];

        default:
            return ["No data"];
    }
}