var atk             = AT_TAUNT;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("taunt"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , hurtbox_spr);
set_attack_value(atk, AG_NUM_WINDOWS                    , 3);
set_attack_value(atk, AG_CATEGORY                       , 0);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, sound_get("burp"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN, -10);
set_window_value(atk, window_num                        , AG_WINDOW_HUNGER_GAIN_FRAME, -1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 20);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 4);
window_num++;

//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 1);
var hbox_num = 1;

// Petrified (with followup)
set_hitbox_value(atk, hbox_num, HG_HITBOX_TYPE              , 2);
set_hitbox_value(atk, hbox_num, HG_WINDOW                   , 3);
set_hitbox_value(atk, hbox_num, HG_WINDOW_CREATION_FRAME    , 0);
set_hitbox_value(atk, hbox_num, HG_LIFETIME                 , 90);
set_hitbox_value(atk, hbox_num, HG_HITBOX_X                 , 16);
set_hitbox_value(atk, hbox_num, HG_HITBOX_Y                 , -50);
set_hitbox_value(atk, hbox_num, HG_SHAPE                    , 0);
set_hitbox_value(atk, hbox_num, HG_WIDTH                    , 0);
set_hitbox_value(atk, hbox_num, HG_HEIGHT                   , 0);
set_hitbox_value(atk, hbox_num, HG_PRIORITY                 , 0);
set_hitbox_value(atk, hbox_num, HG_DAMAGE                   , 0);
set_hitbox_value(atk, hbox_num, HG_ANGLE                    , 90);
set_hitbox_value(atk, hbox_num, HG_BASE_KNOCKBACK           , 1);
set_hitbox_value(atk, hbox_num, HG_KNOCKBACK_SCALING        , 0);
set_hitbox_value(atk, hbox_num, HG_BASE_HITPAUSE            , 1);
set_hitbox_value(atk, hbox_num, HG_HITPAUSE_SCALING         , 0.1);
//set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT            , 1);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_X_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_VISUAL_EFFECT_Y_OFFSET   , 0);
set_hitbox_value(atk, hbox_num, HG_HIT_SFX                  , noone);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_SPRITE        , sprite_get("taunt_skull"));
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_ANIM_SPEED    , 0.3);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_MASK          , -1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_COLLISION_SPRITE,  sprite_get("taunt_skull_mask"));
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_DESTROY_EFFECT, HFX_FOR_HIT_SMALL);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_WALL_BEHAVIOR , 0);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_UNBASHABLE    , true);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_PARRY_STUN    , false);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_DOES_NOT_REFLECT, true);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_IS_TRANSCENDENT, false);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_PLASMA_SAFE   , false);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_HSPEED        , 5);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_VSPEED        , -2);
set_hitbox_value(atk, hbox_num, HG_PROJECTILE_GRAVITY       , 0.3);
hbox_num++;