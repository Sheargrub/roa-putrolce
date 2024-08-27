// Alternate draw_hud (compat for Demon Horde)
// Arrow sprite differs from normal.

if ("stance" not in self) exit;

var st = stance-1;

draw_sprite_ext(sprite_get("hud"), 0, temp_x-8, temp_y-38, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_get("hud_floatingarrows"), 0, temp_x-8, temp_y-38, 2, 2, 0, stance_colors[st], 1);
draw_sprite_ext(sprite_get("hud_stomach"), st, temp_x-10, temp_y-32, 2, 2, 0, c_white, 1);

var pips = ceil(hunger_meter/10);
var has_pips = (pips > 0);
if (!has_pips && st == 0) pips = 9;
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

if (hunger_locked) {
    draw_debug_text(temp_x-6, temp_y+20, "DEBUG: Hunger lock activated.");
    draw_debug_text(temp_x-6, temp_y+36, "Deactivate with SHIELD+TAUNT.");
}