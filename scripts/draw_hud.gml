
if ("stance" not in self) exit;

var st = stance-1;

draw_sprite_ext(sprite_get("hud"), 0, temp_x-8, temp_y-38, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_get("hud_playerarrows"), 0, temp_x-8, temp_y-38, 2, 2, 0, get_player_hud_color(player), 1);
draw_sprite_ext(sprite_get("hud_stomach"), st, temp_x-10, temp_y-32, 2, 2, 0, c_white, 1);

var pips = ceil(hunger_meter/10)-1;
var has_pips = (pips > 0);
if (!has_pips) pips = 9;

var _x = temp_x + 30;
var _y = temp_y - 33; // 28+5
var x_offset = 0;
var y_offset = 5;

for (var i = 0; i < pips; i++) {
    if (has_pips) y_offset = min(abs(5-vis_meter_falls[i]), abs(5-vis_meter_rises[i]));
    draw_sprite_ext(sprite_get("hud_pips"), st, _x+x_offset, _y+y_offset, 2, 2, 0, c_white, 1);
    x_offset += 18;
}

//draw_debug_text(temp_x - 70, temp_y - 15, "Hunger: " + string(hunger_meter));
//draw_debug_text(temp_x + 70, temp_y - 15, "Stance: " + stance_names[stance-1] + " (" + string(stance) + ")");

/*
if (should_debug) {
    if (lightweight_debug) {
        draw_debug_text(temp_x - 70, temp_y - 45, "Input UP/DOWN+TAUNT to edit hunger");
        draw_debug_text(temp_x - 70, temp_y - 30, "Input PARRY to toggle in-depth info listing");
    } else {
        draw_debug_text(temp_x - 70, temp_y - 120, "Input PARRY to return");
        draw_debug_text(temp_x - 70, temp_y - 105, "Input TAUNT+PARRY to disable debug HUD elements");
        draw_debug_text(temp_x - 70, temp_y - 90, "Previous State: "+get_state_name(prev_state));
        draw_debug_text(temp_x - 70, temp_y - 75, "State: "         +get_state_name(state));
        draw_debug_text(temp_x + 70, temp_y - 75, "State Timer: "   +string(state_timer));
        draw_debug_text(temp_x - 70, temp_y - 60, "Attack: "        +string(attack));
        draw_debug_text(temp_x - 70, temp_y - 45, "Window: "        +string(window));
        draw_debug_text(temp_x - 70, temp_y - 30, "Window Timer: "  +string(window_timer));
        draw_debug_text(temp_x + 70, temp_y - 60, "HSP: "   +string(hsp));
        draw_debug_text(temp_x + 70, temp_y - 45, "VSP: "   +string(vsp));
        draw_debug_text(temp_x + 70, temp_y - 30, "Image Index: "   +string(image_index));
    }
}
*/

