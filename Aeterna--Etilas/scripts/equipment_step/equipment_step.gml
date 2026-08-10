function equipment_shop_update(cc)
{
    equipment_step_init(cc);
	
    
	
	var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var clicked = mouse_check_button_pressed(mb_left);
var right_clicked = mouse_check_button_pressed(mb_right);

var L = {
    center_x: display_get_gui_width() * 0.5,
    center_y: display_get_gui_height() * 0.5
};

var lay = equipment_layout(L);
	
    // Confirm
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var btn_w = 260;
    var btn_h = 60;
    var btn_x = (screen_w - btn_w) * 0.5;
    var btn_y = screen_h - 100;

    if (clicked && point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h))
    {
        go_to_next_step(cc);
        return;
    }

    handle_equipment_column(cc, lay.weapons_x, "weapons", lay, mx, my, clicked, right_clicked);
    handle_equipment_column(cc, lay.armor_x,   "armor",   lay, mx, my, clicked, right_clicked);
    handle_equipment_column(cc, lay.gear_x,    "gear",    lay, mx, my, clicked, right_clicked);
}

function handle_equipment_column(cc, x, column_id, lay, mx, my, clicked, right_clicked)
{
    var panel_w = lay.col_w;
    var panel_x = x - panel_w * 0.5;
    var panel_y = lay.panel_y;
    var btn_w = panel_w - 24;
    var btn_x = panel_x + 12;

    var showing_items = (cc.equipment.selected_column == column_id
        && cc.equipment.selected_category != "");

    if (showing_items)
    {
        // Back (click header area)
        if (clicked && point_in_rectangle(mx, my, panel_x, panel_y, panel_x + panel_w, panel_y + 60))
        {
            cc.equipment.selected_category = "";
            cc.equipment.selected_column = "";
            return;
        }

        var items = get_equipment_items(column_id, cc.equipment.selected_category);
        var row_h = 28;
        var start_y = panel_y + 70;

        for (var i = 0; i < array_length(items); i++)
        {
            var item = items[i];
            var by = start_y + i * (row_h + 4);

            if (!point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h))
                continue;

            if (clicked)
            {
                // Buy
                if (cc.equipment.gold >= item.cost)
                {
                    cc.equipment.gold -= item.cost;
                    if (!variable_struct_exists(cc.equipment.owned, item.id))
                        cc.equipment.owned[$ item.id] = 0;
                    cc.equipment.owned[$ item.id]++;
                }
            }
            else if (right_clicked)
            {
                // Sell one
                if (variable_struct_exists(cc.equipment.owned, item.id)
                    && cc.equipment.owned[$ item.id] > 0)
                {
                    cc.equipment.owned[$ item.id]--;
                    cc.equipment.gold += item.cost;
                    if (cc.equipment.owned[$ item.id] <= 0)
                        variable_struct_remove(cc.equipment.owned, item.id);
                }
            }
            return;
        }
        return;
    }

    // Categories
    var cats = get_equipment_categories(column_id);
    var row_h = 30;
    var start_y = panel_y + 50;

    for (var i = 0; i < array_length(cats); i++)
    {
        var cat = cats[i];
        var by = start_y + i * (row_h + 6);

        if (!point_in_rectangle(mx, my, btn_x, by, btn_x + btn_w, by + row_h))
            continue;

        if (clicked)
        {
            cc.equipment.selected_column = column_id;
            cc.equipment.selected_category = cat;
        }
        return;
    }
}