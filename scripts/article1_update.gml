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
#macro SLP_DESPAWN_FADE 31
#macro SLP_DESPAWN_DIE 32


state_timer += 1;
attempting_tracking = false;
block_hitbox_checks = false;


//#region Venus reflect checks
if (venus_article_reflect == 2 && (venus_reflected || instance_exists(venus_rune_ID))) {
    var colliding = false;
    
    if (instance_exists(venus_rune_ID)) with (venus_rune_ID) {
        if (state == "mirror" && place_meeting(x, y, other)) colliding = true;
    }
    
    if (!colliding) venus_reflected = 0;
    else if (colliding && !venus_reflected) venus_reflected = 1;
}

if (venus_reflected && !venus_late_reflect_frame) {
    
    if (hsp != 0) spr_dir = (hsp < 0) ? -1 : 1;
    venus_was_reflected = true;
    
    if (instance_exists(venus_rune_ID)) {
		venus_rune_ID.hp -= 0.5;
		reflected_player_id = venus_rune_ID.player_id;
		venus_rune_angle = venus_rune_ID.rune_angle;
	}
    
    switch state {
        case SLP_ACTIVE_DEFAULT:
            
            // Horizontal: bounce backward, maintaining sine motion progress
            if (venus_rune_angle < 10 || (170 < venus_rune_angle && venus_rune_angle < 190) || 350 < venus_rune_angle) {
                hsp *= -1;
                active_move_offset = (state_timer*active_move_coefficient + active_move_offset) % (2*pi);
                state_timer = 0;
            }
            
            // Vertical: bounce off vertically if appropriate, but do not change trajectory
            else if ((80 < venus_rune_angle && venus_rune_angle < 100) || (260 < venus_rune_angle && venus_rune_angle < 280)) {
                if (!instance_exists(venus_rune_ID) || (hsp < 0) == (y < venus_rune_ID.y)) active_move_offset = (active_move_offset + pi) % (2*pi);
            }
            
            else {
                print_debug("unhandled");
            }
            
            
            
            break;
        case SLP_ACTIVE_ARC_UP:
            break;
        case SLP_ACTIVE_ARC_DOWN:
            break;
        case SLP_ACTIVE_RUSH:
            state_timer = 0;
            break;
        case SLP_ACTIVE_HOMING:
            move_angle = point_direction(hsp, vsp, 0, 0); // since it starts by moving backwards
            move_speed = -15;
            if (!instance_exists(active_hitbox)) auto_gen_hitbox();
            if (instance_exists(venus_rune_ID) && venus_rune_ID.player_id == targetted_player_id) targetted_player_id = player_id;
            break;
    }
    
	apply_hitbox_reflection(petrified_hitbox);
    apply_hitbox_reflection(active_hitbox);
    
    // venus_late_reflect_frame is set at the bottom of the script to allow checks for frame 1 of a reflect.
    
}
//#endregion


