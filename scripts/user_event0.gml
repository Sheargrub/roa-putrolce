// Stance update checks
// Should be called whenever hunger_meter is altered.

if (hunger_locked || hunger_change == 0) exit;

hunger_meter += hunger_change;
hunger_meter = clamp(hunger_meter, 0, 100);

if (hunger_change > 0) vis_meter_rises[0] = vis_meter_bump_duration;
else vis_meter_falls[clamp(ceil(hunger_meter/10)-1, 0, 8)] = vis_meter_bump_duration;

buffer_stance_update = false;
switch stance {
	case 1: // Famished
		if (hunger_meter > 10) buffer_stance_update = true;
		break;
	case 2: // Voracious
		if (hunger_meter <= 10 || hunger_meter > 30) buffer_stance_update = true;
		break;
	case 3: // Normal
		if (hunger_meter <= 30 || hunger_meter > 80) buffer_stance_update = true;
		break;
	case 4: // Overstuffed
		if (hunger_meter <= 80) buffer_stance_update = true;
		break;
}
