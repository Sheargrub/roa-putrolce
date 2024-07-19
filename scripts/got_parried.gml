
#macro SLP_DESPAWN_PETRIFIED 30
#macro SLP_DESPAWN_FADE 31


if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.orig_player == player && "sleeper_owner" in my_hitboxID) {
    if (hit_player != player) {
    	my_hitboxID.sleeper_owner.reflected_player_id = hit_player_obj;
    	my_hitboxID.sleeper_owner.was_parried = true;
    	my_hitboxID.sleeper_owner.block_idle_state = true;
    } else {
        my_hitboxID.sleeper_owner.state = (my_hitboxID.sleeper_owner.state <= 9) ? SLP_DESPAWN_PETRIFIED : SLP_DESPAWN_FADE;
    }
}