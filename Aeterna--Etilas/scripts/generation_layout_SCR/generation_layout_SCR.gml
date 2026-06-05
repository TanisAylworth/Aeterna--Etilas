function generation_layout(cc)
{
    var sw = display_get_gui_width();

    return {
        center_x: sw * 0.5,
        panel_spacing: 140,
        top_y: 140,

        btn_w: 120,
        btn_h: 30,
        btn_gap: 20,

        panel_w: 260   // ✅ ADD THIS
    };
}