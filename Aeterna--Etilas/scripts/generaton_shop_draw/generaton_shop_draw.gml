function generation_shop_draw()
{
    var cc = global.char_creation;
   
    if (!variable_struct_exists(cc, "generation")) return;
   
    // Safety defaults
    if (!variable_struct_exists(cc, "hovered_table")) cc.hovered_table = "";
    if (!variable_struct_exists(cc, "hovered_skill")) cc.hovered_skill = "";
    if (!variable_struct_exists(cc, "selected_table")) cc.selected_table = "";
    if (!variable_struct_exists(cc.generation, "tables_locked")) cc.generation.tables_locked = false;

    if (!variable_struct_exists(cc, "generation_hover"))
    {
        cc.generation_hover = {
            cdt_minus: false,
            cdt_plus: false,
            gold_minus: false,
            gold_plus: false
        };
    }

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var L = generation_layout(cc);

    draw_text(L.center_x, 40, "CHARACTER GENERATION");
    draw_text(L.center_x, 70, "Remaining Character Points: "
        + string(cc.generation_slots_remaining)
        + " / "
        + string(cc.generation_slots_total));

    // CDT & Gold
    draw_cdt_gold_panels(cc, L);

    // =================================================
    // COLUMNS - Adjusted Layout
    // =================================================
    var col_w = 280;           // Wider for tables
    var col_gap = 40;          // Reduced gap
    var yy = 320;

    var tables_x = L.center_x - col_w - col_gap;   // Center-left
    var skills_x = L.center_x + 30;                // Slightly right of center
    var talents_x = L.center_x + col_w + col_gap;  // Far right

    // Main Columns
    draw_tables_column(cc, L, tables_x);           // Pass tables_x if needed
    draw_skills_column(cc, L, skills_x);           // Pass skills_x if needed

    draw_set_color(c_white);
    draw_text(talents_x, yy, "TALENTS");

    // Tooltips and Popups
    draw_skill_tooltip(cc);
    if (variable_struct_exists(cc, "specialization_popup") && cc.specialization_popup)
        draw_specialization_popup(cc, L);

    draw_set_color(c_white);
}