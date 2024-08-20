// B Reverse for the specials
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}
// window length of the current window of the attack
var window_length = get_window_value(attack, window, AG_WINDOW_LENGTH);

//dust
//good dust
switch(attack)
{
    	
    case AT_UTILT:
    	if (window == 1 && window_timer == 1 && get_window_value(AT_UTILT, 1, AG_WINDOW_LENGTH)-1 )
    		spawn_base_dust(x+(48*spr_dir),y, "dash", -spr_dir);
    	if (window == 3 && window_timer == 1 && get_window_value(AT_UTILT, 1, AG_WINDOW_LENGTH)-1 )
    		spawn_base_dust(x+(16*-spr_dir),y, "dash", spr_dir);
    break;
    
    case AT_USPECIAL:
    	if (window == 1 && window_timer == get_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH)-1 && !free) {
    		spawn_base_dust(x-(12*spr_dir),y, "dattack", -spr_dir);
    		spawn_base_dust(x+(12*spr_dir),y, "dattack", spr_dir);
    	}
    	if (window == 2 && window_timer == 1 ) {
    		spawn_base_dust(x,y-24, "doublejump", -spr_dir);
    	}
    	if (window == 5 && window_timer == 1 && get_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH)-1 ) {
    		spawn_base_dust(x+(32*-spr_dir),y, "dash_start", spr_dir);
    		spawn_base_dust(x-(32*-spr_dir),y, "dash_start", -spr_dir);
    	}
    break;
    	
}

