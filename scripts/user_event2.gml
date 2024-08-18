
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
        
        // Update name
        if ("name_orig" not in data[di]) data[di].name_orig = data[di].name;
        data[di].name = data[di].name_orig + " (" + other.stance_names[st] + ")";
        
        // Update duration info
        var win_len;
        var win_whiff;
        var win_totals = []; // used to avoid having to recalculate lengths for hitboxes
        var atk_whiff_len = 0;
        data[di].length = 0;
        for (var i = 0; i < num_windows; i++) {
            with other {
                win_len = get_window_value(attack_index, i+1, AG_WINDOW_LENGTH);
                win_whiff = get_window_value(attack_index, i+1, AG_WINDOW_HAS_WHIFFLAG);
            }
            data[di].length += win_len;
            array_push(win_totals, data[di].length);
            if (win_whiff) atk_whiff_len += floor(1.5*win_len);
            else atk_whiff_len += win_len;
        }
        if (data[di].length != atk_whiff_len) {
            data[di].length = string(data[di].length) + " (" + string(atk_whiff_len) + ")";
        }
        
        // Update hitboxes
        var new_index = 0;
        if ("hitboxes_orig" not in data[di]) data[di].hitboxes_orig = data[di].hitboxes;
        data[di].hitboxes = [];
        
        for (var i = 0; i < num_hitboxes; i++) {
            
            with other {
                var hbox_stance = get_hitbox_value(attack_index, i+1, HG_STANCE);
                var hbox_window = get_hitbox_value(attack_index, i+1, HG_WINDOW);
                var hbox_hunger = get_hitbox_value(attack_index, i+1, HG_HUNGER_GAIN);
            }
            
            if (hbox_stance == 0 || hbox_stance == other.stance) {
                array_push(data[di].hitboxes, data[di].hitboxes_orig[i]);
                
                // Active frame info
                if (0 < hbox_window && hbox_window < num_windows) {
                    with other {
                        var hbox_frame = get_hitbox_value(attack_index, i+1, HG_WINDOW_CREATION_FRAME);
                        var hbox_length = get_hitbox_value(attack_index, i+1, HG_LIFETIME);
                    }
                    var hbox_start = hbox_frame+1;
                    if (hbox_window > 1) hbox_start += win_totals[hbox_window-2];
                    var active_str = string(hbox_start)+"-"+string(hbox_start+hbox_length-1);
                    if (hbox_length == 1) active_str = string(hbox_start);
                    data[di].hitboxes[new_index].active = active_str;
                }
                
                // Hunger gain info
                if (hbox_hunger != 0 && "misc_updated" not in data[di].hitboxes_orig[i]) {
                    data[di].hitboxes_orig[i].misc_updated = true;
                    var misc_str = data[di].hitboxes_orig[i].misc;
                    if (misc_str == "-") misc_str = "";
                    else misc_str = misc_str + " | ";
                    if (hbox_hunger > 0) misc_str = misc_str + "+"; // negative sign is embedded in converted number
                    misc_str = misc_str + string(hbox_hunger/10) + " hunger pip";
                    if (abs(hbox_hunger) != 1) misc_str = misc_str + "s";
                    data[di].hitboxes[new_index].misc = misc_str;
                }
                new_index++;
            }
            
        }
        
        // Capture hunger changes
        var num_changes = 0;
        var hunger_values = [];
        
        for (var i = 1; i <= num_windows; i++) {
            with other var hunger_change = get_window_value(attack_index, i, AG_WINDOW_HUNGER_GAIN);
            if (hunger_change != 0) {
                array_push(hunger_values, hunger_change);
                num_changes++;
            }
        }
        
        var misc_str = "";
        for (var i = 0; i < num_changes; i++) {
            if (hunger_values[i] > 0) misc_str = misc_str + "+"; // negative sign is embedded in converted number
            misc_str = misc_str + string(hunger_values[i]/10) + " hunger pip";
            if (abs(hunger_values[i]) != 1) misc_str = misc_str + "s";
            
            if (i+1 != num_changes) misc_str = misc_str + " | "
        }
        
        // Add other info
        switch attack_index {
            case AT_DTILT:
                with other var hunger_change_frame = get_window_value(attack_index, 3, AG_WINDOW_HUNGER_GAIN_FRAME);
                var hunger_whiff_frame = floor(1.5*hunger_change_frame) + win_totals[1];
                hunger_change_frame += win_totals[1];
                misc_str = misc_str + " on frame " + string(hunger_change_frame) + " (" + string(hunger_whiff_frame) + ")";
                misc_str = misc_str + " | IASA cancellable on frame # (#)";
                break;
            case AT_FTILT:
                data[di].hitboxes[0].misc = "Hitbox conforms to ledges"
                break;
            case AT_USPECIAL:
                data[di].length = "Variable";
                misc_str = "-1 hunger pip upon using the command grab"
                with other var hbox_length = get_hitbox_value(AT_USPECIAL, 1, HG_LIFETIME)
                data[di].hitboxes[0].active = string(hbox_length) + "f";
                break;
            case AT_DSPECIAL:
                misc_str = misc_str + " | +1 hunger pip upon landing the command grab"
                break;
        }
        
        data[di].misc = misc_str;
        
    }

}