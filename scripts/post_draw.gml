// use this to draw stuff

if (stance != ST_NORMAL) {
    var arr = stance_outlines[stance-1];
    var col = make_color_rgb(arr[0], arr[1], arr[2]);
    gpu_set_fog(true, col, depth, depth);
    draw_sprite_ext(sprite_index, image_index, x, y, 2*spr_dir, 2, 0, c_white, 0.15);
    gpu_set_fog(false, c_white, 1, 1);
}

if (attack == AT_FSPECIAL && (window == 2 || window == 3) && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)) {
    draw_sprite_ext(sprite_get("fspecial_fx"+stance_suffixes[stance-1]), window-2, x, y, 2*spr_dir, 2, 0, c_white, 1);
}