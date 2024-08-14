end_match(player)

// DEBUG: Lock hunger
if (taunt_pressed && shield_pressed) {
	clear_button_buffer(PC_SHIELD_PRESSED);
	hunger_locked = !hunger_locked;
}

// reset idle_air_looping if the character isn't in air idle anymore
if (!(state == PS_FIRST_JUMP || state == PS_IDLE_AIR)) {
	idle_air_looping = false;
	idle_air_platfalling = false;
}

// Idle flourish
if (state == PS_IDLE) {
	if (idle_flourish_timer > 0) {
		idle_flourish_timer--;
		if (idle_flourish_timer == 0) state_tiemr = 0; // anim reset
	}
	if (stance == ST_NORMAL && state_timer % 731 == 346) {
		var frames = sprite_get_number(sprite_get("idle_flourish"))
		var rate = idle_flourish_speed_stances[stance-1];
		idle_flourish_timer = floor(frames/rate);
		idle_flourish_timer_max = idle_flourish_timer;
	}
}
else idle_flourish_timer = 0;

// Meter bump anim timer management
var i;
for (i = 0; i <= 8; i++) {
	if (vis_meter_falls[i] > 0) vis_meter_falls[i]--;
	if (vis_meter_falls[i] == vis_meter_pass_time && i != 0) {
		vis_meter_falls[i-1] = vis_meter_bump_duration;
	}
}
for (i = 8; i >= 0; i--) {
	if (vis_meter_rises[i] > 0) vis_meter_rises[i]--;
	if (vis_meter_rises[i] == vis_meter_pass_time && i != 8) {
		vis_meter_rises[i+1] = vis_meter_bump_duration;
	}
}

// status management
var status_proc_list = [];
var break_sfx = sound_get("hero_quake_impact");

with oPlayer {
    if (putrolce_status_owner == other.player) {
    	state_timer = 0;
        if (!hitpause) putrolce_status_timer++;
        can_tech = false;
        can_bounce = false;
        
        if (activated_kill_effect) {
            putrolce_status_timer = 0;
            putrolce_status_owner = 0;
            spawn_hit_fx(x, floor(y+char_height/2), fx_kragg_big);
        	sound_play(break_sfx);
        }
        
        else {
        	if (hitpause && putrolce_status_timer > 10) putrolce_status_timer = 10;
        	
	        var hit_wall = false;
	        if (hsp == 0) hit_wall = (place_meeting(x+1, y, asset_get("par_block")) || place_meeting(x-1, y, asset_get("par_block")));
	        if (putrolce_status_timer >= 30 || !free || hit_wall || state_cat != SC_HITSTUN) array_push(status_proc_list, self);
        }
    }
}

for (var i = 0; i < array_length(status_proc_list); i++) {
    
    var target = status_proc_list[i];
    var _x = floor(target.x);
    var _y = floor(target.y - (target.char_height/2));
    
    var hbox = create_hitbox(AT_DSPECIAL, 4, _x, _y);
	
	with target sound_play(break_sfx); // ensures accurate panning
	
    target.putrolce_status_timer = 0;
    target.putrolce_status_owner = 0;
    
}

// Every 3 seconds, poll for discrepancies in the sleeper count.
// (This shouldn't really come up, hence the infrequency of the check.)
// (If opponents are improperly destroying articles, though, this will trigger.)
if (get_gameplay_time() % 177 == 174) {
	var detected_sleepers = 0;
	with (obj_article1) if (player_id == other) detected_sleepers++;
	if (detected_sleepers != nspec_sleepers_active) {
		nspec_sleepers_active = detected_sleepers;
		print_debug("Discrepancy corrected in sleeper count. Opponent may be improperly destroying articles.");
	}
}
// NSpec cooldown management
if (nspec_sleepers_active >= 2 && move_cooldown[AT_NSPECIAL] < 2) move_cooldown[AT_NSPECIAL] = 2;

// SFX management
if (do_sfx_cancel && (attack != sfx_attack || (state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND))) {
	sound_stop(attack_sfx_instance);
	attack_sfx_instance = noone;
	sfx_attack = 0;
}
do_sfx_cancel = false;

// ASHe alt vfx
if (get_player_color(player) == 20 && get_gameplay_time() % 7 == 0 && point_distance(0, 0, hsp, vsp) > 2.5 && visible)
{
    var fx = spawn_hit_fx(
        x + draw_x + (random_func(0, 8, false) - 4)*8,
        y + draw_y - random_func(1, 8, false)*8,
        fx_ashe_trail
    );
    fx.hsp = (random_func(2, 8, false) - 4)/4;
    fx.vsp = (random_func(3, 8, false) - 4)/2 - 1;
}

// Afterimage management (drawn in pre_draw.gml, added by attack_update.gml)
for (var i = 0; i < ds_list_size(afterimage_list); i++) {
    var aftim_current = ds_list_find_value(afterimage_list, i);
    aftim_current.aftim_lifetime = aftim_current.aftim_lifetime-1;
    if (aftim_current.aftim_lifetime <= 0) {
        ds_list_remove(afterimage_list, aftim_current);
        i--;
    }
}

// Cooldown eeset
if (!free || state == PS_HITSTUN || state == PS_WALL_JUMP) move_cooldown[AT_FSPECIAL] = 0;


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
