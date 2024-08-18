
// Move data update

if (get_attack_value(attack, AG_LAST_STANCE) != stance) {
    
    set_attack_value(attack, AG_LAST_STANCE, stance);
    
    // Sprite updates
    if (get_attack_value(attack, AG_HAS_STANCE_SPRITES)) {
    	var spr_arr = get_attack_value(attack, AG_STANCE_SPRITES);
    	set_attack_value(attack, AG_SPRITE, spr_arr[stance-1]);
    }
    if (get_attack_value(attack, AG_HAS_STANCE_HURT_SPRITES)) {
    	var spr_arr = get_attack_value(attack, AG_STANCE_HURT_SPRITES);
    	set_attack_value(attack, AG_HURTBOX_SPRITE, spr_arr[stance-1]);
    }
    
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

    // Woodcock data hook
    if (woodcock_active) with (woodcock_obj) {
        
        var st = other.stance-1;
        var attack_index = other.attack;
        var data_len = array_length(data);
        var di = noone;
        
        for (var i = 0; i < data_len; i++) {
            if (data[i].type == 2 && data[i].index == attack_index) {
                di = i;
                i = data_len;
            }
        }
        
        if ("name_orig" not in data[di]) data[di].name_orig = data[di].name;
        data[di].name = data[di].name_orig + " (" + other.stance_names[st] + ")";
        
    }

}