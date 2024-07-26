// Stance updates
// Should be called whenever hunger_meter is altered.

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
	
	
	leave_ground_max = leave_ground_max_stances[i];
	max_jump_hsp = max_jump_hsp_stances[i];
	air_max_speed = air_max_speed_stances[i];
	
	max_fall = max_fall_stances[i];
	fast_fall = fast_fall_stances[i];
	
	if (should_debug) print_debug("Stats refreshed! (" + string(get_gameplay_time()) + ")");
	
	init_shader();
	
}
