//a

//reset number of windows in case of a grab
reset_attack_value(attack, AG_NUM_WINDOWS);

// reset grab variables on new attack
// if your grab uses different attack indexes, you may want to add additional
// checks to prevent accidental grab releases
grabbed_player_obj = noone; 
grabbed_player_relative_x = 0;
grabbed_player_relative_y = 0;

// Mirror set_state checks
if (buffer_stance_update) {
	user_event(1);
	buffer_stance_update = false;
}

if (buffer_pratfall && !buffer_pratfall_paused) {
    buffer_pratfall = false;
    can_attack = false;
    if (free) set_state(PS_PRATFALL);
}
buffer_pratfall_paused = false;

// If the attack is going through, call a move data update
if (state != PS_PRATFALL && move_cooldown[attack] <= 0) user_event(2);