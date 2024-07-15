
// DEBUG
if (should_debug && state == PS_PARRY && state_timer = 0) lightweight_debug = !lightweight_debug;

// Stance updates
var update_stance = false;
switch stance {
	case 1: // Famished
		if (hunger_meter > 10) update_stance = true;
		break;
	case 2: // Voracious
		if (hunger_meter <= 10 || hunger_meter > 30) update_stance = true;
		break;
	case 3: // Normal
		if (hunger_meter <= 30 || hunger_meter > 80) update_stance = true;
		break;
	case 4: // Overstuffed
		if (hunger_meter <= 80) update_stance = true;
		break;
}

if (update_stance) {
	if (hunger_meter <= 10) stance = 1;
	else if (hunger_meter <= 30) stance = 2;
	else if (hunger_meter <= 80) stance = 3;
	else stance = 4;
	
	var i = stance-1;
	walk_speed = walk_speed_stances[i];
	initial_dash_speed = initial_dash_speed_stances[i];
	dash_speed = dash_speed_stances[i];
}

// reset idle_air_looping if the character isn't in air idle anymore
if (!(state == PS_FIRST_JUMP || state == PS_IDLE_AIR)) {
	idle_air_looping = false;
	idle_air_platfalling = false;
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
