
// Stance stat refresh
var old_stance = stance;

if (hunger_meter <= 0) stance = 1;
else if (hunger_meter <= 20) stance = 2;
else if (hunger_meter <= 70) stance = 3;
else stance = 4;

if (old_stance == stance) exit;

var i = stance-1;

idle_anim_speed = idle_anim_speed_stances[i];

walk_speed = walk_speed_stances[i];
initial_dash_speed = initial_dash_speed_stances[i];
dash_speed = dash_speed_stances[i];

leave_ground_max = leave_ground_max_stances[i];
max_jump_hsp = max_jump_hsp_stances[i];
air_max_speed = air_max_speed_stances[i];

max_fall = max_fall_stances[i];
fast_fall = fast_fall_stances[i];

wave_land_adj = wave_land_adj_stances[i];

if (should_debug) print_debug("Stats refreshed! (" + string(get_gameplay_time()) + ")");

outline_color = stance_outlines[stance-1];
init_shader();

sound_stop(stance_sfx_instance);
stance_sfx_instance = sound_play(sfx_stances[i]);

set_ui_element(UI_HUD_ICON, sprite_get("hud_icon"+stance_suffixes[stance-1]));

buffer_stance_update = false;


switch (stance) {
    case 1:
        knight_compat_dream = 
            [
                "...must... ...consume...",
                "...can't... ...keep up...",
                "...so... ...tired..."
            ]
    break;
    case 2:
        knight_compat_dream = 
            [
                "STOP RUNNING.",
                "JUST ONE BITE.",
                "ANYTHING WILL DO."
            ]
    break;
    case 3:
        knight_compat_dream = 
            [
                "I hope this Figment tastes real good!",
                "Running low... gotta be careful",
                "A figment? Looks like a light snack."
            ]
    break;
    case 4:
        knight_compat_dream = 
            [
                "I wish I could feel this full more often...",
                "Feelin' full, but won't say no 'no' to seconds!",
                "Wonder what's for dessert?"
            ]
    break;
}