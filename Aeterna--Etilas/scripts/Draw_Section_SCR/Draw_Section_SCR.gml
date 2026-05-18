function scr_ui_draw_section(tx, ty, title, data)
{
    var line = 18;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var hover_w = 300;
    var hover_h = line;



	
    // =========================
    // TITLE
    // =========================
    draw_set_color(c_gray);
    draw_text(tx, ty, title);
    ty += line;

    draw_set_color(c_white);

    // =========================
    // EMPTY
    // =========================
    if (is_undefined(data) || data == undefined)
    {
        draw_text(tx + 10, ty, "- None");
        return ty + line;
    }

    // =========================
    // ARRAY
    // =========================
	
	// BEFORE array handler
	
   if (is_array(data))
{
    // HARD EXCLUSION: traits handled elsewhere ONLY


if (title == "Traits")
{
    for (var i = 0; i < array_length(data); i++)
    {
        var t = string_trim(string_lower(string(data[i])));
        var item_y = ty;

        var raw = data[i];
		var key = string_lower(string_trim(string(raw)));

		draw_text(tx + 20, item_y, "- " + scr_fmt_label(raw));

        var tooltip_text = "No description available.";

        if (variable_struct_exists(global.trait_data, t))
        {
            var trait = global.trait_data[$ t];

            if (is_struct(trait) && variable_struct_exists(trait, "description"))
            {
                tooltip_text = trait.description;
            }
        }

        if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
        {
            set_tooltip(tooltip_text, mx + 16, my + 16);
        }

        ty += line;
    }

    return ty;
}



    for (var i = 0; i < array_length(data); i++)
    {
        var item_y = ty;
        var value = data[i];

        var raw = data[i];
		var key = string_lower(string_trim(string(raw)));

		draw_text(tx + 20, item_y, "- " + scr_fmt_label(raw));

        if (point_in_rectangle(mx, my,
            tx, item_y,
            tx + hover_w, item_y + hover_h))
        {
            set_tooltip(string(value), mx + 16, my + 16);
        }

        ty += line;
    }

    return ty + 6;
}
	
	
	


// =========================
// TRAITS (HARD OVERRIDE)
// =========================


    // =========================
    // STRUCT
    // =========================
    if (!is_struct(data)) return ty;

    // =====================================================
    // HIT LOCATIONS
    // =====================================================
    if (title == "Hit Locations")
    {
        var hit_data = data.data;
        var order = data.order;

        if (!is_array(order)) return ty;

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

            var item_y = ty;
            var label = scr_fmt_label(limb);

            draw_text(tx + 10, item_y, label + ": " + text_line);

            if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
            {
                set_tooltip("Hit zone: " + label, mx + 16, my + 16);
            }

            ty += line;
        }

        return ty;
    }

    // =====================================================
    // ATTRIBUTE ADJUSTMENTS
    // =====================================================
    if (title == "Attribute Adjustments")
    {
        if (!variable_struct_exists(data, "type"))
        {
            draw_text(tx + 10, ty, "- Missing attribute type");
            return ty;
        }

        var t = string_lower(string(data.type));

        if (t == "choice")
        {
            var item_y = ty;

            draw_text(tx + 10, item_y,
                "Choose +" + string(data.amount) +
                " to " + string(data.choices) + " attributes"
            );

            if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
            {
                set_tooltip("Distribute bonus attributes.", mx + 16, my + 16);
            }

            return ty + line;
        }

        if (t == "fixed")
        {
            var vals = data.values;
            var keys = variable_struct_get_names(vals);

            for (var i = 0; i < array_length(keys); i++)
            {
                var k = keys[i];
                var v = vals[$ k];

                var item_y = ty;
                var label = scr_fmt_label(k);

                draw_text(tx + 10, item_y, label + ": " + string(v));

                if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
                {
                    set_tooltip("Attribute: " + label, mx + 16, my + 16);
                }

                ty += line;
            }

            return ty;
        }

        draw_text(tx + 10, ty, "- Unknown attribute type: " + t);
        return ty;
    }

    // =====================================================
    // TRAITS (FIXED CLEAN VERSION)
    // =====================================================
    

    // =====================================================
    // CHOICES (ONLY IF NO ARRAY/TRAIT OVERRIDE)
    // =====================================================
    if (variable_struct_exists(data, "choices") && variable_struct_exists(data, "options"))
    {
        var item_y = ty;

        draw_text(tx + 10, item_y,
            "Choose " + string(data.choices) + " option(s)"
        );

        if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
        {
            set_tooltip("Selection category", mx + 16, my + 16);
        }

        return ty + line;
    }

    // =====================================================
    // OPTIONS LIST
    // =====================================================
    if (variable_struct_exists(data, "options"))
    {
        for (var i = 0; i < array_length(data.options); i++)
        {
            var item_y = ty;
            var opt = data.options[i];

            draw_text(tx + 10, item_y, "- " + string(opt));

            if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
            {
                set_tooltip(string(opt), mx + 16, my + 16);
            }

            ty += line;
        }

        return ty;
    }

    // =====================================================
    // FALLBACK STRUCT
    // =====================================================
    var keys = variable_struct_get_names(data);

    for (var i = 0; i < array_length(keys); i++)
    {
        var key = keys[i];
        var val = variable_struct_get(data, key);

        var item_y = ty;

        draw_text(tx + 10, item_y,
            scr_fmt_label(key) + ": " + string(val)
        );

        if (point_in_rectangle(mx, my, tx, item_y, tx + hover_w, item_y + hover_h))
        {
            set_tooltip(scr_fmt_label(key), mx + 16, my + 16);
        }

        ty += line;
    }

    return ty;
}