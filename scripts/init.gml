
// Debug flag: enables a few print_debug() statements for testing purposes.
should_debug = false;
if (get_match_setting(SET_PRACTICE)) {
    var tag = get_player_name(player);
    if (tag == "snom" || tag == "DEBUG") should_debug = true;
}


//=-(                     ~~//** CUSTOM INDEXES **//~~                     )-=//

//                           ATTACK/WINDOW INDEXES                            //

/*
- free attack data indexes technically start at 24 up to 99, went with 30 to
make it look cleaner
*/

// AG_HUNGER_COST = 30;
AG_LAST_STANCE = 31; // used on-the-fly, should not be set in attack scripts
AG_HAS_STANCE_SPRITES = 32;
AG_STANCE_SPRITES = 33;
AG_HAS_STANCE_HURT_SPRITES = 34;
AG_STANCE_HURT_SPRITES = 35;
AG_NUM_STANCE_WINDOWS = 36; // may or may not be necessary?

/*
- free window data indexes technically start at 61 up to 99, went with 70 to
make it look cleaner
*/

// adds looping frames to an attack's charge window, while charging
AG_WINDOW_HAS_CHARGE_LOOP       = 70;   // if the window has a charge anim loop
AG_WINDOW_CHARGE_FRAME_START    = 71;   // anim frame of the start of the loop
AG_WINDOW_CHARGE_FRAMES         = 72;   // total number of frames
AG_WINDOW_CHARGE_LOOP_SPEED     = 73;   // speed of the loop animation

AG_WINDOW_GRAB_OPPONENT         = 74;   // if the window is a grab window (1),
                                        // hold opponent, otherwise let them go
AG_WINDOW_GRAB_POS_X            = 75;   // x position to hold grabbed opponent
AG_WINDOW_GRAB_POS_Y            = 76;   // y position to hold grabbed opponent
AG_WINDOW_GRAB_HITPAUSE_PULL    = 77;   // If true, the opponent will be pulled
                                        // over the duration of hitpause instead
                                        // of during the attack window.

AG_WINDOW_CAN_WALLJUMP          = 79;   // if the player can walljump out of the
                                        // window

AG_WINDOW_HAS_STANCE_LENGTHS    = 80;
AG_WINDOW_STANCE_LENGTHS        = 81;
AG_WINDOW_STANCE_SFX_FRAMES     = 82;   // Bound to HAS_STANCE_LENGTHS

AG_WINDOW_HUNGER_GAIN           = 83;
AG_WINDOW_HUNGER_GAIN_FRAME     = 84;



//                               HITBOX INDEXES                               //

/*
- free hitbox data indexes technically start at 54 up to 99, went with 60 to
make it look cleaner
*/

HG_HAS_GRAB                     = 60;   // makes the hitbox into a command grab
HG_BREAKS_GRAB                  = 61;   // if the grabbed player is hit, they're
                                        // no longer grabbed
HG_GRAB_WINDOW_GOTO             = 62;   // window the grab goes into
                                        // -1 if it continues in the same window
HG_GRAB_WINDOWS_NUM             = 63;   // up to what window the grab goes to
                                        // -1 if it doesnt change window num
HG_HAS_LERP                     = 64;   // if the hitbox has lerp properties
HG_LERP_PERCENT                 = 65;   // how much pull the lerp has
                                        // from 0.0~1.0
HG_LERP_POS_X                   = 66;   // x position that the lerp pulls to
HG_LERP_POS_Y                   = 67;   // y position that the lerp pulls to

HG_PROJECTILE_MULTIHIT          = 70;   // if a projectile multihits
HG_PROJECTILE_MULTIHIT_RATE     = 71;   // rate at which a projectile multihits
                                        // ex.: if 10, hits every 10 frames
                                        // (individual per opponent)
HG_PROJECTILE_MAX_HITS          = 72;   // max number of times the projectile
                                        // can hit before being destroyed
                                        // (individual per opponent)
                                        // put -1 for no limit

HG_HUNGER_GAIN                  = 80;
HG_STANCE                       = 81;   // If uninitialized/set to 0, will appear in all stances
                                        // NOTE: If using HG_STANCE, the hitbox must be included in set_num_hitboxes()

// if you're making custom indexes for your character, I recommend starting at
// 80 or 90, as slots up to 79 may be filled in future updates

/*
if you're using multihit properties, be sure to check if the projectile goes 
through enemies, otherwise it might just despawn on hit
*/


//=-(                    ~~//** CUSTOM VARIABLES **//~~                    )-=//
//                              PUT YOURS HERE                                //

is_putrolce                     = true;

