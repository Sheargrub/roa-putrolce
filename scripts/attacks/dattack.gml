var atk             = AT_DATTACK;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("dattack"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("dattack_hurt"));
set_attack_value(atk, AG_NUM_WINDOWS                    , 4);
set_attack_value(atk, AG_CATEGORY                       , 0);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
//set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
//    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_STANCE_LENGTHS, 1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_LENGTHS, [10, 6, 9, 12]);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, sound_get("suplex_dattack"));
//set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_SFX_FRAMES, [9, 5, 8, 11]);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, -5);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1); // todo: need to add stance handling
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 8);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 5);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_land_heavy"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, 3);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
//set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
//    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_STANCE_LENGTHS, 1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_LENGTHS, [15, 12, 15, 17]);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_WHIFFLAG, 1);
window_num++;

//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 8);
var hbox_num = 1;

//early hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 40);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -28);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 66);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 44);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.3);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 6);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.3);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_weak1"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 2;

//early hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 40);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -28);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 66);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 44);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.9);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 10);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.9);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium2"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 3;

//early hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 40);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -28);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 66);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 44);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 9);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.8);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 7);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , sound_get("scarab_hit"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 4;

//early hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 40);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -28);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 66);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 44);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 12);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 9);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.85);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , sound_get("sword1"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 5;

//late hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 5);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 33);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -26);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 54);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 41);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.3);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 6);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.3);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_weak1"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 6;


//late hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 5);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 33);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -26);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 54);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 41);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.6);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.7);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , sound_get("hit_weak"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 7;

//late hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 5);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 33);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -26);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 54);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 41);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 9);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.6);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 6);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , sound_get("hit_spikes"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);

var hbox_num = 8;

//late hit
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 5);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 33);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -26);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 54);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 41);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 12);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 45);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.85);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 7);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , sound_get("hit_bird"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);