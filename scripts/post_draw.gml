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

if (attack == AT_FTILT && (image_index > 0) && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)) {
    draw_sprite_ext(sprite_get("ftilt_rock"), image_index-1, x+ftilt_x_draw_offset, y, 2*spr_dir, 2, 0, c_white, 1);
}

// Abyss
if (has_rune_uspecaimable && attack == AT_USPECIAL && window == 2 && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)) {
    var draw_angle = uspec_rune_angle-90
    var draw_radians = draw_angle*(pi/360);
    var r = sin(draw_radians)
    var x_offset = 54*(r*cos(draw_radians));
    var y_offset = -54*(r*r); // technically r*sin(draw_radians) - this is a polar-to-cartesian conversion
    shader_start();
    draw_sprite_ext(sprite_get("uspecial"), 4+clamp((state_timer-1)/5, 0, 2), x+x_offset, y+y_offset, 2*spr_dir, 2, draw_angle, c_white, 1);
    shader_end();
}

// Overhead HUD
if (get_local_setting(SET_HUD_SIZE) == 0 && get_local_setting(SET_HUD_NAMES) == 0) exit;

var st = stance-1;
var pips = ceil(hunger_meter/10);
var offset_height = char_height+hud_offset+32;
if (pips > 0 && st == 0) st++;

draw_sprite_ext(sprite_get("hud_mini"), st, x-24, y-offset_height, 2, 2, 0, c_white, 1);
if (pips == 0) {
    if (st != 0) draw_rectangle_color(x-20, y-offset_height+2, x+17, y-offset_height+5, c_black, c_black, c_black, c_black, false);
}
else {
    draw_sprite_ext(sprite_get("hud_mini_cover"), st, x-20+(4*pips), y-offset_height+2, 2, 2, 0, c_white, 1);
    if (pips < 9) draw_rectangle_color(x-18+(4*pips), y-offset_height+2, x+17, y-offset_height+5, c_black, c_black, c_black, c_black, false);
}