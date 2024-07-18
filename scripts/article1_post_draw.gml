

if (get_match_setting(SET_HITBOX_VIS)) {
    
    if (attempting_homing) {
        draw_set_alpha(0.2);
        draw_sprite(sprite_get("obj_sleeper_tracker_mask_"+string(spr_dir)), 0, x, y);
        draw_set_alpha(1);
    }
    
}