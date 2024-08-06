
var meter_percent = hunger_meter / 100;
hunger_meter = 40 + (20 * meter_percent);
user_event(1);
sound_stop(stance_sfx_instance);