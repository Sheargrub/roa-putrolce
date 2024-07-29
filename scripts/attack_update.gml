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
        //a
        break;
    case AT_DTILT:
    	if (window == 3) {
    		var whiff_lag_mult = (has_hit ? 1 : 1.5)
    		if (window_timer == 1) sound_play_cancellable(get_window_value(attack, window, AG_WINDOW_SFX));
        	if (window_timer >= 10*whiff_lag_mult) iasa_script();
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
        //a
        break;
    case AT_UAIR:
        break;
    
    case AT_NSPECIAL:
    	move_cooldown[AT_NSPECIAL] = 20;
        if (window == 2 && window_timer == 1) {
        	instance_create(x+(30*spr_dir), y-30, "obj_article1");
        }
        break;
    case AT_FSPECIAL:
        //a
        break;
    case AT_DSPECIAL:
    	if (window == 1) {
    		dspec_sleeper_id = noone;
    		dspec_sfx_instance = noone;
    		dspec_rethrow = false;
    	}
    	else if (4 <= window && window <= 6) {
    		can_move = false;
    		if (window == 4 && window_timer == window_length) {
    			sound_play_cancellable(get_window_value(attack, window, AG_WINDOW_SFX));
    		}
    		if (window < 6 && (special_pressed || is_special_pressed(DIR_ANY)) && instance_exists(dspec_sleeper_id)) {
    			dspec_rethrow = true;
    		}
	        if (dspec_rethrow) {
	        	attack_end();
    			set_attack(AT_DSPECIAL_2);
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
    	if (window == 2 && window_timer == 1 && instance_exists(dspec_sleeper_id)) {
        	dspec_sleeper_id.state = 1; // petrified, no lifetime checks
        	dspec_sleeper_id.reflected_player_id = (player == dspec_sleeper_id.player) ? noone : self;
        	dspec_sleeper_id.refresh_hitboxes = true;
        	dspec_sleeper_id.dspec_skewered = false;
        	dspec_sleeper_id.block_idle_state = false;
			dspec_sleeper_id.block_active_state = false;
        	dspec_sleeper_id.venus_article_reflect = 1;
            dspec_sleeper_id.hit_player_id = noone;
        	dspec_sleeper_id.hsp = 7*spr_dir;
        	dspec_sleeper_id.vsp = -5;
        	dspec_sleeper_id.spr_dir = spr_dir;
        	
        	grabbed_player_obj = noone;
        	
        	spawn_hit_fx(dspec_sleeper_id.x + 12*spr_dir, dspec_sleeper_id.y, fx_kragg_small);
        }
        break;
    case AT_USPECIAL:
    	print_debug("> " + string(window));
    
        if (window == 1 || window >= 7) can_move = false;
        if (window < 5 || window == 9) can_wall_jump = true;
        
        if ((window == 3 || window == 4) && (special_pressed || is_special_pressed(DIR_ANY))) {
        	window = 7;
        	window_timer = 0;
        	set_attack_value(attack, AG_NUM_WINDOWS, 9);
        	hsp = 0;
        	vsp = 0;
        }
        
        if (window == 5 && window_timer == 1 && !has_hit_player) {
        	shake_camera(3,6);	
        }
        
        if (window == 11 && window_timer == 1) {
        	if (stance == ST_FAMISHED) set_window_value(attack, window, AG_WINDOW_GOTO, window+2);
        	else reset_window_value(attack, window, AG_WINDOW_GOTO);
        	num_loops = 0;
        }
        
        if (window == 12 && window_timer == 1) {
        	print_debug(num_loops)
        	num_loops++;
        	if (num_loops+1 >= stance) reset_window_value(attack, window, AG_WINDOW_GOTO);
        	else set_window_value(attack, window, AG_WINDOW_GOTO, window);
        }
        
        break;
    
}

// Hunger gains
var hunger_gain = get_window_value(attack, window, AG_WINDOW_HUNGER_GAIN);
var whiff_lag_mult = (!has_hit && get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG)) ? 1.5 : 1;
if (!hitpause && hunger_gain != 0 && window_timer-1 == floor(get_window_value(attack, window, AG_WINDOW_HUNGER_GAIN_FRAME)*whiff_lag_mult)) {
	hunger_meter += hunger_gain;
	hunger_meter = clamp(hunger_meter, 0, 100);
	was_meter_increased = (hunger_gain > 0);
	user_event(0);
}

// command grab code
if (instance_exists(grabbed_player_obj) && get_window_value(attack, window, AG_WINDOW_GRAB_OPPONENT)) {
	
	// first, drop the grabbed player if this is the last window of the attack, or if they somehow escaped hitstun.
	if (window >= get_attack_value(attack, AG_NUM_WINDOWS)) { grabbed_player_obj = noone; }
	else if (grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND) { grabbed_player_obj = noone; }
	
	else {
		// keep the grabbed player in hitstop until the grab is complete.
		grabbed_player_obj.hitstop = 2;
		grabbed_player_obj.hitpause = true;
		
		// if this is the first frame of a window, store the grabbed player's relative position.
		if (window_timer <= 1) {
			grabbed_player_relative_x = grabbed_player_obj.x - x;
			grabbed_player_relative_y = grabbed_player_obj.y - y;
		}
		
		// pull opponent to window's grab positions
		var pull_to_x = get_window_value(attack, window, AG_WINDOW_GRAB_POS_X) * spr_dir;
		var pull_to_y = get_window_value(attack, window, AG_WINDOW_GRAB_POS_Y);
		
		if (get_window_value(attack, window, AG_WINDOW_GRAB_HITPAUSE_PULL)) {
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


// Defines

// Plays a sound that will be cancelled given the following conditions:
//	- do_sfx_cancel is set to true.
//	- Putrolce is in a different attack or state.
// SFX instances created by this will be stored at attack_sfx_instance, so only one at a time is supported.
#define sound_play_cancellable 
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
