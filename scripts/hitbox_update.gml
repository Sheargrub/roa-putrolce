switch (attack){
    case AT_TAUNT:
        if (!free) {
            hsp = 0;
            image_index = 0
            player_id.skull_idle_timer--
        }
        
        if player_id.skull_idle_timer == 29 {
            sound_play(asset_get("sfx_land_med"), 0, noone, 1, 1)
        }
        else if player_id.skull_idle_timer <= 0 {
            destroyed = true;
            player_id.skull_idle_timer = 30;
        }
        
        if destroyed == true {
            sound_play(asset_get("sfx_kragg_spike"), 0, noone, 1, 1)
        }
        
    break;
}
