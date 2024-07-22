//                              ARTICLE  STUFF                                //
/*
    considering that articles are p much empty things that you can do whatever
    with, I'll only set up a really basic state machine since those tend to be 
    pretty useful for most situations
    
    although sometimes you'll probably want to delete it and start from scratch
    if it's a really simple article
*/

// sprite and mask indexes; + default article variables
sprite_index = sprite_get("slp_rock");
mask_index = sprite_get("slp_mask");
can_be_grounded = false;
ignores_walls = true; // Sometimes performs place_meeting checks for par_blocks, but generally ignores ground
spr_dir = player_id.spr_dir;

uses_shader = true;

// initial movement
hsp = 3.5*spr_dir;
vsp = -5;
old_hsp = hsp;
old_vsp = vsp;

// article variables
was_parried = false;
reflected_player_id = noone;
block_idle_state = false;
block_active_state = false;
block_hitbox_checks = false;
block_ground_checks = false;

targetted_player_id = noone;
attempting_tracking = false; // used to communicate with post_draw
move_angle = (spr_dir == 1) ? 0 : 180;
move_speed = 0;

petrified_hitbox = noone;
active_hitbox = noone;
hit_player_id = noone;
despawn_vfx = player_id.fx_kragg_small;
despawn_sfx = asset_get("sfx_kragg_rock_shatter");

active_move_polarity = 1; // used to smooth the transition into the active state
active_move_coefficient = 2*pi / 40; // denominator should be the period of the motion in frames
active_move_offset = 0; // used by reflects to maintain continuity

unbashable = false;
orig_player = player; // because ori is a thief >:(
venus_article_reflect = 1;
venus_reflected = false; // managed externally
venus_late_reflect_frame = false; // managed internally
venus_was_reflected = false; // managed internally
venus_rune_ID = noone;
venus_rune_angle = 0;
venus_sine_offset = 0; // used for reflections of ST_ACTIVE_DEFAULT

dspec_skewered = false;
dspec_ignore = false;
dspec_player_id = noone;
dspec_hunger_value = 25;

// state machine variables
state = 0;
state_timer = 0;
should_die = false; //if the article should be despawned

// m
transition_timer = 0; // used for anims
rot_sprite_index = sprite_get("slp_wave_to_homing");
rot_image_index = 0;
rot_sprite_angle = 0;

// inital hitbox
petrified_hitbox = create_article_hitbox(AT_NSPECIAL, 1, x, y)


#define create_article_hitbox(atk, hitbox_num, _x, _y)
    var article_hitbox = create_hitbox(atk, hitbox_num, _x, _y);
    article_hitbox.sleeper_owner = self;
    article_hitbox.faux_reflected_owner = noone;
    article_hitbox.venus_article_proj_ignore = true;
    article_hitbox.unbashable = true;
    return article_hitbox;