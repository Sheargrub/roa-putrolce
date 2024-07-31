
if ("stance" not in self) exit;

var st = stance-1;

draw_sprite_ext(sprite_get("hud"), 0, temp_x-8, temp_y-38, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_get("hud_playerarrows"), 0, temp_x-8, temp_y-38, 2, 2, 0, get_player_hud_color(player), 1);
draw_sprite_ext(sprite_get("hud_stomach"), st, temp_x-10, temp_y-32, 2, 2, 0, c_white, 1);

var pips = ceil(hunger_meter/10)-1;
var has_pips = (pips > 0);
if (!has_pips) {
    pips = 9;
    st = 0; // force empty graphic if no pips
}
else if (st == 0) st++; // do not use empty graphic for visible pips

var _x = temp_x + 30;
var _y = temp_y - 33; // 28+5
var x_offset = 0;
var y_offset = 5;

for (var i = 0; i < pips; i++) {
    if (has_pips) y_offset = min(abs(5-vis_meter_falls[i]), abs(5-vis_meter_rises[i]));
    draw_sprite_ext(sprite_get("hud_pips"), st, _x+x_offset, _y+y_offset, 2, 2, 0, c_white, 1);
    x_offset += 18;
}