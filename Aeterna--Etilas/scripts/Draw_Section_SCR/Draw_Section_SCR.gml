function scr_ui_draw_section(tx, ty, title, data)
{
    var line = 18;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var hover_w = 300;
    var hover_h = line;

    // =====================================================
    // TITLE
    // =====================================================
    draw_set_color(c_gray);
    draw_text(tx, ty, title);
    ty += line;

    draw_set_color(c_white);

    // =====================================================
    // EMPTY
    // =====================================================
    if (is_undefined(data))
    {
        draw_text(tx + 10, ty, "- None");
        return ty + line;
    }

    var is_array_data = is_array(data);
    var is_struct_data = is_struct(data);

    // =====================================================
    // ARRAY MODE (PURE LISTS ONLY)
    // =====================================================
    if (is_array_data)
    {
        if (array_length(data) == 0)
        {
            draw_text(tx + 10, ty, "- None");
            return ty + line;
        }

        for (var i = 0; i < array_length(data); i++)
        {
            var item_y = ty;

            draw_text(tx + 10, item_y,
                "- " + scr_fmt_label(data[i])
            );

            ty += line;
        }

        return ty;
    }

    // =====================================================
    // SAFE STRUCT EXTRACTION (ONCE ONLY)
    // =====================================================
    var fixed_list = [];
    var choice_count = 0;
    var choice_options = [];

    if (!is_struct(data)) return ty;

// =====================================================
// EXTRACT
// =====================================================
var fixed_list = [];
var choice_count = 0;
var choice_options = [];

if (variable_struct_exists(data, "fixed"))
    fixed_list = data.fixed;

if (variable_struct_exists(data, "choices"))
{
    var c = data.choices;

    if (is_struct(c))
    {
        if (variable_struct_exists(c, "count"))
            choice_count = c.count;

        if (variable_struct_exists(c, "options"))
            choice_options = c.options;
    }
}

// =====================================================
// FIXED
// =====================================================
if (array_length(fixed_list) > 0)
{
    for (var i = 0; i < array_length(fixed_list); i++)
    {
        draw_text(tx + 10, ty, "- " + scr_fmt_label(fixed_list[i]));
        ty += line;
    }

    return ty; // 🔴 CRITICAL STOP
}

// =====================================================
// CHOICES (SUMMARY ONLY)
// =====================================================
if (choice_count > 0)
{
    draw_text(tx + 10, ty,
        "Choose " + string(choice_count)
    );

    ty += line;

    return ty; // 🔴 CRITICAL STOP
}

// =====================================================
// OPTIONS (ONLY IF NO CHOICE SUMMARY)
// =====================================================
if (is_array(choice_options) && array_length(choice_options) > 0)
{
    for (var i = 0; i < array_length(choice_options); i++)
    {
        draw_text(tx + 10, ty, "- " + string(choice_options[i]));
        ty += line;
    }

    return ty; // 🔴 CRITICAL STOP
}

    // =====================================================
    // SPECIAL CASE: ATTRIBUTE ADJUSTMENTS
    // =====================================================
    if (is_struct_data && title == "Attribute Adjustments")
    {
        var t = string_lower(string(data.type));

        if (t == "choice")
			{
			    var item_y = ty;

			    var count = 0;

			    // NEW SCHEMA: uses "count" directly
			    if (variable_struct_exists(data, "count"))
			    {
			        count = data.count;
			    }

			    draw_text(
			        tx + 10,
			        item_y,
			        "Choose +" + string(data.amount) +
			        " to " + string(count) + " attributes"
			    );

			    return ty + line;
			}
    }

    // =====================================================
    // FIXED LIST OUTPUT
    // =====================================================
    if (array_length(fixed_list) > 0)
    {
        for (var i = 0; i < array_length(fixed_list); i++)
        {
            draw_text(tx + 10, ty,
                "- " + scr_fmt_label(fixed_list[i])
            );

            ty += line;
        }
    }

    // =====================================================
    // SUMMARY MODE (OVERRIDES EVERYTHING)
    // =====================================================
    if (choice_count > 0)
    {
        draw_text(tx + 10, ty,
            "Choose " + string(choice_count)
        );

        ty += line;

        return ty;
    }

    // =====================================================
    // HIT LOCATIONS
    // =====================================================
    if (is_struct_data && title == "Hit Locations")
    {
        var hit_data = data.data;
        var order = data.order;

        if (is_array(order))
        {
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

                draw_text(tx + 10, ty,
                    scr_fmt_label(limb) + ": " + text_line
                );

                ty += line;
            }
        }

        return ty;
    }


if (is_struct(data) && variable_struct_exists(data, "type"))
{
    var t = string_lower(string(data.type));

    // =================================================
    // FIXED ATTRIBUTES
    // =================================================
    if (t == "fixed" && variable_struct_exists(data, "values"))
    {
        var vals = data.values;
        var keys = variable_struct_get_names(vals);

        for (var i = 0; i < array_length(keys); i++)
        {
            var k = keys[i];
            var v = vals[$ k];

            draw_text(tx + 10, ty,
                scr_fmt_label(k) + " " + string(v)
            );

            ty += line;
        }

        return ty; // 🔴 IMPORTANT: stop fallback
    }

    // =================================================
    // CHOICE ATTRIBUTES
    // =================================================
    if (t == "choice")
    {
        var count = 0;

        if (variable_struct_exists(data, "count"))
            count = data.count;

        draw_text(tx + 10, ty,
            "Choose +" + string(data.amount) +
            " to " + string(count) + " attributes"
        );

        ty += line;

        return ty;
    }
}


    // =====================================================
    // FALLBACK STRUCT
    // =====================================================
    if (is_struct_data)
    {
        var keys = variable_struct_get_names(data);

        for (var i = 0; i < array_length(keys); i++)
        {
            var key = keys[i];
            var val = variable_struct_get(data, key);

            draw_text(tx + 10, ty,
                scr_fmt_label(key) + ": " + string(val)
            );

            ty += line;
        }
    }

    return ty;
}