function get_skill_check_result(cc, skill)
{
    var result = {
        total: 0,
        attribute: "None",
        modifier: 0,
        is_best: false
    };
    
    if (!variable_struct_exists(skill, "check"))
        return result;
        
    var check = skill.check;
    var char_size = get_character_size(cc);

    switch (check.mode)
    {
        case "best":
            // Best of multiple attributes
            var nodes = get_skill_check_nodes(skill, cc);
            var best_value = -999;
            var best_attr = "None";
            var best_mod = 0;
            
            for (var i = 0; i < array_length(nodes); i++)
            {
                var node = nodes[i];
                var attr = variable_struct_exists(node, "attribute") ? node.attribute : "None";
                var _mod = variable_struct_exists(node, "modifier") ? node.modifier : 0;
                var value = get_final_attribute(cc, attr) + _mod;
                
                if (value > best_value)
                {
                    best_value = value;
                    best_attr = attr;
                    best_mod = _mod;
                }
            }
            
            result.total = best_value;
            result.attribute = best_attr;
            result.modifier = best_mod;
            result.is_best = true;
            break;

        case "size":
        case "size_dependent":
            // Size-based check
            if (variable_struct_exists(check, "size_attributes"))
            {
                var size_data = check.size_attributes[$ char_size];
                if (is_struct(size_data))
                {
                    result.attribute = size_data.attribute;
                    result.modifier = variable_struct_exists(size_data, "modifier") ? size_data.modifier : 0;
                    result.total = get_final_attribute(cc, result.attribute) + result.modifier;
                }
                else
                {
                    // Fallback to medium if size not found
                    size_data = check.size_attributes[$ "medium"];
                    if (is_struct(size_data))
                    {
                        result.attribute = size_data.attribute;
                        result.modifier = variable_struct_exists(size_data, "modifier") ? size_data.modifier : 0;
                        result.total = get_final_attribute(cc, result.attribute) + result.modifier;
                    }
                }
            }
            break;

        default:
            if (variable_struct_exists(check, "attribute"))
            {
                result.attribute = check.attribute;
                result.modifier = 0;
                result.total = get_final_attribute(cc, result.attribute);
            }
            break;
    }
    
    return result;
}