hunger_meter                    = 50; // 0 to 100, used to update stance
was_meter_increased             = false; // used to determine hud meter bump direction
stance                          = 3; // 1-4, see below
stance_names                    = ["Famished", "Voracious", "Normal", "Overstuffed"] // For debug and training mode elements
stance_suffixes                 = ["_famished", "_voracious", "", "_overstuffed"] // for movement anim handling

ST_FAMISHED                     = 1; // remember, these are incompatible with switch statements
ST_VORACIOUS                    = 2;
ST_NORMAL                       = 3;
ST_OVERSTUFFED                  = 4;

putrolce_status_owner = 0;  // reflected in other_init.gml
putrolce_status_timer = 0;

nspec_sleepers_active = 0;

fspec_armor_hits = 0;

dspec_sleeper_id = noone;
dspec_sfx_instance = noone;
dspec_rethrow = false;

attack_sfx_instance = noone;
sfx_attack = 0;
do_sfx_cancel = false;

idle_flourish_timer = 0;
idle_flourish_speed_stances = [0.2, 0.2, 0.2, 0.2];

vis_meter_falls = array_create(9);
vis_meter_rises = array_create(9);
vis_meter_bump_duration = 10;
vis_meter_pass_time = 8;
stance_sfx_instance = noone;
sfx_stances = [sound_get("famished_effect"), asset_get("mfx_mm_coin"), asset_get("mfx_mm_coin_all"), sound_get("parachute")];

buffer_stance_update = false; // set to true when a change in hunger level is detected.
buffer_pratfall = false; // applied as soon as a state change occurs.



var default_outline = [0, 0, 0];
switch get_player_color(player) {
    
    case 0:
        var famished_outline = [30, 2, 50];
        var voracious_outline = [57, 4, 3];
        var overstuffed_outline = [0, 16, 67];
        break;
    
    default:
        var famished_outline = [30, 2, 50];
        var voracious_outline = [57, 4, 3];
        var overstuffed_outline = [0, 16, 67];
        break;
        
}
stance_outlines = [famished_outline, voracious_outline, default_outline, overstuffed_outline];


//                               PRE-SET STUFF                                //
// attack/hitbox index variables
grabbed_player_obj              = noone;// the player that got grabbed
grabbed_player_relative_x       = 0;    // x position in relation to the player, 
                                        // for the grabbed player to be moved to
grabbed_player_relative_y       = 0;    // y position in relation to the player, 
                                        // for the grabbed player to be moved to

// composite vfx array
comp_vfx_array                  = [[{cur_timer: 1, max_timer: 0}]];
                                        // array containing the composite
                                        // vfx
vfx_created                     = false;// checks if the effect was successfully
                                        // created in the array

/* // WIP 
// alt color shade slots
num_base_colors                 = 1;    // how many colors the character has

col_shade_list                  = [
                                [1],
                                [0],
                                [0],
                                [0],
                                [1],
                                [1]
                                ];      // array holding shade values in each
                                        // alt for each color
                                        // as sandbert only has 1 color and 6
                                        // alts, there's 6 arrays with 1 element

*/
/*
- remember that css needs it's own version of these variables, so if you change
it here, change it there too!
*/

// animation stuff
idle_air_loops                  = false;// whether idle air has a looping 
                                        // animation or not
idle_air_looping                = false;// checks if the loop is happening
jump_frames                     = 5;    // how many animation frames the jump 
                                        // has, the loop starts there
idle_air_loop_speed             = 0.25;  // animation speed of the loop
idle_air_platfalls              = false; // if the character has an animation for
                                        // dropping from platforms
idle_air_platfalling            = false;// checks if platfall is happening
idle_air_platfall_speed         = 0.25; // platfall animation speed
idle_air_platfall_frames        = 7;    // how many frames the platfall anim has
                                        // when finished goes to air idle
dash_moonwalks                  = false; // if the character has a moonwalk anim



//=-(                      ~~//** BASE STATS **//~~                        )-=//
// Stance stat ordering goes from most to least hungry.
// Stats should be initialized to Normal state (array index 2).

//                              --hurtboxes--                                 //
hurtbox_spr                     = asset_get("ex_guy_hurt_box");
crouchbox_spr                   = asset_get("ex_guy_crouch_box");
air_hurtbox_spr                 = -1;
hitstun_hurtbox_spr             = -1;


//                  --animation speeds + %-arrow offset--                     //
char_height                     = 52;
idle_anim_speed                 = 0.1;
idle_anim_speed_stances         = [0.08, 0.12, 0.1, 0.08];
crouch_anim_speed               = 0.1;
walk_anim_speed                 = 0.125;
dash_anim_speed                 = 0.2;
pratfall_anim_speed             = 0.25;