//#region Article behavior -----------------------------------------------------
switch (state) {
    
    case SLP_PETRIFIED_DEFAULT:
        if (state_timer >= 30 && hit_player_id == noone) {
            var break_fx = spawn_hit_fx(x, y, player_id.fx_kragg_small);
            break_fx.depth = depth-1;
            sound_play(asset_get("sfx_kragg_rock_shatter"));
            set_state(SLP_ACTIVE_DEFAULT);
            active_hitbox = auto_gen_hitbox();
            hsp = 1*spr_dir;
            vsp = 0*spr_dir;
        }
        // no break - most logic is shared with petrified-permanent
    
    case SLP_PETRIFIED_PERMANENT:
        hsp = clamp(hsp, -6, 6);
        vsp = clamp(vsp+0.3, -6, 6);
        
        if (was_parried) {
            was_parried = false;
            var break_fx = spawn_hit_fx(x, y, player_id.fx_kragg_small);
            break_fx.depth = depth-1;
            sound_play(asset_get("sfx_kragg_rock_shatter"));
            targetted_player_id = player_id;
            set_state(SLP_ACTIVE_HOMING);
        }
        
        if (hit_player_id != noone) {
            var break_fx = spawn_hit_fx(x, y, player_id.fx_kragg_small);
            break_fx.depth = depth-1;
            sound_play(asset_get("sfx_kragg_rock_shatter"));
            targetted_player_id = hit_player_id;
            set_state(SLP_ACTIVE_HOMING);
        }
        
        break;
    
    // ------------------
    
    case SLP_ACTIVE_DEFAULT:
    
        hsp = clamp(hsp+0.2*spr_dir, -6, 6);
        vsp = 2*sin(active_move_coefficient*state_timer + active_move_offset);
        
        if (was_parried) {
            was_parried = false;
            targetted_player_id = player_id;
            set_state(SLP_ACTIVE_HOMING);
        }
        
        else if (state_timer >= 50 || hit_player_id != noone) {
            set_state(SLP_INACTIVE_DEFAULT);
            vsp = 0;
            hit_player_id = noone;
            reflected_player_id = noone;
        }
        
        else {
            
            find_tracking_target();
            if (targetted_player_id != noone) {
                var center_y = get_center_y(targetted_player_id);
                if (y < center_y - 20) vsp += 1;
                else if (y > center_y + 20) vsp -= 1;
            }
            
        }
        
        break;
    
    case SLP_ACTIVE_HOMING:
        if (targetted_player_id != noone) {
            var target_move_angle = point_direction(x, y, targetted_player_id.x, get_center_y(targetted_player_id));
            var diff = angle_difference(move_angle, target_move_angle);
            if (abs(diff) < 10) move_angle = target_move_angle;
            else if (diff < 0) move_angle += 10;
            else move_angle -= 10;
        }
        move_speed = clamp(move_speed+0.8, -20, 20);
        hsp = lengthdir_x(move_speed, move_angle);
        vsp = lengthdir_y(move_speed, move_angle);
        spr_dir = (90 < move_angle && move_angle <= 270) ? -1 : 1;
        
        if (was_parried) {
            was_parried = false;
            targetted_player_id = player_id;
            set_state(SLP_ACTIVE_HOMING);
        }
        
        else if (move_speed <= 0.9) {
            block_hitbox_checks = true;
            if (place_meeting(x, y, asset_get("plasma_field_obj"))) {
                sound_play(asset_get("sfx_clairen_hit_weak"));
                set_state(SLP_DESPAWN_DIE);
            }
            else if (move_speed >= 0 && active_hitbox == noone) active_hitbox = auto_gen_hitbox();
        }
        
        else if ( (!instance_exists(targetted_player_id) && state_timer >= 60)
          || (instance_exists(targetted_player_id) && point_distance(x, y, targetted_player_id.x, get_center_y(targetted_player_id)) < move_speed)
          || (state_timer >= 200)
        ) {
            set_state(SLP_INACTIVE_DEFAULT);
            hit_player_id = noone;
            reflected_player_id = noone;
        }
        break;
        
    // ------------------
    
    case SLP_INACTIVE_DEFAULT:
        hsp *= 0.85;
        vsp *= 0.85;
        
        if (place_meeting(x, y, asset_get("plasma_field_obj"))) {
            sound_play(asset_get("sfx_clairen_hit_weak"));
            set_state(SLP_DESPAWN_DIE);
        }
        
        else if (state_timer >= 300) {
            set_state(SLP_DESPAWN_FADE);
        }
        
        else if (state_timer % 50 == 0) {
            var vfx = spawn_hit_fx(x+20, y-20, player_id.fx_slp_sleeping);
            vfx.depth = depth-1;
            vfx.spr_dir = 1;
        }
        
        break;
    
    // ------------------
    
    case SLP_DESPAWN_PETRIFIED:
    case SLP_DESPAWN_FADE:
    case SLP_DESPAWN_DIE:
        // These despawn states should normally only reached through external interference, so set_state() needs to be re-run.
        set_state(state);
        break;
    
    // ------------------
    
    default:
        print_debug("article1 error: Invalid state " + state +  " reached. Destroying.");
        instance_destroy();
        exit;
        
}
//#endregion


//#region Hitboxes
if (state <= 9) { // petrified
    if (instance_exists(active_hitbox)) {
        active_hitbox.destroyed = true;
        active_hitbox = noone;
    }
    if (instance_exists(petrified_hitbox)) {
        petrified_hitbox.hitbox_timer--;
        petrified_hitbox.x = x;
        petrified_hitbox.y = y;
        petrified_hitbox.hsp = vsp;
        petrified_hitbox.vsp = vsp;
        petrified_hitbox.spr_dir = spr_dir;
    }
    else if (!block_hitbox_checks) {
        set_state(SLP_DESPAWN_PETRIFIED);
    }
}
else if (state <= 19) { // active
    if (instance_exists(petrified_hitbox)) {
        petrified_hitbox.destroyed = true;
        petrified_hitbox = noone;
    }
    if (instance_exists(active_hitbox)) {
        active_hitbox.hitbox_timer--;
        active_hitbox.x = x;
        active_hitbox.y = y;
        active_hitbox.hsp = vsp;
        active_hitbox.vsp = vsp;
        active_hitbox.spr_dir = spr_dir;
    }
    else if (!block_hitbox_checks) {
        set_state(SLP_DESPAWN_DIE);
    }
}
//#endregion


