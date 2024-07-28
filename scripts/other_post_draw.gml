
if ("putrolce_status_owner" not in self || !instance_exists(other_player_id) || "is_putrolce" not in other_player_id) exit;

// Petrified visual
if ((other_player_id.attack == AT_DSPECIAL && other_player_id.grabbed_player_obj == self) || putrolce_status_owner = other_player_id.player) {
    
    // Default behavior
    if ("putrolce_petrify_spr" not in self) {
        
        // Draw texture
        maskHeader();
        draw_sprite_ext(sprite_index, image_index, x+draw_x, y+draw_y, spr_dir*(small_sprites+1), (small_sprites+1), spr_angle, c_white, 1);
        maskMidder();
        with (other_player_id) {
            var texture_spr = sprite_get("petrify_texture");
            shader_start();
        }
        draw_sprite_tiled_ext(texture_spr, 0, x+draw_x, y+draw_y, 2, 2, c_white, 1)
        shader_end();
        maskFooter();
        
        // Draw outline (thanks to Supersonic for finding these arrays-)
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
        
        // Draw rocks
        with (other_player_id) {
            var rock_spr = sprite_get("petrify_rocks");
            shader_start();
        }
        var _x = x+draw_x;
        var _y = y+draw_y-(floor(char_height/4)*2);
        for (var i = 0; i < 5; i++) {
            draw_sprite_ext(rock_spr, putrolce_rocks_type[i], _x+(putrolce_rocks_x[i]*spr_dir), _y+putrolce_rocks_y[i], 2*spr_dir, 2, putrolce_rocks_rot[i], c_white, 1);
        }
        shader_end();
        
    }
    
    // Compat behavior
    else {
        with (other_player_id) shader_start();
        draw_sprite_ext(putrolce_petrify_spr, 0, x, y, spr_dir*2, 2, 0, c_white, 1); // compat sprite should be small-sprited
        shader_end();
    }
    
}



// Mask code by Supersonic

//================================================================================
#define maskHeader
// Mask renderer utility: disables Normal draw.
// Draw shapes or sprites to be used as the stencil(s) by maskMidder.
//================================================================================
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false,false,false,true);
    draw_set_alpha(0);
    draw_rectangle_color(0,0, room_width, room_height, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
}
//================================================================================
#define maskMidder
// Reenables draw but only within the region drawn between maskHeader and maskMidder.
// Lasts until maskFooter is called.
//================================================================================
{
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true,true,true,true);
    gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
}
//================================================================================
#define maskFooter
// Restores normal drawing parameters
//================================================================================
{
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
}