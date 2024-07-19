//                              ARTICLE  STUFF                                //
/*
    considering that articles are p much empty things that you can do whatever
    with, I'll only set up a really basic state machine since those tend to be 
    pretty useful for most situations
    
    although sometimes you'll probably want to delete it and start from scratch
    if it's a really simple article
*/

// sprite and mask indexes; + default article variables
sprite_index = sprite_get("slp_statue_temp");
mask_index = asset_get("ex_guy_hurt_box");
can_be_grounded = false;
ignores_walls = true; // Sometimes performs place_meeting checks for par_blocks, but generally ignores ground
spr_dir = player_id.spr_dir;

uses_shader = true;

// initial movement
hsp = 3.5*spr_dir;
vsp = -5;

// article variables
reflected_player_id = noone;
block_idle_state = false;
block_active_state = false;
block_hitbox_checks = false;

targetted_player_id = noone;
attempting_tracking = false; // used to communicate with post_draw
move_angle = 90 - (90*spr_dir);
move_speed = 0;

petrified_hitbox = noone;
active_hitbox = noone;
hit_player_id = noone;
despawn_vfx = player_id.fx_kragg_small;


// state machine variables
state = 0;
state_timer = 0;
should_die = false; //if the article should be despawned


// inital hitbox
petrified_hitbox = create_article_hitbox(AT_NSPECIAL, 1, x, y)




#define create_article_hitbox(atk, hitbox_num, _x, _y)
    var article_hitbox = create_hitbox(atk, hitbox_num, _x, _y);
    article_hitbox.sleeper_owner = self;
    article_hitbox.faux_reflected_owner = noone;
    return article_hitbox;