// specific attack behaviour
switch(attack) {
    case AT_JAB:
        // clear attack so jab2 doesn't automatically happen
    	if (window == 1 && window_timer == 1) {
    		clear_button_buffer(PC_ATTACK_PRESSED);
    	}
        break;
    case AT_FTILT:
        if (window ==  1 && window_timer == 3) {
        	var x_default = ftilt_x_default + ftilt_x_search_offset;
        	var x_maximum = x_default;
        	var x_minimum = ftilt_x_minimum + ftilt_x_search_offset;
        	var x_offset = 0;
        	
        	// First, check if the farthest position is valid
        	if ( place_meeting(x+(x_maximum*spr_dir), y+1, asset_get("par_block"))
        	  || place_meeting(x+(x_maximum*spr_dir), y+1, asset_get("par_jumpthrough"))
        	) {
        		print_debug("near");
        		x_offset = x_maximum;
        	}
        	
        	// Then, check of the closest position needs to be used
        	else if ( !line_meeting(x+(x_default*spr_dir), y+1, x+(x_minimum*spr_dir), y+1, asset_get("par_block"))
        	  && !line_meeting(x+(x_default*spr_dir), y+1, x+(x_minimum*spr_dir), y+1, asset_get("par_jumpthrough"))
        	) {
        		print_debug("far");
        		x_offset = x_minimum;
        	}
        	
        	// If not, binary search for valid position
        	else {
        		x_offset = (x_minimum + x_maximum) / 2;
        		for (var i = 0; i < 8; i++) {
        			var solid_collide = line_meeting(x+(x_default*spr_dir), y+1, x+(x_offset*spr_dir), y+1, asset_get("par_block"));
        			var plat_collide = line_meeting(x+(x_default*spr_dir), y+1, x+(x_offset*spr_dir), y+1, asset_get("par_jumpthrough"));
        			if (solid_collide || plat_collide) x_minimum = x_offset;
        			else x_maximum = x_offset;
        			x_offset = (x_minimum + x_maximum) / 2;
        		}
        		x_offset = round(x_offset);
        	}
        	
        	x_offset -= ftilt_x_search_offset;
        	set_hitbox_value(AT_FTILT, 1, HG_HITBOX_X, x_offset);
        	ftilt_x_draw_offset = x_offset * spr_dir;
        }
        break;
    case AT_DTILT:
    	if (window == 3) && !was_parried {
    		var whiff_lag_mult = (has_hit ? 1 : 1.5)
    		if (window_timer == 1) sound_play_cancellable(get_window_value(attack, window, AG_WINDOW_SFX));
        	if (window_timer >= 10*whiff_lag_mult) iasa_script(); // update woodcock to match!
        	do_sfx_cancel = (window_timer-1 < floor(get_window_value(attack, window, AG_WINDOW_HUNGER_GAIN_FRAME)*whiff_lag_mult));
        	can_crouch = false;
    	}
        break;
    case AT_UTILT:
        //a
        break;
    case AT_DATTACK:
        if (has_hit) { can_ustrong = true }
        break;
    case AT_NAIR:
    	if (window == 1){
    		if (window_timer == get_window_value(AT_NAIR, 1, AG_WINDOW_LENGTH)){
        	sound_play(sound_get("nair_yell"), false, noone, 0.6, 0.9 + (random_func(0, 20, true)/100))}
    	}
    break;
    case AT_FAIR:
    	//a
        break;
    case AT_BAIR:
        //a
        break;
    case AT_DAIR:
        if(window == 1 && window_timer == 1){
        	if(stance == 4) sound_play(asset_get("sfx_shovel_swing_heavy1"), 0, noone, 1, 1);
        	else if(stance != 1) sound_play(asset_get("sfx_shovel_swing_med2"), 0, noone, 1, 1);
        }
        break;
    case AT_UAIR:
    	hud_offset = 24;
    	if (window == 1 && window_timer == window_length){
        	sound_play(asset_get("sfx_abyss_seed_fall"), false, noone, 1, 0.9)
    	}
        break;
    case AT_DSTRONG:
    	if (window == 2 && window_timer == 1){
        	sound_play(sound_get("nair_yell"), false, noone, 0.75, 0.95)
    	}
    	break;
    case AT_USTRONG:
    	if (window < 3 && window > 5) hud_offset = -24;
    	else hud_offset = 72;
    	if (window == 2 && window_timer == 1){
        	sound_play(asset_get("sfx_zetter_downb"), 0, noone, 1, 1)
        	sound_play(asset_get("sfx_kragg_rock_pillar"), 0, noone, 1, 1)
    	}
    	break;
    case AT_FSTRONG:
    	if (window == 2 && window_timer == 1){
    		sound_play(asset_get("sfx_orca_crunch"), false, noone, 1, 0.9)
    	}
    case AT_TAUNT:
    	move_cooldown[AT_TAUNT] = 60;
    	break;
    
    case AT_NSPECIAL:
    	move_cooldown[AT_NSPECIAL] = 45;
        if (window == 1 && window_timer == window_length) {
        	instance_create(x+(30*spr_dir), y-30, "obj_article1");
        }
        
        // This SFX felt out of place outside of a voiced mode.
        // if (window == 1 && window_timer == 1) sound_play(sound_get("putro_spit"), false, noone, 1, 1);
        
        break;
        
    case AT_FSPECIAL:
    	move_cooldown[AT_FSPECIAL] = 999;
    	switch window {
    		
    		case 1:
    			if (window_timer == 1) {
    				var max_hsp_vals = [7, 8.5, 7, 7.75];
	        		max_hsp = max_hsp_vals[stance-1];
	        		if (vsp >= 1) vsp -= 1;
	        		buffer_pratfall = free;
	        		fspec_armor_hits = (stance == ST_OVERSTUFFED);
	        		fspec_hit_sleeper = false;
	        		fspec_aftim_length = (stance == 1 || stance == 3) ? 10 : 20;
	        	} else if (window_timer == window_length) && (stance > 1){
	        		sound_play(asset_get("sfx_kragg_roll_turn"), 0, noone, 0.8 + stance*0.1, 1.4 - stance*0.15)
	        		sound_play(asset_get("sfx_shovel_swing_med1"), 0, noone, 1, 1)
	        	} else if (window_timer == window_length) && (stance == 1) {
	        		sound_play(asset_get("sfx_shovel_swing_med1"), 0, noone, 1, 1)
	        	}
	        	else if (vsp > 0) vsp = 0;
	        	hsp = clamp(hsp, -2, 2);
    			break;
    		
    		case 2:
    			if (window_timer == 1 && !hitpause && buffer_pratfall && vsp > -4) vsp = -4;
			
    		case 3:
    			can_move = false;
        		if (!hitpause) hsp = max_hsp * spr_dir;
        		super_armor = (fspec_armor_hits >= 1);
        		
        		if (fspec_hit_sleeper && stance <= 2) {
        			attack_end();
        			destroy_hitboxes();
        			buffer_pratfall = false;
        			buffer_pratfall_paused = false;
        			set_attack(AT_FSPECIAL_2);
        			user_event(2); // update move data
        		}
        		
        		else if (stance == 2 && !hitpause) {
        			can_attack = true;
        			can_jump = !free;
        			buffer_pratfall_paused = free;
        		}
        		
        		if (window_timer % 3 == 0) create_afterimage(fspec_aftim_length, stance_colors[stance-1]);
        		
    			break;
    		
    		case 4:
	    		if (max_hsp > air_max_speed) max_hsp -= 0.1;
	        	hsp = clamp(hsp, -max_hsp, max_hsp); // this approach allows air drift to work as normal
	        	
	        	if (window_timer == 1) {
    				super_armor = false;
	    			buffer_pratfall_paused = false;
	    			create_afterimage(fspec_aftim_length, stance_colors[stance-1]);
    			}
    			
    			if (window_timer == 4) create_afterimage(fspec_aftim_length, stance_colors[stance-1]);
	        
    			break;
    			
        }
        break;
    case AT_FSPECIAL_2:
    	can_move = false;
    	if (window == 1 && window_timer == 1) {
    		hsp = ((stance == 1) ? 4 : 5.5) * spr_dir;
			vsp = (stance == 1) ? -5 : -6;
			num_loops = 0;
			create_afterimage(20, stance_colors[stance-1]);
    	}
    	if (window == 2) {
    		if (!free) {
	    		window = 3;
	    		window_timer = 0;
	    		destroy_hitboxes();
	    		sound_play(asset_get("sfx_blow_medium2"));
    		}
    		else vsp -= 0.3; // reduce gravity
    		
    		if (window_timer == 1) num_loops++;
    		if (num_loops > 2 || (has_hit && stance == 2)) can_jump = true;
    	}
    	break;
    	
    case AT_DSPECIAL:
    	if (window == 1) {
    		dspec_sfx_instance = noone;
    		dspec_rethrow = false;
    	}
    	else if (4 <= window && window <= 6) {
    		can_move = false;
    		if (window == 4 && window_timer == window_length) {
    			sound_play_cancellable(get_window_value(attack, window, AG_WINDOW_SFX));
    		}
    		if (window < 6 && (special_pressed || is_special_pressed(DIR_ANY)) && instance_exists(grabbed_sleeper_id)) {
    			dspec_rethrow = true;
    		}
	        if (dspec_rethrow && !hitpause) {
	        	attack_end();
    			set_attack(AT_DSPECIAL_2);
    			user_event(2); // load new attack data, if appropriate
    			hurtboxID.sprite_index = get_attack_value(attack, AG_HURTBOX_SPRITE);
    			do_sfx_cancel = true;
	        }
	        if (window == 5) {
	        	if (window_timer == window_length && !dspec_rethrow) hsp = 20*spr_dir;
	        	else hsp = 0;
	        }
    	}
        break;
    case AT_DSPECIAL_2:
    	if (window == 1 && window_timer == window_length && instance_exists(grabbed_sleeper_id)) {
        	grabbed_sleeper_id.state = 1; // petrified, no lifetime checks
        	grabbed_sleeper_id.state_timer = 0;
        	grabbed_sleeper_id.reflected_player_id = (player == grabbed_sleeper_id.player) ? noone : self;
        	grabbed_sleeper_id.refresh_hitboxes = true;
        	grabbed_sleeper_id.is_grabbed = false;
        	grabbed_sleeper_id.is_linked = false;
        	grabbed_sleeper_id.block_idle_state = true;
			grabbed_sleeper_id.block_active_state = false;
        	grabbed_sleeper_id.venus_article_reflect = 1;
            grabbed_sleeper_id.hit_player_id = noone;
        	grabbed_sleeper_id.hsp = 7*spr_dir;
        	grabbed_sleeper_id.vsp = -5;
        	grabbed_sleeper_id.spr_dir = spr_dir;
        	
        	var rethrow_hbox = create_hitbox(AT_NSPECIAL, 1, floor(grabbed_sleeper_id.x), floor(grabbed_sleeper_id.y));
        	grabbed_sleeper_id.active_hitbox = rethrow_hbox;
        	rethrow_hbox.hsp = grabbed_sleeper_id.hsp;
        	rethrow_hbox.vsp = grabbed_sleeper_id.vsp;
        	
        	grabbed_player_obj = noone;
        	
        	spawn_hit_fx(grabbed_sleeper_id.x + 12*spr_dir, grabbed_sleeper_id.y, fx_kragg_small);
        }
        break;
        
    case AT_USPECIAL:
        can_fast_fall = false
        if (window == 1 || window >= 10) can_move = false;
        if (window < 5 || window == 9) can_wall_jump = true;
        
		if (window == 1 && vsp > 0) vsp = 0;
		
        //land
        if(window == 4 && !free){
        	window = 5;
        	window_timer = 0;
        	
        	sound_play(asset_get("sfx_zetter_downb"), 0, noone, 1, 1)
        	sound_play(asset_get("sfx_kragg_rock_pillar"), 0, noone, 1, 1)
        }
        
        //grab
        if ((window == 3 || window == 4) && (special_pressed || is_special_pressed(DIR_ANY))) {
        	set_attack_value(attack, AG_NUM_WINDOWS, 9);
        	window = 7;
        	window_timer = 0;
        	hsp = (spr_dir == -1) ? clamp(hsp, -3, -1) : clamp(hsp, 1, 3) 
        	vsp = -2;
        	var dir_held = (right_down - left_down);
        	if (dir_held != 0) spr_dir = dir_held;
        	grabbed_sleeper_id = noone;
        }
        
        if (window == 5 && window_timer == 1 && !has_hit_player) {
        	shake_camera(3,6);	
        }
        
        if (7 <= window && window <= 9) {
        	hsp = clamp(hsp, -3, 3);
        }
        
        if (!free) {
        	if (window == 9) {
	        	set_state(PS_PRATLAND);
	        	landing_lag = prat_land_time;
        	}
        	if (window == 15) {
        		set_state(PS_LANDING_LAG);
        		landing_lag = get_attack_value(attack, AG_LANDING_LAG);
        	}
        }
        
        // Hunger: adjust grab counts
        if (window == 11 && window_timer == 1) {
        	if (stance == 1 || stance == 4 || grabbed_player_obj == noone) {
        		set_window_value(attack, window, AG_WINDOW_GOTO, 14);
        		set_window_value(attack, window, AG_WINDOW_GRAB_POS_X, get_window_value(attack, 13, AG_WINDOW_GRAB_POS_X));
        		set_window_value(attack, window, AG_WINDOW_GRAB_POS_Y, get_window_value(attack, 13, AG_WINDOW_GRAB_POS_Y));
        		set_window_value(attack, window, AG_WINDOW_GRAB_ARC_Y, get_window_value(attack, 13, AG_WINDOW_GRAB_ARC_Y));
        	}
        	else {
        		reset_window_value(attack, window, AG_WINDOW_GOTO);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_POS_X);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_POS_Y);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_ARC_Y);
        	}
        }
        
        if (window == 12 && window_timer == 1) {
        	if (stance != 2) {
        		set_window_value(attack, window, AG_WINDOW_GOTO, 14);
        		set_window_value(attack, window, AG_WINDOW_GRAB_POS_X, get_window_value(attack, 13, AG_WINDOW_GRAB_POS_X));
        		set_window_value(attack, window, AG_WINDOW_GRAB_POS_Y, get_window_value(attack, 13, AG_WINDOW_GRAB_POS_Y));
        		set_window_value(attack, window, AG_WINDOW_GRAB_ARC_Y, get_window_value(attack, 13, AG_WINDOW_GRAB_ARC_Y));
        	}
        	else {
        		reset_window_value(attack, window, AG_WINDOW_GOTO);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_POS_X);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_POS_Y);
        		reset_window_value(attack, window, AG_WINDOW_GRAB_ARC_Y);
        	}
        }
        break;
    
}

