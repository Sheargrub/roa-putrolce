//                              ARTICLE  STUFF                                //

is_putrolce_sleeper = true;
player_id.nspec_sleepers_active++;
is_playtest = (player_id.object_index == oTestPlayer);

// sprite and mask indexes; + default article variables
sprite_index = sprite_get("slp_rock");
mask_index = sprite_get("slp_mask");
can_be_grounded = false;
ignores_walls = true; // Sometimes performs place_meeting checks for par_blocks, but generally ignores ground
spr_dir = player_id.spr_dir;

uses_shader = true;
is_voiced = player_id.is_voiced;

// Initial movement
hsp = 3.5*spr_dir;
vsp = -5;
old_hsp = hsp;
old_vsp = vsp;

// Behavioral flags
block_idle_state = false;
block_active_state = false;
block_hitbox_checks = false;
block_ground_checks = false;
force_plat_checks = false;
block_despawn_cooldown = false;

// Homing properties
targetted_player_id = noone;
attempting_tracking = false; // used to communicate with post_draw
move_angle = (spr_dir == 1) ? 0 : 180;
move_speed = 0;
refresh_hitboxes = false;
target_galaxied = false;
fast_homing = false; // becomes true on parry

// Hitbox/on-hit pointers
petrified_hitbox = noone;
active_hitbox = noone;
hit_player_id = noone;

// Grab variables
grabbed_player_id = noone;
is_grabbed = false;
is_linked = false; // similar to is_grabbed, but used specifically for sleeper tag 4
ignore_grabs = false;
grab_petrified = false; // displayed petrified visual in stagger states

// Active state: sine-movement variables
active_move_polarity = 1; // used to smooth the transition into the active state
active_move_coefficient = 2*pi / 40; // denominator should be the period of the motion in frames
active_move_offset = 0; // used by reflects to maintain continuity

// Inactive state: inter-sleeper collision
var col_id = player_id.nspec_next_id;
inactive_collision_radius = 24; // min distance between any two sleepers
inactive_collision_id = col_id; // used for uniqueness of rng functions
player_id.nspec_next_id = (col_id + 1) % 100;

// Reflections, bashes, etc.
was_parried = false;
unbashable = false;
reflected_player_id = noone;
orig_player = player; // because ori is a thief >:(
venus_article_reflect = 1;
venus_reflected = false; // managed externally
venus_late_reflect_frame = false; // managed internally
venus_was_reflected = false; // managed internally
venus_rune_ID = noone;
venus_rune_angle = 0;
venus_sine_offset = 0; // used for reflections of ST_ACTIVE_DEFAULT

// state machine variables
state = 0;
state_timer = 0;
should_die = false; // if the article should be despawned

// Balance constants
hunger_value = 20;
despawn_cooldown = 45;
inactive_time = 300; // should be at least 100; see despawn alpha vars below

// visual
transition_timer = 0; // used for anims

rot_sprite_index = sprite_get("slp_wave_to_homing");
rot_image_index = 0;
rot_sprite_angle = 0;

inactive_flash_alpha = 0;
inactive_flash_time = inactive_time-100;

despawn_vfx = player_id.fx_kragg_small;
despawn_sfx = asset_get("sfx_kragg_rock_shatter");
despawn_vo = sound_get("voice_sleeperdie")

// inital hitbox
petrified_hitbox = create_article_hitbox(AT_NSPECIAL, 1, x, y)


#define create_article_hitbox(atk, hitbox_num, _x, _y)
    var article_hitbox = create_hitbox(atk, hitbox_num, _x, _y);
    article_hitbox.sleeper_owner = self;
    article_hitbox.putrolce_reflected_owner = noone;
    article_hitbox.venus_article_proj_ignore = true;
    article_hitbox.unbashable = true;
    return article_hitbox;