
#macro SLP_ACTIVE_RUSH 13
#macro SLP_ACTIVE_HOMING 14


if (state == SLP_ACTIVE_RUSH || state == SLP_ACTIVE_HOMING) {
    draw_sprite_ext(sprite_get("slp_homing_temp"), 0, x, y, 1, spr_dir, move_angle, c_white, 1);
}

if (get_match_setting(SET_HITBOX_VIS)) {
    
    if (attempting_tracking) {
        draw_set_alpha(0.2);
        draw_sprite(sprite_get("slp_tracker_mask_"+string(spr_dir)), 0, x, y);
        draw_set_alpha(1);
    }
    
}