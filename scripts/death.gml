
var meter_percent = hunger_meter / 100;
hunger_meter = round(40 + (20 * meter_percent));
var meter_offset = hunger_meter % 5; // round to nearest 5
if (meter_offset > 2) meter_offset -= 5;
hunger_meter -= meter_offset;
user_event(1);
sound_stop(stance_sfx_instance);