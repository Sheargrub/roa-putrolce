var hbox_atk = my_hitboxID.attack;
var hbox_num = my_hitboxID.hbox_num;

//                           --hit stuff--                                    //




// Apply hunger gains as appropriate
// TODO: Kragg-proof once NSpecial is in
if (my_hitboxID.orig_player == player) {
	hunger_meter += get_hitbox_value(hbox_atk, hbox_num, HG_HUNGER_GAIN);
	hunger_meter = clamp(hunger_meter, 0, 100);
}


switch(attack) {

    case AT_FAIR:
    if (my_hitboxID.hbox_num == 1){
    		sound_play(asset_get("sfx_kragg_rock_pull"), 0, noone, 0.3, 1)
    }
    if (my_hitboxID.hbox_num == 2){
    		sound_play(sound_get("sharp"), 0, noone, 0.3, 1)
	}
	break;
	
}



// hitbox lerp code
if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HAS_LERP) == true) {
	if (my_hitboxID.type == 1) { //if physical, pull relative to player
		hit_player_obj.x = lerp(hit_player_obj.x, x + get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_POS_X)*spr_dir, get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_PERCENT));
		hit_player_obj.y = lerp(hit_player_obj.y, y + get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_POS_Y), get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_PERCENT));
	} else if (my_hitboxID.type == 2) { // otherwise pull relative to hitbox
		hit_player_obj.x = lerp(hit_player_obj.x, my_hitboxID.x + get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_POS_X)*spr_dir, get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_PERCENT));
		hit_player_obj.y = lerp(hit_player_obj.y, my_hitboxID.y + get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_POS_Y), get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_LERP_PERCENT));
	}
}

// command grab code
if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HAS_GRAB) == true) {
	
	//Before grabbing the opponent, first make sure that:
	//-The player is in an attack animation
	//-The opponent is in hitstun
	//-The player did not get parried, and
	//-The opponent is not a Forsburn clone.

	if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)
	  && (hit_player_obj.state == PS_HITSTUN || hit_player_obj.state == PS_HITSTUN_LAND)
    	  && was_parried == false
	  && hit_player_obj.clone == false) {
		
		//transition to the 'throw' part of the attack.
		if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_GRAB_WINDOW_GOTO) != -1) {
			destroy_hitboxes();
			attack_end();
			window = get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_GRAB_WINDOW_GOTO);
			window_timer = 0;
			old_hsp = get_window_value(my_hitboxID.attack, window, AG_WINDOW_HSPEED);
			old_vsp = get_window_value(my_hitboxID.attack, window, AG_WINDOW_VSPEED);
			
			if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_GRAB_WINDOWS_NUM) != -1) {
				set_attack_value(attack,AG_NUM_WINDOWS,get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_GRAB_WINDOWS_NUM));
			}
		}
		
		//if this attack hasn't grabbed a player yet, grab the player we just hit.
		if (!instance_exists(grabbed_player_obj)) { grabbed_player_obj = hit_player_obj; }
		
		//if this attack has already grabbed a different opponent, prioritize grabbing the closest opponent.
		else {
			var old_grab_distance = point_distance(x, y, grabbed_player_obj.x, grabbed_player_obj.y);
			var new_grab_distance = point_distance(x, y,     hit_player_obj.x,     hit_player_obj.y);
			if (new_grab_distance < old_grab_distance) { grabbed_player_obj = hit_player_obj; }
			// setting it in case of an attack that continues the current window
			grabbed_player_relative_x = grabbed_player_obj.x - x;
			grabbed_player_relative_y = grabbed_player_obj.y - y;
		}
	}
}

// break grab
if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_BREAKS_GRAB) == true && instance_exists(grabbed_player_obj)) {
	grabbed_player_obj = noone;
}

// multihit projectile code
if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_PROJECTILE_MULTIHIT) == true) {
	if (!my_hitboxID.proj_hitpause) {
		my_hitboxID.proj_old_hsp = my_hitboxID.hsp;
		my_hitboxID.proj_old_vsp = my_hitboxID.vsp;
		my_hitboxID.proj_old_img_spd = my_hitboxID.img_spd;
		my_hitboxID.proj_hitpause = true;
	}
	my_hitboxID.proj_hitstop = my_hitboxID.hitpause;
	my_hitboxID.hitbox_hit_player_count[hit_player_obj.player] += 1;
	my_hitboxID.hitbox_hit_player_timers[hit_player_obj.player] = 0;
}


//                          --hit gamefeel--                                  //

// this used to have vfx but it was a mess and I solved some of the initial
// problems on pohaku

// I'll redo it later with the improvements n new vfx
switch(my_hitboxID.attack) {
    case AT_JAB:
        //a
        break;
    case AT_FTILT:
        //a
        break;
    case AT_DTILT:
        //a
        break;
    case AT_UTILT:
        //a
        break;
    case AT_DATTACK:
        //a
        break;
        
    case AT_NAIR:
        //a
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
        //a
        break;
        
    case AT_FSTRONG:
    	//a
    	break;
    case AT_USTRONG:
    	//a
    	break;
    case AT_DSTRONG:
    	//a
    	break;
    
    
    case AT_NSPECIAL:
        //a
        break;
    case AT_FSPECIAL:
        //a
        break;
    case AT_DSPECIAL:
        //a
        break;
    case AT_USPECIAL:
        //a
        break;
    

}
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
}
var newdust = spawn_dust_fx(x,y,asset_get("empty_sprite"),dlen);
if newdust == noone return noone;
newdust.dust_fx = dfx; //set the fx id
if dfg != -1 newdust.fg_sprite = dfg; //set the foreground sprite
newdust.dust_color = dust_color; //set the dust color
if dir != 0 newdust.spr_dir = dir; //set the spr_dir
newdust.draw_angle = dfa;
return newdust;
