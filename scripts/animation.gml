//a
switch(state) {
    // grounded movement
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
    case PS_CROUCH:
        
        break;
    case PS_WALK:
        
        break;
    case PS_WALK_TURN:
        
        break;
    case PS_DASH:
        
        break;
    case PS_DASH_START:
        // 'moonwalk' (dashing backwards) animation
        if (dash_moonwalks) {
            if (hsp * spr_dir < 0) {
                sprite_index = sprite_get("moonwalk");
            }
        }
        break;
    case PS_DASH_TURN:
        
        break;
    case PS_DASH_STOP:
        
        break;
    
    // jump + land
    case PS_JUMPSQUAT:
        
        break;
    case PS_LAND:
        
        break;
    case PS_LANDING_LAG:
        
        break;
    case PS_WAVELAND:
        
        break;
    case PS_PRATLAND:
        
        break;
    
    // air movement
    case PS_FIRST_JUMP:
        // idle air loop
        if (idle_air_loops) {
            if (image_index == jump_frames && !idle_air_looping) {
                idle_air_looping = true;
            }
            if (idle_air_looping) {
                sprite_index = sprite_get("jumploop");
                image_index = state_timer * idle_air_loop_speed;
            }
        }
        break;
    case PS_IDLE_AIR:
        // Animation for when dropping from a platform
        if (idle_air_platfalls && !idle_air_looping) {
            if (state_timer == 1 && prev_state == PS_CROUCH && ground_type == 2) {
                idle_air_platfalling = true;
            }
            if (state_timer * idle_air_platfall_speed >= idle_air_platfall_frames) {
                idle_air_platfalling = false;
            }
            
            if (idle_air_platfalling) {
                sprite_index = sprite_get("platfall");
                image_index = state_timer * idle_air_platfall_speed;
            }
            
        }
        // idle air loop
        if (idle_air_loops && !idle_air_platfalling) {
            if (image_index == jump_frames && !idle_air_looping) {
                idle_air_looping = true;
            }
            if (idle_air_looping) {
                sprite_index = sprite_get("jumploop");
                image_index = state_timer * idle_air_loop_speed;
            }
        }
        
        //if neither, make sure it's jump
        //if (!idle_air_looping && !idle_air_platfalling) {
        //    sprite_index = sprite_get("jump");
        //}
        break;
    case PS_DOUBLE_JUMP:
        
        break;
    case PS_WALL_JUMP:
        
        break;
    case PS_PRATFALL:
        
        break;
    
    // shield actions
    case PS_PARRY:
        
        break;
    case PS_PARRY_START:
        
        break;
    case PS_ROLL_FORWARD:
        
        break;
    case PS_ROLL_BACKWARD:
        
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
        break;
}
