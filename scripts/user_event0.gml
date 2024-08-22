// Stance update checks
// Should be called whenever hunger_meter needs to be altered.
// hunger_change should be set before calling this.

if (hunger_locked || hunger_change == 0) exit;

hunger_meter += hunger_change;
hunger_meter = clamp(hunger_meter, 0, 90);

if (hunger_change > 0) vis_meter_rises[0] = vis_meter_bump_duration;
else vis_meter_falls[clamp(ceil(hunger_meter/10), 0, 8)] = vis_meter_bump_duration;

buffer_stance_update = true;
