
// DEBUG
if (shield_pressed && taunt_pressed) {
	should_debug = !should_debug
	lightweight_debug = true;
	clear_button_buffer(PC_SHIELD_PRESSED);
}
else if (should_debug && state == PS_PARRY && state_timer = 0) lightweight_debug = !lightweight_debug;
if (up_down && taunt_pressed) {
	hunger_meter = clamp(hunger_meter+10, 0, 100);
	clear_button_buffer(PC_TAUNT_PRESSED);
	user_event(0);
}
if (down_down && taunt_pressed) {
	hunger_meter = clamp(hunger_meter-10, 0, 100);
	clear_button_buffer(PC_TAUNT_PRESSED);
	user_event(0);
}

// reset idle_air_looping if the character isn't in air idle anymore
if (!(state == PS_FIRST_JUMP || state == PS_IDLE_AIR)) {
	idle_air_looping = false;
	idle_air_platfalling = false;
}

// status management
var status_proc_list = [];
var break_sfx = sound_get("hero_quake_impact");

with oPlayer {
    if (pultroce_status_owner == other.player) {
    	state_timer = 0;
        if (!hitpause) pultroce_status_timer++;
        can_tech = false;
        can_bounce = false;
        
        if (activated_kill_effect) {
            pultroce_status_timer = 0;
            pultroce_status_owner = 0;
            spawn_hit_fx(x, floor(y+char_height/2), fx_kragg_big);
        	sound_play(break_sfx);
        }
        
        else {
        	if (hitpause && pultroce_status_timer > 10) pultroce_status_timer = 10;
        	
	        var hit_wall = false;
	        if (hsp == 0) hit_wall = (place_meeting(x+1, y, asset_get("par_block")) || place_meeting(x-1, y, asset_get("par_block")));
	        if (pultroce_status_timer >= 30 || !free || hit_wall || state_cat != SC_HITSTUN) array_push(status_proc_list, self);
        }
    }
}

for (var i = 0; i < array_length(status_proc_list); i++) {
    
    var target = status_proc_list[i];
    var _x = floor(target.x);
    var _y = floor(target.y - (target.char_height/2));
    
    var hbox = create_hitbox(AT_DSPECIAL, 4, _x, _y);
	
	with target sound_play(break_sfx); // ensures accurate panning
	
    target.pultroce_status_timer = 0;
    target.pultroce_status_owner = 0;
    
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
