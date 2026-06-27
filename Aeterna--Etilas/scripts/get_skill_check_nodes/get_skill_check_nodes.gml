function get_skill_check_nodes(skill, cc)
{
    var nodes = [];
    
    if (!variable_struct_exists(skill, "check"))
        return nodes;
        
    var check = skill.check;
    
    if (!variable_struct_exists(check, "mode"))
        return nodes;
    
    switch (check.mode)
    {
        case "best":
            if (variable_struct_exists(check, "attributes") && is_array(check.attributes))
            {
                nodes = check.attributes;
            }
            break;
            
        case "size":
        case "size_dependent":
            if (variable_struct_exists(check, "size_attributes"))
            {
                // Return all size options
                var sizes = variable_struct_get_names(check.size_attributes);
                for (var i = 0; i < array_length(sizes); i++)
                {
                    var size_key = sizes[i];
                    var data = check.size_attributes[$ size_key];
                    array_push(nodes, data);
                }
            }
            break;
            
        default:
            // Fallback for simple single attribute
            if (variable_struct_exists(check, "attribute"))
            {
                array_push(nodes, { attribute: check.attribute, modifier: 0 });
            }
            break;
    }
    
    return nodes;
}