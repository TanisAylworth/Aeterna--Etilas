function scr_ui_draw_section(tx, ty, title, data)
{
    var line = 18;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    draw_set_color(c_gray);
    draw_text(tx, ty, title);
    ty += line;
    draw_set_color(c_white);

    if (is_undefined(data) || data == "None")
    {
        draw_text(tx + 10, ty, "- None");
        return ty + line;
    }
	   
    

    // =====================================================
    // ATTRIBUTE ADJUSTMENTS - Clean
    // =====================================================
    if (title == "Attribute Adjustments" && is_struct(data))
    {
        var t = string_lower(string(data.type));
        if (t == "fixed" && variable_struct_exists(data, "values"))
        {
            var vals = data.values;
            var keys = variable_struct_get_names(vals);
            for (var i = 0; i < array_length(keys); i++)
            {
                var k = keys[i];
                var v = vals[$ k];
                draw_text(tx + 10, ty, scr_fmt_label(k) + " " + string(v));
                ty += line;
            }
        }
        else if (t == "choice")
        {
            var count = variable_struct_exists(data, "count") ? data.count : 0;
            var amount = variable_struct_exists(data, "amount") ? data.amount : 1;
            draw_text(tx + 10, ty, "Choose +" + string(amount) + " to " + string(count) + " attributes");
            ty += line;
        }
        return ty;
    }
	
	
	if (title == "Talents" && is_struct(data))
{
    var fixed = variable_struct_exists(data, "fixed") ? data.fixed : [];
    var choice_count = 0;

    if (variable_struct_exists(data, "choices"))
    {
        var c = data.choices;
        if (is_struct(c) && variable_struct_exists(c, "count"))
            choice_count = c.count;
    }

    if (array_length(fixed) > 0)
    {
        for (var i = 0; i < array_length(fixed); i++)
        {
            draw_text(tx + 10, ty, "- " + string(fixed[i]));
            ty += line;
        }
    }
    else if (choice_count > 0)
    {
        draw_text(tx + 10, ty, "Choose " + string(choice_count) + " Talents");
        ty += line;
    }
    else
    {
        draw_text(tx + 10, ty, "- None");
        ty += line;
    }

    return ty;
}
	
	    // =====================================================
    // SKILLS - Per-Item Hover
    // =====================================================
    if (title == "Skills" && is_struct(data))
    {
        var fixed = variable_struct_exists(data, "fixed") ? data.fixed : [];
        var choice_count = 0;

        if (variable_struct_exists(data, "choices"))
        {
            var c = data.choices;
            if (is_struct(c) && variable_struct_exists(c, "count"))
                choice_count = c.count;
        }

                if (array_length(fixed) > 0)
        {
            for (var i = 0; i < array_length(fixed); i++)
            {
                var s = fixed[i];
                var item_y = ty;
                var rank_str = variable_struct_exists(s, "rank") ? " (Rank " + string(s.rank) + ")" : "";
                draw_text(tx + 10, item_y, "- " + s.name + rank_str);

                if (point_in_rectangle(mx, my, tx + 10, item_y - 2, tx + 300, item_y + line + 2))
                {
                    var lookup_name = string_replace_all(s.name, " (X)", "");
					var skill_data = undefined;

					if (variable_global_exists("skill_data"))
					{
					    if (variable_struct_exists(global.skill_data, s.name))
					        skill_data = global.skill_data[$ s.name];
					    else if (variable_struct_exists(global.skill_data, lookup_name))
					        skill_data = global.skill_data[$ lookup_name];
					}
					var tooltip_text = skill_data && variable_struct_exists(skill_data, "description") ? skill_data.description : "No description available.";
                    set_tooltip(tooltip_text, mx + 16, my + 16);
                }
                ty += line;
            }
        }

        if (choice_count > 0)
        {
            draw_text(tx + 10, ty, "Choose " + string(choice_count) + " Free Skills");
            ty += line;
        }
        return ty;
    }

    // =====================================================
    // NEGATIVES - Per-Item Hover
    // =====================================================
    if (title == "Negatives" && is_array(data))
    {
        for (var i = 0; i < array_length(data); i++)
        {
            var item_y = ty;
            draw_text(tx + 10, item_y, "- " + data[i]);

                        if (point_in_rectangle(mx, my, tx + 10, item_y, tx + 300, item_y + line))
            {
                var negative_data = variable_struct_exists(global, "negative_data") && variable_struct_exists(global.negative_data, data[i]) ? global.negative_data[$ data[i]] : undefined;
                var tooltip_text = negative_data && variable_struct_exists(negative_data, "description") ? negative_data.description : "No description available.";
                set_tooltip(tooltip_text, mx + 16, my + 16);
            }
            ty += line;
        }
        return ty;
    }
    // =====================================================
    // KNOWLEDGE TABLES - Clean
    // =====================================================
    if (title == "Tables" && is_struct(data))
    {
        if (variable_struct_exists(data, "fixed"))
        {
            var fixed = data.fixed;
            for (var i = 0; i < array_length(fixed); i++)
            {
                draw_text(tx + 10, ty, "- " + fixed[i]);
                ty += line;
            }
        }
        if (variable_struct_exists(data, "choices") && data.choices.count > 0)
        {
            draw_text(tx + 10, ty, "Choose " + string(data.choices.count) + " Tables");
            ty += line;
        }
        return ty;
    }
	
	 // =====================================================
    // ABILITIES - Per-Item Hover
    // =====================================================
    if (title == "Abilities" && is_array(data))
    {
        for (var i = 0; i < array_length(data); i++)
        {
            var item_y = ty;
            draw_text(tx + 10, item_y, "- " + data[i]);

            if (point_in_rectangle(mx, my, tx + 10, item_y, tx + 300, item_y + line))
            {
                var ability_data = variable_struct_exists(global, "ability_data") && variable_struct_exists(global.ability_data, data[i]) ? global.ability_data[$ data[i]] : undefined;
                var tooltip_text = ability_data && variable_struct_exists(ability_data, "description") ? ability_data.description : "No description available.";
                set_tooltip(tooltip_text, mx + 16, my + 16);
            }
            ty += line;
        }
        return ty;
    }

    // =====================================================
    // TRAITS - Per-Item Hover
    // =====================================================
    if (title == "Traits" && is_array(data))
    {
        for (var i = 0; i < array_length(data); i++)
        {
            var item_y = ty;
            draw_text(tx + 10, item_y, "- " + scr_fmt_label(data[i]));

            if (point_in_rectangle(mx, my, tx + 10, item_y, tx + 300, item_y + line))
            {
                var trait_data = variable_struct_exists(global.trait_data, data[i]) ? global.trait_data[$ data[i]] : undefined;
                var tooltip_text = trait_data && variable_struct_exists(trait_data, "description") ? trait_data.description : "No description available.";
                set_tooltip(tooltip_text, mx + 16, my + 16);
            }
            ty += line;
        }
        return ty;
    }

    // =====================================================
    // HIT LOCATIONS - Clean
    // =====================================================
    if (title == "Hit Locations" && is_struct(data) && variable_struct_exists(data, "data"))
    {
        var hit_data = data.data;
        var order = variable_struct_exists(data, "order") ? data.order : variable_struct_get_names(hit_data);
        for (var i = 0; i < array_length(order); i++)
        {
            var limb = order[i];
            if (!variable_struct_exists(hit_data, limb)) continue;
            var arr = hit_data[$ limb];
            var text_line = "";
            for (var j = 0; j < array_length(arr); j++)
            {
                text_line += string(arr[j]);
                if (j < array_length(arr) - 1) text_line += ", ";
            }
            draw_text(tx + 10, ty, scr_fmt_label(limb) + ": " + text_line);
            ty += line;
        }
        return ty;
    }

    // =====================================================
    // SIMPLE ARRAYS / LISTS
    // =====================================================
    if (is_array(data))
    {
        if (array_length(data) == 0)
        {
            draw_text(tx + 10, ty, "- None");
            return ty + line;
        }
        for (var i = 0; i < array_length(data); i++)
        {
            draw_text(tx + 10, ty, "- " + scr_fmt_label(data[i]));
            ty += line;
        }
        return ty;
    }

    // =====================================================
    // FALLBACK
    // =====================================================
    draw_text(tx + 10, ty, "- " + string(data));
    return ty + line;
	
	
	
}