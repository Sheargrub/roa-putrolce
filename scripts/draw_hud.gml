
if ("should_debug" not in self) exit;

var stance_

draw_debug_text(temp_x - 70, temp_y - 15, "Hunger: " + string(hunger_meter));
draw_debug_text(temp_x + 70, temp_y - 15, "Stance: " + stance_names[stance-1] + " (" + string(stance) + ")");

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