// Hunger gains
if (!hitpause && !smash_charging) {
	var whiff_lag_mult = (!has_hit && get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG)) ? 1.5 : 1;
	var raw_hgf = get_window_value(attack, window, AG_WINDOW_HUNGER_GAIN_FRAME);
	if (raw_hgf >= 0) var hunger_gain_frame = floor(raw_hgf*whiff_lag_mult) + 1;
	else var hunger_gain_frame = floor((get_window_value(attack, window, AG_WINDOW_LENGTH)+raw_hgf)*whiff_lag_mult);
	if (window_timer == hunger_gain_frame) {
		hunger_change = get_window_value(attack, window, AG_WINDOW_HUNGER_GAIN);
		user_event(0);
	}
}

// command grab code
if (instance_exists(grabbed_player_obj) && get_window_value(attack, window, AG_WINDOW_GRAB_OPPONENT)) {
	
	// first, drop the grabbed player if this is the last window of the attack, or if they somehow escaped hitstun.
	if (window >= get_attack_value(attack, AG_NUM_WINDOWS)) { grabbed_player_obj = noone; }
	else if (grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND) { grabbed_player_obj = noone; }
	
	else {
		var hitpause_pull = get_window_value(attack, window, AG_WINDOW_GRAB_HITPAUSE_PULL);
		
		// keep the grabbed player in hitstop until the grab is complete.
		grabbed_player_obj.hitstop = 2;
		grabbed_player_obj.hitpause = true;
		
		// if this is the first frame of a window, store the grabbed player's relative position.
		if (window_timer <= 1) {
			grabbed_player_relative_x = grabbed_player_obj.x - x;
			grabbed_player_relative_y = grabbed_player_obj.y - y;
		}
		
		// pull opponent to window's grab positions
		var arc_y = get_window_value(attack, window, AG_WINDOW_GRAB_ARC_Y);
		if (arc_y != 0) {
			var t = (hitpause_pull) ? (hitstop_full-hitstop) / hitstop : window_timer / window_length;
			var t2 = power(t, 2);
			arc_y *= 6.75 * ((t-2)*t2 + t);
			// https://www.desmos.com/calculator/gbp6wit76h
		}
		
		var pull_to_x = get_window_value(attack, window, AG_WINDOW_GRAB_POS_X) * spr_dir;
		var pull_to_y = get_window_value(attack, window, AG_WINDOW_GRAB_POS_Y) + round(arc_y);
		
		if (hitpause_pull) {
			if (hitpause) {
				var current = floor(hitstop_full - hitstop);
				var duration = floor(hitstop_full)
				grabbed_player_obj.x = x + ease_circOut( grabbed_player_relative_x, pull_to_x, current, duration);
				grabbed_player_obj.y = y + ease_circOut( grabbed_player_relative_y, pull_to_y, current, duration);
			}
			else { // upon leaving hitpause, just lock their position
				grabbed_player_obj.x = x + pull_to_x;
				grabbed_player_obj.y = y + pull_to_y;
			}
		}
		
		else { // using an easing function, smoothly pull the opponent into the grab over the duration of this window.
			grabbed_player_obj.x = x + ease_circOut( grabbed_player_relative_x, pull_to_x, window_timer, window_length);
			grabbed_player_obj.y = y + ease_circOut( grabbed_player_relative_y, pull_to_y, window_timer, window_length);
		}
		
	}
	
} else if (instance_exists(grabbed_player_obj)) { //if grabbed player exists but attack no longer grabs
	grabbed_player_obj = noone;
}