//#region Sprites and animation
switch(state) {
    case 00: // Petrified
    case 01:
    case 02:
        sprite_index = sprite_get("slp_statue_temp");
        break;
        
    case 10: // Active
    case 11:
    case 12:
        sprite_index = sprite_get("slp_statue_to_active_temp");
        break;
    
    case 13: // Active, aggressive
    case 14:
        sprite_index = sprite_get("null"); // draw angled; see post_draw
        break;
        
    case 20: // Inactive
        sprite_index = sprite_get("slp_idle_passive");
        image_index = (state_timer / 12);
        break;
        
    case 30: // Despawning
    case 31: 
    case 32: 
        sprite_index = sprite_get("null");
        break;
}
//#endregion


//#region Despawn handling
if (should_die) {
    var despawn_fx = spawn_hit_fx(x, y, despawn_vfx);
    despawn_fx.depth = depth;
    despawn_fx.spr_dir = spr_dir;
    sound_play(despawn_sfx);
    instance_destroy();
    exit;
}
//#endregion


// venus compat / logical operator abuse
venus_late_reflect_frame = venus_reflected;


#define set_state(_state)
    state = _state;
    state_timer = 0;
    should_die = false;
    
    // state inits
    switch _state {
        
        case SLP_PETRIFIED_DEFAULT:
        case SLP_PETRIFIED_PERMANENT:
        case SLP_PETRIFIED_LAUNCHED:
            venus_article_reflect = 1;
            break;
        
        case SLP_ACTIVE_DEFAULT:
            hsp = 1*spr_dir;
            vsp = 0;
            venus_article_reflect = 2;
            break;
        
        case SLP_ACTIVE_HOMING:
            // precondition: targetted_player_id should be set
            move_speed = -15;
            if (instance_exists(targetted_player_id)) move_angle = point_direction(x, y, targetted_player_id.x, get_center_y(targetted_player_id));
            else move_angle = (spr_dir == 1) ? 0 : 180;
            hsp = lengthdir_x(move_speed, move_angle);
            vsp = lengthdir_y(move_speed, move_angle);
            if (instance_exists(active_hitbox)) {
                active_hitbox.destroyed = true;
                active_hitbox = noone;
            }
            block_hitbox_checks = true;
            hit_player_id = noone;
            venus_article_reflect = 1;
            break;
        
        case SLP_INACTIVE_DEFAULT:
            if (block_idle_state) set_state(SLP_DESPAWN_FADE);
            else {
                sound_play(asset_get("sfx_forsburn_consume_fail"));
                hit_player_id = noone;
                reflected_player_id = noone;
            }
            venus_article_reflect = 0;
            break;
        
        case SLP_DESPAWN_PETRIFIED:
            despawn_sfx = asset_get("sfx_kragg_rock_shatter");
            despawn_vfx = player_id.fx_kragg_small;
            should_die = true;
            break;
        
        case SLP_DESPAWN_FADE:
            despawn_sfx = asset_get("sfx_birdflap");
            despawn_vfx = player_id.fx_slp_phase;
            should_die = true;
            break;
        
        case SLP_DESPAWN_DIE:
            despawn_sfx = asset_get("sfx_absa_cloud_crackle");
            despawn_vfx = player_id.fx_slp_destroyed;
            should_die = true;
            break;
        
    }


// Assumes that state has already been set.
#define auto_gen_hitbox()
    var article_hitbox = noone;
    if (state <= 9) article_hitbox = create_article_hitbox(AT_NSPECIAL, 1+block_active_state, x, y);
    else if (state <= 19) article_hitbox = create_article_hitbox(AT_NSPECIAL, 3, x, y);
    return article_hitbox

// Mirror changes in init.gml
#define create_article_hitbox(atk, hitbox_num, _x, _y)
    var article_hitbox = create_hitbox(atk, hitbox_num, _x, _y);
    article_hitbox.sleeper_owner = self;
    article_hitbox.faux_reflected_owner = noone;
    article_hitbox.venus_article_proj_ignore = true;
    apply_hitbox_reflection(article_hitbox);
    return article_hitbox;

#define find_tracking_target()
    var old_mask = mask_index;
    var min_distance = 99999999999;
    mask_index = sprite_get("slp_tracker_mask_"+string(spr_dir));
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

#define apply_hitbox_reflection(hitbox)
    if (!instance_exists(hitbox)) return noone;
    else if (reflected_player_id == noone) {
        if (hitbox.faux_reflected_owner != noone) {
            hitbox.can_hit[@ hitbox.faux_reflected_owner.player] = true;
            hitbox.can_hit_self = false;
            hitbox.faux_reflected_owner = noone;
        }
    }
    else {
        if (hitbox.faux_reflected_owner != noone) for (var i = 0; i < 20; i++) hitbox.can_hit[@ i] = true;
    	hitbox.can_hit_self = true;
    	hitbox.can_hit[@ reflected_player_id.player] = false;
        hitbox.faux_reflected_owner = reflected_player_id;
    }
    return hitbox;

#define get_center_y(in_player_id)
    return in_player_id.y - floor(in_player_id.char_height/2)