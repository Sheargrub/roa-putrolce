
#macro SLP_ACTIVE_RUSH 13
#macro SLP_ACTIVE_HOMING 14
#macro SLP_INACTIVE_DEFAULT 20

if (state == SLP_ACTIVE_RUSH || state == SLP_ACTIVE_HOMING) {
    draw_sprite_ext(rot_sprite_index, rot_image_index, x, y, 1, spr_dir, rot_sprite_angle, c_white, 1);
}

if (state == SLP_INACTIVE_DEFAULT && inactive_flash_alpha > 0) {
    shader_end();
    gpu_set_fog(true, c_white, depth, depth);
    draw_sprite_ext(sprite_index, image_index, x, y, 1, spr_dir, 0, c_white, inactive_flash_alpha);
    gpu_set_fog(false, c_white, 0, 0);
}

if (get_match_setting(SET_HITBOX_VIS)) {
    
    draw_set_alpha(0.5);
    draw_sprite(mask_index, 0, x, y);
    draw_set_alpha(1);
    
    if (attempting_tracking) {
        draw_set_alpha(0.2);
        draw_sprite(sprite_get("slp_tracker_mask_"+string(spr_dir)), 0, x, y);
        draw_set_alpha(1);
    }
    
}