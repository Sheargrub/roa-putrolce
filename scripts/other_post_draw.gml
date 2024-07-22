
if ("other_player_id" not in self || !instance_exists(other_player_id)) exit;

// Petrified visual (temp)
if (pultroce_status_owner = other_player_id.player) {
    with other_player_id {
        var player_color = get_player_color(player);
        var temp_petrified_color = make_color_rgb(get_color_profile_slot_r(player_color, 4), get_color_profile_slot_g(player_color, 4), get_color_profile_slot_b(player_color, 4));
    }
    
    gpu_set_fog(true, temp_petrified_color, 0, 99);
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir*(small_sprites+1), (small_sprites+1), 0, c_white, 1);
    gpu_set_fog(false, c_white, 0, 0);
    
    /*
    with other_player_id {
        forcing_transparency = true;
        init_shader();
        shader_start();
        
        draw_sprite_ext(other.sprite_index, other.image_index, other.x, other.y, other.spr_dir*(other.small_sprites+1), (other.small_sprites+1), 0, c_white, 1);
        
        shader_end();
        forcing_transparency = false;
        init_shader();
    }
    */
    
}