// walljump code
if (get_window_value(attack,window,AG_WINDOW_CAN_WALLJUMP)) {
	can_wall_jump = true;
}


// Runes
if (has_rune_sleeperchase) {
	if (has_hit && !sleeperchase_used && (special_pressed || is_special_pressed(DIR_ANY)) && move_cooldown[AT_NSPECIAL] <= 0) {
		
		var has_target = instance_exists(hit_player_obj)
		var launch_dir = spr_dir;
		if (has_target) launch_dir = (hit_player_obj.x < x) ? -1 : 1;
		
		var chaser = instance_create(x, y-30, "obj_article1");
		chaser.state = 14;
		chaser.targetted_player_id = has_target ? hit_player_obj : noone;
        chaser.move_speed = -15;
        chaser.move_angle = 270 + (60*launch_dir);
        chaser.hsp = lengthdir_x(chaser.move_speed, chaser.move_angle);
        chaser.vsp = lengthdir_y(chaser.move_speed, chaser.move_angle);
        chaser.block_hitbox_checks = true;
        chaser.hit_player_id = noone;
        chaser.venus_article_reflect = 1;
        chaser.petrified_hitbox.destroyed = true;
        //chaser.block_idle_state = true;
        
        sleeperchase_used = true;
        clear_button_buffer(PC_SPECIAL_PRESSED);
        hunger_change = -10;
        user_event(1);
        
        spawn_hit_fx(x, y-30, fx_kragg_small);
        sound_play(asset_get('sfx_kragg_rock_shatter'));
        
	}
}





