var atk             = AT_USTRONG;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("ustrong"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("ustrong_hurt"));
set_attack_value(atk, AG_NUM_WINDOWS                    , 6);
set_attack_value(atk, AG_STRONG_CHARGE_WINDOW           , 1);
set_attack_value(atk, AG_CATEGORY                       , 0);
set_attack_value(atk, AG_GRABS_SLEEPERS                 , 1);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
//set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 10);
//    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_STANCE_LENGTHS, 1);
set_window_value(atk, window_num                        , AG_WINDOW_STANCE_LENGTHS, [11, 8, 11, 15]);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, -5);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 4);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1); 
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_syl_uspecial_travel_start"));
window_num++;

// First active
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 4);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_bigplant_eat"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1); // mostly just to support sleepers
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -80);
window_num++;

// Second active
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 11);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_WHIFFLAG, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 11);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_WHIFFLAG, 1);
window_num++;

// Grab windows begin here
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -80);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_HITPAUSE_PULL, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 4);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -20);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 14);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_WHIFFLAG, 1);
window_num++;



//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 7);
var hbox_num = 1;

set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -64);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 45);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 64);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 3);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 75);
set_hitbox_value(atk, hbox_num, HG_ANGLE_FLIPPER            , 7);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 4);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 301);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium2"));
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 4);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , 1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -112);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 55);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 32);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 3);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 1);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 4);
set_hitbox_value(atk, hbox_num, HG_FORCE_FLINCH             , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 301);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium2"));
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 4);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 4);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -106);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 60);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 55);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 6);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.3);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 12);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.3);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304)
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_bite"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , -12);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , -12);
set_hitbox_value(atk, hbox_num, HG_HAS_GRAB                 , 1);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOW_GOTO         , 7);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOWS_NUM         , 9);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 1);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 9);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -40);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 1);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_bite);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_crunch"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 1);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 9);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -40);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 1.1);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_bite);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_crunch"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 2);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 3);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 9);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -40);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 9);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 1.15);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 8);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_bite);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_crunch"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 2);

hbox_num++;
set_hitbox_value(atk, hbox_num, HG_STANCE                   , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 9);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -40);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 5);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 1.3);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 9);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , fx_bite);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_crunch"));
set_hitbox_value(atk, hbox_num, HG_HUNGER_GAIN              , 20);
set_hitbox_value(atk, hbox_num, HG_SLEEPER_TAG              , 2);