//                      --grounded movement stats--                           //
walk_speed                      = 3.25;
walk_speed_stances              = [2, 4, 3.25, 2.5];
walk_accel                      = 0.2;
walk_turn_time                  = 6;
initial_dash_time               = 12;
initial_dash_speed              = 6.5;
initial_dash_speed_stances      = [4, 7.5, 6.5, 6];
dash_speed                      = 6;
dash_speed_stances              = [4.5, 7, 6, 5.5];
dash_turn_time                  = 10;
dash_turn_accel                 = 1.5;
dash_stop_time                  = 4;
dash_stop_percent               = 0.35;
ground_friction                 = 0.5;
moonwalk_accel                  = 1.4;

//                       --aerial movement stats--                            //
jump_start_time                 = 5;
jump_speed                      = 11.5;
short_hop_speed                 = 6.5;
djump_speed                     = 11;

leave_ground_max                = 7;
leave_ground_max_stances        = [6, 8.5, 7, 6.5];
max_jump_hsp                    = 6;
max_jump_hsp_stances            = [5, 7.5, 6, 5.5];
air_max_speed                   = 4;
air_max_speed_stances           = [3, 5, 4, 4];
jump_change                     = 3;

air_accel                       = 0.3;
prat_fall_accel                 = 1;
air_friction                    = 0.04;

max_djumps                      = 1;
double_jump_time                = 32;

walljump_hsp                    = 7;
walljump_vsp                    = 7;
walljump_time                   = 32;

max_fall                        = 11;
max_fall_stances                = [9.5, 11, 11, 11];
fast_fall                       = 14;
fast_fall_stances               = [12, 14, 14, 14];
gravity_speed                   = 0.55;
hitstun_grav                    = 0.51;

//                    --character knockback adjustment--                      //
/* 
- higher num = 'lighter' character; 
- lower num = 'heavier' character 
*/
knockback_adj                   = 0.95;

//                           --landing stats--                                //
land_time                       = 4; 
prat_land_time                  = 10;
wave_land_time                  = 8;
wave_land_adj                   = 1.28;
wave_friction                   = 0.33;

//                          --animation frames--                              //
crouch_startup_frames           = 1;
crouch_active_frames            = 1;
crouch_recovery_frames          = 1;

dodge_startup_frames            = 1;
dodge_active_frames             = 1;
dodge_recovery_frames           = 3;

tech_active_frames              = 3;
tech_recovery_frames            = 1;

techroll_startup_frames         = 2
techroll_active_frames          = 2;
techroll_recovery_frames        = 2;


air_dodge_startup_frames        = 1;
air_dodge_active_frames         = 2;
air_dodge_recovery_frames       = 3;

roll_forward_startup_frames     = 1;
roll_forward_active_frames      = 2;
roll_forward_recovery_frames    = 1;
roll_back_startup_frames        = 1;
roll_back_active_frames         = 2;
roll_back_recovery_frames       = 1;

//                        --defensive action speed--                          //
techroll_speed                  = 9;

air_dodge_speed                 = 7.5;

roll_forward_max                = 8; 
roll_backward_max               = 8;

//                      --base movement sound effects--                       //
land_sound                      = asset_get("sfx_land_heavy");
landing_lag_sound               = asset_get("sfx_land");
waveland_sound                  = asset_get("sfx_waveland_kra");
jump_sound                      = asset_get("sfx_jumpground");
djump_sound                     = asset_get("sfx_jumpair");
air_dodge_sound                 = asset_get("sfx_quick_dodge");

//                       --ranno bubble visual offset--                       //
bubble_x                        = 0;
bubble_y                        = 8;

// hfx
fx_kragg_small = hit_fx_create(sprite_get("hfx_rock_small_bg"),20);
fx_kragg_big = hit_fx_create(sprite_get("hfx_rock_large"),20);

fx_slp_phase = hit_fx_create(sprite_get("slp_phase"), 24);
fx_slp_destroyed = hit_fx_create(sprite_get("slp_destroyed"), 32);
fx_slp_destroyed_homing = hit_fx_create(sprite_get("slp_homing_death"), 32);
fx_slp_sleeping = hit_fx_create(sprite_get("slp_sleepingvfx_temp"), 24);

// Transparency matrices (courtesy of Supersonic - used for drawing enemy outlines)
outline_catch_colorI = [
    1, 1, 1, 1, // catch all
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 1 // catch outline
    ]
outline_catch_colorT = [
    1, 1, 1, 1, // catch all
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    1, 1, 0.1, 0.2 // outline tolerance
    ]
outline_catch_colorO = [
    1, 1, 1, 0, // force 0 in alpha for everything other than the outline
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 1 // this is the outline color
    ]
outline_catch_colorB = [
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0
    ]
