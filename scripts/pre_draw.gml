
// Afterimages
var fog_last_col = noone;
for (var i = 0; i < ds_list_size(afterimage_list); i++) {
    var afterimage = ds_list_find_value(afterimage_list, i);
    var aftim_alpha = afterimage.aftim_lifetime / afterimage.aftim_max_lifetime;
    var aftim_color = afterimage.aftim_color;
    if (fog_last_col != aftim_color) {
        gpu_set_fog(1, aftim_color, 0, 99);
        fog_last_col = aftim_color;
    }
    draw_sprite_ext(afterimage.aftim_sprite_index, afterimage.aftim_image_index, afterimage.aftim_x, afterimage.aftim_y, 2*afterimage.aftim_spr_dir, 2, 0, c_white, aftim_alpha );
}
gpu_set_fog(0, c_white, 0, 1);