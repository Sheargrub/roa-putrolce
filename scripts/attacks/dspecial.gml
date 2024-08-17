var atk             = AT_DSPECIAL;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("dspecial"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("dspecial_hurt"));
set_attack_value(atk, AG_NUM_WINDOWS                    , 3);
set_attack_value(atk, AG_CATEGORY                       , 2);
set_attack_value(atk, AG_GRABS_SLEEPERS                 , 1);

// Main attack
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 15);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, sound_get("bair"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, -10);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 15);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 4);
window_num++;

// Command grab followup
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0); // startup 1
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
//set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, sound_get("sword2")); // handled in code to account for cancel into dspec-2
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 80);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -4);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_HITPAUSE_PULL, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 0);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED, 0);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0); // startup 2
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_orca_bite"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 40);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -4);
//set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1); // handled manually
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED_TYPE, 1);
//set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 0);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED, 0);
set_hitbox_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, 10);
set_hitbox_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 0);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED, 0);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 10);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 12);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 0);

//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 3);
var hbox_num = 1;

// Initial hit
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 54);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -32);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 88);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 16);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 3);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 60);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 20);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.5);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , HFX_GEN_OMNI);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
set_hitbox_value(atk, hbox_num, HG_HAS_GRAB                 , 1);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOW_GOTO         , 4);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOWS_NUM         , 7);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 1);
hbox_num++;

// Initial hit (tip)
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 103);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -32);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 20);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 20);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 60);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 20);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.5);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , HFX_GEN_OMNI);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
set_hitbox_value(atk, hbox_num, HG_HAS_GRAB                 , 1);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOW_GOTO         , 4);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOWS_NUM         , 7);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 1);
hbox_num++;

// Bite
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 6);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 26);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -34);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 30);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 20);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 40);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.2);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 16);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.5);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_bite);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_orca_crunch"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 30);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 2);
hbox_num++;

// Status followup
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , 2);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 6);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 20);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 20);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 3);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 3);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , .1);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 6);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , .1);
set_hitbox_value(atk, hbox_num, HG_EXTRA_HITPAUSE           , 4);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium1"));
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_SPRITE        , sprite_get("null"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_MASK          , -1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_PARRY_STUN    , 1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_UNBASHABLE    , 1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_PLASMA_SAFE   , 1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(atk, hbox_num, HG_IGNORES_PROJECTILES      , 1);
hbox_num++;

