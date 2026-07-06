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
                nodes = check.attributes;
            break;
        case "all":
            if (variable_struct_exists(check, "attributes") && is_array(check.attributes))
                nodes = check.attributes;
            break;
          
                case "size":
            if (variable_struct_exists(check, "size_attributes"))
            {
                var sizes = variable_struct_get_names(check.size_attributes);
                show_debug_message("Size keys found: " + json_stringify(sizes));
                for (var i = 0; i < array_length(sizes); i++)
                {
                    var size_key = sizes[i];
                    var data = check.size_attributes[$ size_key];
                    if (is_struct(data))
                        array_push(nodes, data);
                }
            }
            break;
            break;
          
        default:
            if (variable_struct_exists(check, "attribute"))
            {
                array_push(nodes, { attribute: check.attribute, modifier: 0 });
            }
            break;
    }
   
    return nodes;
}