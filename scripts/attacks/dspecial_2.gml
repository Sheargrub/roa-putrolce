var atk             = AT_DSPECIAL_2;
var window_num      = 1;
var window_length   = 0;

//                        --attack windows--                                  //
set_attack_value(atk, AG_SPRITE                         , sprite_get("nspecial"));
set_attack_value(atk, AG_HURTBOX_SPRITE                 , sprite_get("nspecial_hurt"));
set_attack_value(atk, AG_NUM_WINDOWS                    , 3);
set_attack_value(atk, AG_CATEGORY                       , 2);

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 8);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, window_num                        , AG_WINDOW_HAS_SFX, true);
set_window_value(atk, window_num                        , AG_WINDOW_SFX, asset_get("sfx_syl_fstrong"));
set_window_value(atk, window_num                        , AG_WINDOW_SFX_FRAME, window_length-1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_OPPONENT, 1);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_X, 24);
set_window_value(atk, window_num                        , AG_WINDOW_GRAB_POS_Y, -4);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(atk, window_num                        , AG_WINDOW_HSPEED, 0);
set_window_value(atk, window_num                        , AG_WINDOW_VSPEED, 0);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 2);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 1);
window_num++;

set_window_value(atk, window_num                        , AG_WINDOW_TYPE, 0);
set_window_value(atk, window_num                        , AG_WINDOW_LENGTH, 14);
    var window_length = get_window_value(atk,window_num , AG_WINDOW_LENGTH);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(atk, window_num                        , AG_WINDOW_ANIM_FRAMES, 2);
window_num++;

//                        --attack hitboxes--                                 //
set_num_hitboxes(atk, 0);