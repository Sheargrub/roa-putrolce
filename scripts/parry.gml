
// Sleepers: do not give invince on self-parry
if (enemy_hitboxID.orig_player == player && "sleeper_owner" in enemy_hitboxID) {
    invince_time = 0;
}

if (is_voiced) {
	var voiceline = sound_get("voice_parry"+string(1+random_func(15, 4, true)));
	sound_play(voiceline);
}