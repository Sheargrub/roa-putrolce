
cpu_hover_update(); // Supersonic CPU hover script

// Voice mode button logic
var cursor_x = get_instance_x(cursor_id);
var cursor_y = get_instance_y(cursor_id);

// Account for CPUs/online
ht_col_online = get_player_color(0);
if (get_player_hud_color(player) == c_gray) {
	ht_x = ht_x_cpu;
	ht_y = ht_y_cpu;
}
else if (get_player_hud_color(player) == ht_col_online) {
	ht_x = ht_x_online;
	ht_y = ht_y_online;
} else {
    ht_x = ht_x_default;
    ht_y = ht_y_default;
}
	
ht_hovered = (x+ht_x < cursor_x && cursor_x < x+ht_x+ht_w && y+ht_y < cursor_y && cursor_y < y+ht_y+ht_h);
suppress_cursor = ht_hovered;

// 2 enables HUD, 1 disables it
if (ht_hovered && menu_a_pressed) {
	
	ht_status = !ht_status;
    set_synced_var(player, ht_status);
    sound_play(asset_get("mfx_option"));
    
}


//as always, #defines go at the bottom of the script.
#define cpu_hover_update()
var p = player;
var is_cpu = (get_player_hud_color(p) == 8421504);

if (is_cpu) {
    var pb = plate_bounds, cs = cursors;
    if (cpu_is_hovered) {
        var c = cs[@cpu_hovering_player]
        cursor_id = c;
        var cx = get_instance_x(c),
            cy = get_instance_y(c);
        if (cpu_hover_time < 10) cpu_hover_time++;
        if (cpu_color_swap_time < 5) cpu_color_swap_time++;
        if (cx != clamp(cx, pb[0],pb[2]) || cy != clamp(cy, pb[1],pb[3])) {
            cpu_is_hovered = false;
            c = cs[@p];
            cursor_id = c;
        }
    } else {
        var hplayer = get_new_hovering_player();
        if (cpu_hover_time > 0) cpu_hover_time--;
        if (hplayer != -1) {
            cpuh_new_color = get_player_hud_color(hplayer);
            if (cpu_hover_time > 0) {
                cpuh_prev_color = get_player_hud_color(cpu_hovering_player);
                cpu_color_swap_time = 0;
            } else { //if the player indicator is not being displayed already
                cpuh_prev_color = cpuh_new_color;
                cpu_color_swap_time = 10;
            }
            cpu_is_hovered = true;
            cpu_hovering_player = hplayer;
            cursor_id = cs[@hplayer];
        }
    }
}
else {
    cpu_is_hovered = false;
    cpu_hover_time = 0;
    cursor_id = cursors[player];
}

#define get_new_hovering_player()
var pb = plate_bounds, cs = cursors;
for (var i = 1; i <= 4; i++) {
    var c = cs[@i];
    var cx = get_instance_x(c);
    var cy = get_instance_y(c);
    if cx == clamp(cx, pb[@0], pb[@2]) && cy == clamp(cy, pb[@1], pb[@3]) {
        return i;
    } 
}
return -1;