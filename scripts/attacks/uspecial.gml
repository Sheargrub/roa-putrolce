var atk = AT_USPECIAL;
var window_num = 1;
var window_length = 0;

set_attack_value(atk, AG_CATEGORY, 2);
set_attack_value(atk, AG_SPRITE, sprite_get("uspecial"));
set_attack_value(atk, AG_NUM_WINDOWS, 6);
set_attack_value(atk, AG_AIR_SPRITE, sprite_get("uspecial"));
set_attack_value(atk, AG_HURTBOX_SPRITE, sprite_get("uspecial_hurt"));
set_attack_value(atk, AG_USES_CUSTOM_GRAVITY, 1);

//thank you for your hard work and ingenuity, sir kibble

// Startup
set_window_value(atk, window_num, AG_WINDOW_TYPE, 1);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 15);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, window_num, AG_WINDOW_HAS_SFX, 1);
set_window_value(atk, window_num, AG_WINDOW_SFX_FRAME, 14);
set_window_value(atk, window_num, AG_WINDOW_SFX, asset_get("sfx_syl_uspecial_travel_start"));
set_window_value(atk, window_num, AG_WINDOW_CUSTOM_GRAVITY, 0.5);
window_num++;

// Active window
set_window_value(atk, window_num, AG_WINDOW_TYPE, 1);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 16);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num, AG_WINDOW_VSPEED, -12);
set_window_value(atk, window_num, AG_WINDOW_VSPEED_TYPE, 1);
window_num++;

// Spin
set_window_value(atk, window_num, AG_WINDOW_TYPE, 1);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 16);
set_window_value(atk, window_num, AG_WINDOW_VSPEED, 0);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num, AG_WINDOW_VSPEED, -5);
set_window_value(atk, window_num, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(atk, window_num, AG_WINDOW_HAS_SFX, 1);
set_window_value(atk, window_num, AG_WINDOW_SFX_FRAME, 8);
set_window_value(atk, window_num, AG_WINDOW_SFX, asset_get("sfx_ori_stomp_spin"));
window_num++;

// Drop
set_window_value(atk, window_num, AG_WINDOW_TYPE, 8);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 999);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAME_START, 10);
set_window_value(atk, window_num, AG_WINDOW_VSPEED, 20);
set_window_value(atk, window_num, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(atk, window_num, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(atk, window_num, AG_WINDOW_CUSTOM_AIR_FRICTION, 0);
window_num++;

// Land
set_window_value(atk, window_num, AG_WINDOW_TYPE, 1);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 24);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(atk, window_num, AG_WINDOW_HAS_SFX, 1);
set_window_value(atk, window_num, AG_WINDOW_SFX, asset_get("sfx_kragg_rock_pillar"));
window_num++;

// Getup
set_window_value(atk, window_num, AG_WINDOW_TYPE, 1);
set_window_value(atk, window_num, AG_WINDOW_LENGTH, 16);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num, AG_WINDOW_ANIM_FRAME_START, 15);
window_num++;

// Followup attack -------------------------------------------------------------
// Currently repurposes NAir anim and properties. Change this later! (See also: animation.gml)

// Startup
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_syl_uspecial_travel_start"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, 4);
window_num++;

// Active
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
window_num++;

// Endlag
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 7); // pratfall
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 9);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);

window_num++;

// Successful command grab -----------------------------------------------------

// Grabbed
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 9);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, 30);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_HITPAUSE_PULL, 1);
window_num++;

// Spin up
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -50);
window_num++;

// Multihit
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 0);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -50);
window_num++;

// Final
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 6);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 3);
window_num++;

// Endlag
set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 9);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);
window_num++;


set_num_hitboxes(atk, 4);
var hbox_num = 1;

//base dash stomp
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 5);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 8);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -20);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 120);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 8);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 8);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 7);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.5);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 10);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
hbox_num++;

// Command grab
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 8);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 4);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 6);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -20);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 120);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 80);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 1);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 3);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 70);
set_hitbox_value(atk, hbox_num, HG_ANGLE_FLIPPER            , 6);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 4);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , .2);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 10);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.4);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , -20);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium1"));
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 0);
set_hitbox_value(atk, hbox_num, HG_HAS_GRAB                 , 1);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOW_GOTO         , 10);
set_hitbox_value(atk, hbox_num, HG_GRAB_WINDOWS_NUM         , 14);
hbox_num++;

// Multihit
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , -1);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 12);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -70);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 2);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 8);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 3);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.2);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 4);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.2);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 301);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_medium1"));
hbox_num++;

// Launcher
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 1);
set_hitbox_value(atk, hbox_num, HG_HITBOX_GROUP             , hbox_num);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 13);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 2);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 0);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -70);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 40);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 40);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 6);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 1);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 8);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 8);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0.5);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 10);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 304);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , asset_get("sfx_blow_heavy1"));
hbox_num++;
