
#macro SLP_ACTIVE_RUSH 13
#macro SLP_ACTIVE_HOMING 14
#macro SLP_INACTIVE_DEFAULT 20

if (state == SLP_ACTIVE_RUSH || state == SLP_ACTIVE_HOMING) {
    draw_sprite_ext(rot_sprite_index, rot_image_index, x, y, 1, spr_dir, rot_sprite_angle, c_white, 1);
}

if (state == SLP_INACTIVE_DEFAULT && inactive_flash_alpha > 0) {
    shader_end();
    gpu_set_fog(true, c_white, depth, depth);
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, 0, c_white, inactive_flash_alpha);
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

// Off-screen handling
var drawing_offscreen = true;
var h_offscreen = (x > view_get_xview()+view_get_wview()) - (x < view_get_xview()); // -1 left, 1 right
var v_offscreen = (y > view_get_yview()+view_get_hview()) - (y < view_get_yview()); // -1 up, 1 down
// temp_index, from top-left, clockwise: 1 3 5 7

if (h_offscreen != 0 && v_offscreen != 0) { // corners
    var temp_x = view_get_xview() + (h_offscreen == -1 ? 34 : view_get_wview()-34);
    var temp_y = view_get_yview() + (v_offscreen == -1 ? 34 : view_get_hview()-34);
    var temp_index = (v_offscreen == -1 ? 2 : 6) - (h_offscreen * v_offscreen);
}
else if (h_offscreen != 0) { // sides
    var temp_x = view_get_xview() + (h_offscreen == -1 ? 34 : view_get_wview()-34);
    var temp_y = y;
    var temp_index = (h_offscreen == -1 ? 0 : 4);
}
else if (v_offscreen != 0) { // top/bottom
    var temp_x = x;
    var temp_y = view_get_yview() + (v_offscreen == -1 ? 34 : view_get_hview()-34);
    var temp_index = (v_offscreen == -1 ? 2 : 6);
}
else drawing_offscreen = false;

if (drawing_offscreen) {
    draw_sprite_ext(asset_get("offscreen_bg_spr"), temp_index, temp_x, temp_y, 1, 1, 0, get_player_hud_color(player), 1);
    draw_sprite(sprite_get("hud_sleeper"), 0, temp_x-16, temp_y-18);
}