// State macros

// State category 0x: Petrified
#macro SLP_PETRIFIED_DEFAULT 00     // has both gravity and lifetime checks
#macro SLP_PETRIFIED_PERMANENT 01   // has gravity, but omits lifetime checks
#macro SLP_PETRIFIED_LAUNCHED 02    // has lifetime checks, omits gravity

// State category 1x: Active
#macro SLP_ACTIVE_DEFAULT 10        // standard wave motion w/ light tracking
#macro SLP_ACTIVE_ARC_UP 11         // used for diagonal venus reflect
#macro SLP_ACTIVE_ARC_DOWN 12       // ditto
#macro SLP_ACTIVE_RUSH 13           // fast, angled movement
#macro SLP_ACTIVE_HOMING 14         // homing attack

// State category 2x: Inactive
#macro SLP_INACTIVE_DEFAULT 20

// State category 3x: Despawning
#macro SLP_DESPAWN_PETRIFIED 30
#macro SLP_DESPAWN_ACTIVE 31
#macro SLP_DESPAWN_INACTIVE 32



state_timer += 1;
attempting_tracking = false;

// actual article behavior
switch (state) {
    
    case SLP_PETRIFIED_DEFAULT:
        if (state_timer >= 30) {
            spawn_hit_fx(x, y, player_id.fx_kragg_small); // temp
            set_state(SLP_ACTIVE_DEFAULT);
            hsp = 1*spr_dir;
            vsp = 0*spr_dir;
            reflected_player_id = noone;
        }
        // no break - most logic is shared with petrified-permanent
    
    case SLP_PETRIFIED_PERMANENT:
        hsp = clamp(hsp, -6, 6);
        vsp = clamp(vsp+0.3, -6, 6);
        break;
    
    // ------------------
    
    case SLP_ACTIVE_DEFAULT:
    
        hsp = clamp(hsp+0.2*spr_dir, -6, 6);
        vsp = 2*sin(pi*state_timer/20);
        
        if (state_timer >= 50) {
            set_state(SLP_INACTIVE_DEFAULT);
            hsp = 0;
            vsp = 0;
            reflected_player_id = noone;
        }
        
        else {
            
            find_tracking_target();
            if (targetted_player_id != noone) {
                var center_y = targetted_player_id.y - floor(player_id.char_height/2);
                if (y < center_y - 20) vsp += 1;
                else if (y > center_y + 20) vsp -= 1;
            }
            
        }
        
        break;
        
    // ------------------
    
    case SLP_INACTIVE_DEFAULT:
        hsp = 0;
        vsp = 0;
        if (state_timer > 300) {
            set_state(SLP_DESPAWN_INACTIVE);
        }
        break;
    
    // ------------------
    
    case SLP_DESPAWN_PETRIFIED:
    case SLP_DESPAWN_ACTIVE:
    case SLP_DESPAWN_INACTIVE:
        // This block shouldn't be reached_but just in case...
        should_die = true;
        break;
    
    // ------------------
    
    default:
        print_debug("article1 error: Invalid state " + state +  " reached. Destroying.");
        instance_destroy();
        exit;
        
}


// sprites and animations
switch(state) {
    case 00: // Petrified
    case 01:
    case 02:
        sprite_index = sprite_get("obj_sleeper_petrified_beta");
        break;
        
    case 10: // Active
    case 11:
    case 12:
    case 13:
    case 14:
        sprite_index = sprite_get("obj_sleeper_active_beta");
        break;
        
    case 20: // Inactive
        sprite_index = sprite_get("obj_sleeper_inactive_beta");
        break;
        
    case 30: // Despawning
    case 31: 
    case 32: 
        sprite_index = sprite_get("null");
        break;
}


if (should_die) { //despawn and exit script
    spawn_hit_fx(x, y, despawn_vfx);
    instance_destroy();
    exit;
}


#define set_state(_state)
    state = _state;
    state_timer = 0;
    should_die = false;
    
    // state inits
    switch _state {
        
        case SLP_ACTIVE_DEFAULT:
            hsp = 1*spr_dir;
            vsp = 0;
            break;
        
        case SLP_INACTIVE_DEFAULT:
            hsp = 0;
            vsp = 0;
            reflected_player_id = noone;
            break;
        
        case SLP_DESPAWN_PETRIFIED:
        case SLP_DESPAWN_ACTIVE:
        case SLP_DESPAWN_INACTIVE:
            should_die = true;
            // TODO: set despawn_vfx based on despawn state
            break;
        
    }

#define create_article_hitbox(atk, hitbox_num, _x, _y)
    var article_hitbox = create_hitbox(atk, hitbox_num, _x, _y);
    article_hitbox.sleeper_owner = self;
    article_hitbox.faux_reflected = false;
    apply_hitbox_reflection(article_hitbox);
    return article_hitbox;

#define find_tracking_target()
    var old_mask = mask_index;
    var min_distance = 99999999999;
    mask_index = sprite_get("obj_sleeper_tracker_mask_"+string(spr_dir));
    targetted_player_id = noone;
    attempting_tracking = true;
    
    var pseudo_owner = reflected_player_id;
    if (pseudo_owner == noone) pseudo_owner = player_id;
    with pHurtBox {
        var is_valid_target = get_match_setting(SET_TEAMATTACK) ? (player != pseudo_owner.player) : (get_player_team(player) != get_player_team(pseudo_owner.player));
        
        if (is_valid_target && place_meeting(x, y, other)) {
            var center_y = playerID.y - floor(playerID.char_height/2);
            var dist = point_distance(other.x, other.y, playerID.x, center_y);
            
            if (dist < min_distance) {
                other.targetted_player_id = playerID;
                min_distance = dist;
            }
        }
    }
    
    mask_index = old_mask;

#define apply_hitbox_reflection(hitbox) // TODO
    if (reflected_player_id == noone) {
        if (hitbox.faux_reflected) {
            // clear reflection
            // hitbox.faux_reflected = false;
        }
    }
    else {
        // apply reflecting info (accounting for faux_reflected)
        // hitbox.faux_reflected = true;
    }
    return hitbox;