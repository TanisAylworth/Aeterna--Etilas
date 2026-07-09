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
    // KNOWLEDGE SKILLS - Clean Display
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
                var rank_str = variable_struct_exists(s, "rank") ? " (Rank " + string(s.rank) + ")" : "";
                draw_text(tx + 10, ty, "- " + s.name + rank_str);
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