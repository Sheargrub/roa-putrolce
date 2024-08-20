//a
switch(state) {
    // Idle flourish
    case PS_IDLE:
        if (idle_flourish_timer > 0) {
            sprite_index = sprite_get("idle_flourish"+stance_suffixes[stance-1]);
            image_index = (idle_flourish_timer_max - idle_flourish_timer) * idle_flourish_speed_stances[stance-1];
        }
        else {
            sprite_index = sprite_get("idle"+stance_suffixes[stance-1]);
            image_index = state_timer*idle_anim_speed;
        }
        break;
    
    // attacks
    case PS_ATTACK_GROUND:
        // loop strong charge window, if the loop is set
        if (window == get_attack_value(attack,AG_STRONG_CHARGE_WINDOW) && get_window_value(attack,window,AG_WINDOW_HAS_CHARGE_LOOP) && strong_charge > 0) {
            image_index = get_window_value(attack,window,AG_WINDOW_CHARGE_FRAME_START) + (round(strong_charge * get_window_value(attack,window,AG_WINDOW_CHARGE_LOOP_SPEED)) mod get_window_value(attack,window,AG_WINDOW_CHARGE_FRAMES));
        }
        break;
    case PS_ATTACK_AIR:
        if (window == get_attack_value(attack,AG_STRONG_CHARGE_WINDOW) && get_window_value(attack,window,AG_WINDOW_HAS_CHARGE_LOOP) && strong_charge > 0) {
            image_index = get_window_value(attack,window,AG_WINDOW_CHARGE_FRAME_START) + (round(strong_charge * get_window_value(attack,window,AG_WINDOW_CHARGE_LOOP_SPEED)) mod get_window_value(attack,window,AG_WINDOW_CHARGE_FRAMES));
        }
        if (attack == AT_USPECIAL) {
            if (7 <= window) {
                sprite_index = sprite_get("uspecial_grab");
                hurtboxID.sprite_index = sprite_get("uspecial_grab_hurt");
            }
            else if (has_rune_uspecaimable && window == 2) {
                sprite_index = sprite_get("null");
            }
        }
        break;
}


// Petrify compat
var nothing = sprite_get("null");
with oPlayer if ("putrolce_petrify_spr" in self) {
    if ((other.attack == AT_DSPECIAL && other.grabbed_player_obj == self) || putrolce_status_owner = other.player) {
        sprite_index = nothing;
    }
}
