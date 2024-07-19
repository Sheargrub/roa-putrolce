
// Sleepers: do not give invince on self-parry
if (enemy_hitboxID.orig_player == player && "sleeper_owner" in enemy_hitboxID) {
    invince_time = 0;
}