// Defines


#define create_afterimage(in_lifetime, in_color)
var afterimage = {
    aftim_x : x,
    aftim_y : y,
    aftim_sprite_index : sprite_index,
    aftim_image_index : image_index,
    aftim_lifetime : in_lifetime,
    aftim_max_lifetime : in_lifetime,
    aftim_spr_dir : spr_dir,
    aftim_color : in_color,
};
ds_list_add(afterimage_list, afterimage);

#define line_meeting(x1, y1, x2, y2, obj)
return (noone != collision_line(x1, y1, x2, y2, obj, false, true));

// Plays a sound that will be cancelled given the following conditions:
//	- do_sfx_cancel is set to true.
//	- Putrolce is in a different attack or state.
// SFX instances created by this will be stored at attack_sfx_instance, so only one at a time is supported.
#define sound_play_cancellable 
/// sound_play_cancellable(_sound, _looping = false, _panning = noone, _volume = 1, _pitch = 1)
var _sound = argument[0];
var _looping = argument_count > 1 ? argument[1] : false;
var _panning = argument_count > 2 ? argument[2] : noone;
var _volume = argument_count > 3 ? argument[3] : 1;
var _pitch = argument_count > 4 ? argument[4] : 1;
sound_stop(attack_sfx_instance);
attack_sfx_instance = sound_play(_sound, _looping, _panning, _volume, _pitch);
sfx_attack = attack;

