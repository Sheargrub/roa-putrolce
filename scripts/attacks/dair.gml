var atk             = AT_DAIR;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("dair"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("dair_hurt"));
set_attack_value(atk, AG_NUM_WINDOWS                    , 3);
set_attack_value(atk, AG_CATEGORY                       , 1);
set_attack_value(atk, AG_HAS_LANDING_LAG                , 1);
set_attack_value(atk, AG_LANDING_LAG                    , 13);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 15);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_STANCE_LENGTHS, 1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_LENGTHS, [15, 13, 15, 21]);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_SFX_FRAMES, [14, 12, 14, 20]);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_swipe_heavy1"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, -5);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 16);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_STANCE_LENGTHS, 1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_LENGTHS, [15, 10, 16, 18]);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_WHIFFLAG, 1);
window_num++;

//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 8);
var hbox_num = 1;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 6);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , 18);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 26);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 26);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 8);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 270);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.40);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 9);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.4);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium2"));

var hbox_num = 2;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 13);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -21);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 56);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 77);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 8);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 5);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.45);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium1"));

var hbox_num = 3;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 6);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , 18);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 26);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 26);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 9);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 270);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 5);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.65);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 9);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.4);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy2"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);

var hbox_num = 4;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 13);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -21);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 56);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 77);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 9);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.75);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);

var hbox_num = 5;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 6);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , 18);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 26);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 26);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 11);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 270);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.65);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 9);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.4);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy2"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);

var hbox_num = 6;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 13);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -21);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 56);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 77);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 11);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.75);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_small);

var hbox_num = 7;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 6);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , 18);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 26);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 26);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 2);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 16);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 270);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.85);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 9);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy2"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);

var hbox_num = 8;

set_hitbox_value(atk, hbox_num, HG_STANCE                   , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 3);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 13);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -21);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 56);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 77);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 12);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.75);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.8);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_kragg_big);