//a

//reset number of windows in case of a grab
reset_attack_value(attack,AG_NUM_WINDOWS);

// reset grab variables on new attack
// if your grab uses different attack indexes, you may want to add additional
// checks to prevent accidental grab releases
grabbed_player_obj = noone; 
grabbed_player_relative_x = 0;
grabbed_player_relative_y = 0;


// Apply hunger cost
if (move_cooldown[attack] <= 0) {
    hunger_meter -= get_attack_value(attack, AG_HUNGER_COST);
	hunger_meter = clamp(hunger_meter, 0, 100);
	user_event(0);
}

// If stance is mismatched...
if (get_attack_value(attack, AG_LAST_STANCE) != stance) {
    
    set_attack_value(attack, AG_LAST_STANCE, stance);
    
    // Frame data updates
    var num_windows = get_attack_value(attack, AG_NUM_WINDOWS); // TODO: should this be changed to a dedicated index?
    for (var i = 1; i <= num_windows; i++) {
        if (get_window_value(attack, i, AG_WINDOW_HAS_STANCE_LENGTHS)) {
            var stance_lengths = get_window_value(attack, i, AG_WINDOW_STANCE_LENGTHS);
            set_window_value(attack, i, AG_WINDOW_LENGTH, stance_lengths[stance-1]);
            var sfx_frames = get_window_value(attack, i, AG_WINDOW_STANCE_SFX_FRAMES);
            if (sfx_frames != 0) set_window_value(attack, i, AG_WINDOW_SFX_FRAME, sfx_frames[stance-1]);
        }
    }
    
    // Hitbox data updates
    var num_hitboxes = get_num_hitboxes(attack);
    for (var i = 1; i <= num_hitboxes; i++) {
        var hbox_num = get_hitbox_value(attack, i, HG_STANCE)
        if (hbox_num != 0) {
            if (hbox_num != stance) {
                set_hitbox_value(attack, i, HG_WINDOW, 999);
            }
            else reset_hitbox_value(attack, i, HG_WINDOW)
        }
    }
    
    if (should_debug) print_debug("Attack data updated! (" + string(get_gameplay_time()) + ")");

}