function get_skill_check_result(cc, skill)
{
    var checks = get_skill_check_nodes(skill);

    var result =
    {
        mode : "best",
        total : 0,
        attribute : "",
        breakdown : [],
        checks : []
    };

    if (variable_struct_exists(skill.check, "mode"))
    {
        result.mode = skill.check.mode;
    }

    // =====================================
    // BEST ATTRIBUTE
    // =====================================
    if (result.mode == "best")
    {
        var best_total = -99999;

        for (var i = 0; i < array_length(checks); i++)
        {
            var node = checks[i];

            var attr =
                get_final_attribute(
                    cc,
                    node.attribute
                );

            var total =
                attr +
                node.modifier;

            if (total > best_total)
			{
			    best_total = total;

			    result.attribute =
			        node.attribute;

			    result.modifier =
			        node.modifier;

			    result.total =
			        total;
			}
        }
    }

    // =====================================
    // ALL CHECKS
    // =====================================
    else if (result.mode == "all")
    {
        for (var i = 0; i < array_length(checks); i++)
        {
            var node = checks[i];

            var attr =
                get_final_attribute(
                    cc,
                    node.attribute
                );

            array_push(
                result.checks,
                {
                    attribute : node.attribute,
                    attribute_value : attr,
                    modifier : node.modifier,
                    total : attr + node.modifier
                }
            );
        }
    }

    return result;
}