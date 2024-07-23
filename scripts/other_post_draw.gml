
if ("other_player_id" not in self || !instance_exists(other_player_id) || "is_putrolce" not in other_player_id) exit;

// Petrified visual (temp)
if ((other_player_id.attack == AT_DSPECIAL && other_player_id.grabbed_player_obj == self) || pultroce_status_owner = other_player_id.player) {
    
    // Draw pattern (currently using a temp flat color)
    with other_player_id {
        var player_color = get_player_color(player);
        var temp_petrified_color = make_color_rgb(get_color_profile_slot_r(player_color, 4), get_color_profile_slot_g(player_color, 4), get_color_profile_slot_b(player_color, 4));
    }
    
    gpu_set_fog(true, temp_petrified_color, 0, 99);
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir*(small_sprites+1), (small_sprites+1), 0, c_white, 1);
    gpu_set_fog(false, c_white, 0, 0);
    
    // Draw outline (thanks to Supersonic for this approach!)
    // Store the old arrays
    var tmp_colorO = static_colorO
    var tmp_colorI = static_colorI
    var tmp_colorT = static_colorT
    var tmp_colorB = static_colorB
    // Swap em.
    static_colorO = other_player_id.outline_catch_colorO
    static_colorI = other_player_id.outline_catch_colorI
    static_colorT = other_player_id.outline_catch_colorT
    static_colorB = other_player_id.outline_catch_colorB
    // Draw the sprite. This will only display the outlines, assuming the arrays in init are set up correctly.
    shader_start()
    draw_sprite_ext(sprite_index, image_index, x+draw_x, y+draw_y, (1+small_sprites)*spr_dir, 1+small_sprites, spr_angle, -1, 1);
    shader_end()
    // Swap em back so we don't mess up the opponent's article colors lol
    static_colorO = tmp_colorO
    static_colorI = tmp_colorI
    static_colorT = tmp_colorT
    static_colorB = tmp_colorB
    
}