#define spawn_base_dust // written by supersonic
/// spawn_base_dust(x, y, name, dir = 0)
var dlen; //dust_length value
var dfx; //dust_fx value
var dfg; //fg_sprite value
var dfa = 0; //draw_angle value
var dust_color = 0;
var x = argument[0], y = argument[1], name = argument[2];
var dir = argument_count > 3 ? argument[3] : 0;

switch (name) {
	default: 
	case "dash_start":dlen = 21; dfx = 3; dfg = 2626; break;
	case "dash": dlen = 16; dfx = 4; dfg = 2656; break;
	case "jump": dlen = 12; dfx = 11; dfg = 2646; break;
	case "doublejump": 
	case "djump": dlen = 21; dfx = 2; dfg = 2624; break;
	case "walk": dlen = 12; dfx = 5; dfg = 2628; break;
	case "land": dlen = 24; dfx = 0; dfg = 2620; break;
	case "walljump": dlen = 24; dfx = 0; dfg = 2629; dfa = dir != 0 ? -90*dir : -90*spr_dir; break;
	case "n_wavedash": dlen = 24; dfx = 0; dfg = 2620; dust_color = 1; break;
	case "wavedash": dlen = 16; dfx = 4; dfg = 2656; dust_color = 1; break;
	
    //
    //bar-kun additions (note: idk how fg_sprite work)
    //
    case "dattack": dlen = 22; dfx = 12; dfg = 0; break;
    case "b_bounce_bg": dlen = 10; dfx = 7; dfg = 0; break;
	case "b_bounce_fg": dlen = 14; dfx = 8; dfg = 0; break;
    case "s_bounce_bg": dlen = 18; dfx = 7; dfg = 0; break;
    case "s_bounce_fg": dlen = 19; dfx = 8; dfg = 0; break;
    case "doublejump_small": 
    case "djump_small": dlen = 21; dfx = 16; dfg = 0; break;
}
var newdust = spawn_dust_fx(x,y,asset_get("empty_sprite"),dlen);
if newdust == noone return noone;
newdust.dust_fx = dfx; //set the fx id
if dfg != -1 newdust.fg_sprite = dfg; //set the foreground sprite
newdust.dust_color = dust_color; //set the dust color
if dir != 0 newdust.spr_dir = dir; //set the spr_dir
newdust.draw_angle = dfa;
return newdust;
