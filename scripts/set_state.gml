
if (buffer_stance_update) {
	user_event(1);
	buffer_stance_update = false;
}

if (buffer_pratfall && !buffer_pratfall_paused) {
    buffer_pratfall = false;
    can_attack = false;
    if (free) set_state(PS_PRATFALL);
}
buffer_pratfall_paused = false;