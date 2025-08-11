
if (fspec_armor_hits > 0) fspec_armor_hits--;

buffer_pratfall = false;
buffer_pratfall_paused = false;

grabbed_player_id = noone;

if (is_voiced && random_func(14, 1, false) < 0.4) {
    if (stance == ST_VORACIOUS) {
    	var voiceline = sound_get("voice_vhurt"+string(1+random_func(15, 5, true)));
    	sound_play(voiceline);
    } else {
        var voiceline = sound_get("voice_hurt"+string(1+random_func(15, 4, true)));
    	sound_play(voiceline);
    }
}