var atk             = AT_FSTRONG;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("fstrong"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("fstrong_hurt"));
set_attack_value(atk, AG_STRONG_CHARGE_WINDOW           , 1);
set_attack_value(atk, AG_CATEGORY                       , 0);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_syl_uspecial_travel_start"));
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 4);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 4);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_syl_fspecial_bite"));
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 20); //always whiffs
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_GOTO, 31);
window_num++;

//grab success
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
set_window_value(atk, window_num                        , AG_WINDOW_HITPAUSE_FRAME, 4);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 80);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, 0);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 16);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 12);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 4);
window_num++;

set_attack_value(atk, AG_NUM_WINDOWS                    , window_num-1);


//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 2);
var hbox_num = 1;

set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 52);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -40);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 48);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 35);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 2);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 6);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.2);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 303);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 45);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , -5);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_bigplant_clamp"));
set_hitbox_value(atk, hbox_num, HG_HAS_GRAB                 , true);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOW_GOTO         , 4);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOWS_NUM         , 6);
hbox_num++;

set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 5);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , get_window_value(atk, get_hitbox_value(atk,hbox_num,HG_WINDOW), AG_WINDOW_LENGTH));
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 80);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -32);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 2);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 37);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 26);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 361);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 9);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.85);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 7);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.9);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 45);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , -5);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_bite"));