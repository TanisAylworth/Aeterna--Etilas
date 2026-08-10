function equipment_layout(L)
{
    var col_w = 320;
    var gap = 24;
    var cx = L.center_x;

    return {
        weapons_x: cx - col_w - gap,
        armor_x:   cx,
        gear_x:    cx + col_w + gap,
        col_w:     col_w,
        panel_y:   300,
        panel_h:   520
    };
}


function get_equipment_categories(column)
{
    switch (column)
    {
        case "weapons":
            return ["Swords", "Axes", "Knives", "Daggers", "Clubs", "Polearms", "Bows", "Firearms"];
        case "armor":
            return ["Light", "Medium", "Heavy", "Helmets", "Shields"];
        case "gear":
            return ["Adventuring", "Survival", "Clerical", "Arcane", "Herbalism", "Crafting", "Occult"];
    }
    return [];
}

// Stub until you plug in real items
function get_equipment_items(column, category)
{
    // later: return global.equipment_data[$ column][$ category];
    return [
        { id: category + "_sample_1", name: category + " Item A", cost: 25 },
        { id: category + "_sample_2", name: category + " Item B", cost: 40 }
    ];
}


function draw_equipment_column(cc, x, column_id, title, lay)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var panel_w = lay.col_w;
    var panel_x = x - panel_w * 0.5;
    var panel_y = lay.panel_y;
    var panel_h = lay.panel_h;

    // Outer panel
    draw_set_color(make_color_rgb(18, 18, 18));
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_color(c_gray);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

    // Header
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x, panel_y + 12, title);

    var showing_items = (cc.equipment.selected_column == column_id
        && cc.equipment.selected_category != "");

    // Back button when in sub-panel
    if (showing_items)
    {
        draw_set_color(c_aqua);
        draw_text(x, panel_y + 36, "< " + cc.equipment.selected_category);
        draw_set_halign(fa_left);

        var items = get_equipment_items(column_id, cc.equipment.selected_category);
        var row_h = 28;
        var start_y = panel_y + 70;
        var btn_w = panel_w - 24;
        var btn_x = panel_x + 12;

        for (var i = 0; i < array_length(items); i++)
        {
            var item = items[i];
            var by = start_y + i * (row_h + 4);
            var hovered = point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h);

            if (hovered)
                cc.equipment.hovered_item = item.id;

            draw_set_color(hovered ? make_color_rgb(60, 55, 25) : make_color_rgb(28, 28, 28));
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, false);
            draw_set_color(hovered ? c_yellow : c_dkgray);
            draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, true);

            var qty = variable_struct_exists(cc.equipment.owned, item.id)
                ? cc.equipment.owned[$ item.id] : 0;

            draw_set_color(hovered ? c_yellow : c_white);
            draw_set_halign(fa_left);
            draw_text(btn_x + 8, by + 5, item.name);
            draw_set_halign(fa_right);
            draw_text(btn_x + btn_w - 8, by + 5,
                string(item.cost) + "g" + (qty > 0 ? "  x" + string(qty) : ""));
            draw_set_halign(fa_left);
        }
        return;
    }

    // Category list
    draw_set_halign(fa_left);
    var cats = get_equipment_categories(column_id);
    var row_h = 30;
    var start_y = panel_y + 50;
    var btn_w = panel_w - 24;
    var btn_x = panel_x + 12;

    for (var i = 0; i < array_length(cats); i++)
    {
        var cat = cats[i];
        var by = start_y + i * (row_h + 6);
        var hovered = point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h);

        if (hovered)
            cc.equipment.hovered_category = column_id + ":" + cat;

        draw_set_color(hovered ? make_color_rgb(50, 50, 30) : make_color_rgb(30, 30, 30));
        draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, false);
        draw_set_color(hovered ? c_yellow : c_gray);
        draw_rectangle(btn_x, by, btn_x + btn_w, by + row_h, true);

        draw_set_color(hovered ? c_yellow : c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(btn_x + btn_w * 0.5, by + row_h * 0.5, cat + "  >");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}