

// NSpec pity projectile
if (attack == AT_NSPECIAL && hbox_num == 4) {
    
    if (!free) destroyed = true;
    if (destroyed == true) sound_play(asset_get("sfx_kragg_spike"), 0, noone, 1, 1);
        
}


// Taunt skull
else if (attack == AT_TAUNT) {
    
    if (!free) {
        hsp = 0;
        image_index = 0
        idle_timer++;
    }
    
    if (idle_timer == 1) sound_play(asset_get("sfx_land_med"), 0, noone, 1, 1);
    else if (idle_timer >= 30) destroyed = true;
    
    if (destroyed == true) sound_play(asset_get("sfx_kragg_spike"), 0, noone, 1, 1);
        
}
