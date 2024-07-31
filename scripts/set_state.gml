
if (buffer_stance_update) {
	user_event(1);
	buffer_stance_update = false;
}

if (buffer_pratfall) {
    if (free && state != PS_WALL_JUMP) state = PS_PRATFALL;
    buffer_pratfall = false;
    can_attack = false;
}
