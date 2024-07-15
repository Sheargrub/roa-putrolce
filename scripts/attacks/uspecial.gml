set_attack_value(AT_USPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("uspecial"));
set_attack_value(AT_USPECIAL, AG_NUM_WINDOWS, 6);
set_attack_value(AT_USPECIAL, AG_AIR_SPRITE, sprite_get("uspecial"));
set_attack_value(AT_USPECIAL, AG_HURTBOX_SPRITE, sprite_get("uspecial_hurt"));
set_attack_value(AT_USPECIAL, AG_USES_CUSTOM_GRAVITY, 1);

//thank you for your hard work and ingenuity, sir kibble

//startup
set_window_value(AT_USPECIAL, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 15);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX_FRAME, 14);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_syl_uspecial_travel_start"));

set_window_value(AT_USPECIAL, 1, AG_WINDOW_CUSTOM_GRAVITY, 0.5);

//active window
set_window_value(AT_USPECIAL, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_LENGTH, 12);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -16);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 1);

//spin
set_window_value(AT_USPECIAL, 3, AG_WINDOW_TYPE, 1); //setting this to 7 gives a move pratfall, give recovery moves pratfall
set_window_value(AT_USPECIAL, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, 0);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, -5);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_SFX_FRAME, 8);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_SFX, asset_get("sfx_ori_stomp_spin"));

//drop
set_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE, 8); //setting this to 7 gives a move pratfall, give recovery moves pratfall
set_window_value(AT_USPECIAL, 4, AG_WINDOW_LENGTH, 999);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 10);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_VSPEED, 20);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USPECIAL, 4, AG_WINDOW_CUSTOM_AIR_FRICTION, 0);

//land
set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 1); //setting this to 7 gives a move pratfall, give recovery moves pratfall
set_window_value(AT_USPECIAL, 5, AG_WINDOW_LENGTH, 24);
set_window_value(AT_USPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_USPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(AT_USPECIAL, 5, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USPECIAL, 5, AG_WINDOW_SFX, asset_get("sfx_kragg_rock_pillar"));

//getup
set_window_value(AT_USPECIAL, 6, AG_WINDOW_TYPE, 1);
set_window_value(AT_USPECIAL, 6, AG_WINDOW_LENGTH, 16);
set_window_value(AT_USPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 15);

set_num_hitboxes(AT_USPECIAL, 4);

/* 
set_hitbox_value(AT_USPECIAL, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USPECIAL, 1, HG_WINDOW, 2);
set_hitbox_value(AT_USPECIAL, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_Y, -30);
set_hitbox_value(AT_USPECIAL, 1, HG_WIDTH, 72);
set_hitbox_value(AT_USPECIAL, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_USPECIAL, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_USPECIAL, 1, HG_DAMAGE, 4);
set_hitbox_value(AT_USPECIAL, 1, HG_ANGLE, 90);
set_hitbox_value(AT_USPECIAL, 1, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_USPECIAL, 1, HG_KNOCKBACK_SCALING, 0); 
set_hitbox_value(AT_USPECIAL, 1, HG_EFFECT, 6);
set_hitbox_value(AT_USPECIAL, 1, HG_BASE_HITPAUSE, 8); 
set_hitbox_value(AT_USPECIAL, 1, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_USPECIAL, 1, HG_HIT_SFX, sound_get("kirbstrong"));
set_hitbox_value(AT_USPECIAL, 1, HG_IGNORES_PROJECTILES, 1);

set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_USPECIAL, 2, HG_WINDOW, 3);
set_hitbox_value(AT_USPECIAL, 2, HG_LIFETIME, 5);
set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_X, 0);
set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_Y, -30);
set_hitbox_value(AT_USPECIAL, 2, HG_WIDTH, 72);
set_hitbox_value(AT_USPECIAL, 2, HG_HEIGHT, 72);
set_hitbox_value(AT_USPECIAL, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_USPECIAL, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_USPECIAL, 2, HG_ANGLE, 90);
set_hitbox_value(AT_USPECIAL, 2, HG_BASE_KNOCKBACK, 6); 
set_hitbox_value(AT_USPECIAL, 2, HG_KNOCKBACK_SCALING, 0); 
set_hitbox_value(AT_USPECIAL, 2, HG_EFFECT, 6);
set_hitbox_value(AT_USPECIAL, 2, HG_BASE_HITPAUSE, 10); 
set_hitbox_value(AT_USPECIAL, 2, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_USPECIAL, 2, HG_HIT_SFX, sound_get("kirbstrong2"));
set_hitbox_value(AT_USPECIAL, 2, HG_IGNORES_PROJECTILES, 1);

set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_USPECIAL, 3, HG_WINDOW, 4);
set_hitbox_value(AT_USPECIAL, 3, HG_LIFETIME, 999);
set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_X, 48);
set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_Y, -20);
set_hitbox_value(AT_USPECIAL, 3, HG_WIDTH, 64);
set_hitbox_value(AT_USPECIAL, 3, HG_HEIGHT, 64);
set_hitbox_value(AT_USPECIAL, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_USPECIAL, 3, HG_DAMAGE, 4);
set_hitbox_value(AT_USPECIAL, 3, HG_ANGLE, 300);
set_hitbox_value(AT_USPECIAL, 3, HG_BASE_KNOCKBACK, 6); 
set_hitbox_value(AT_USPECIAL, 3, HG_KNOCKBACK_SCALING, 0); 
set_hitbox_value(AT_USPECIAL, 3, HG_EFFECT, 6);
set_hitbox_value(AT_USPECIAL, 3, HG_BASE_HITPAUSE, 10); 
set_hitbox_value(AT_USPECIAL, 3, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_USPECIAL, 3, HG_HIT_SFX, sound_get("kirbstrong3"));
set_hitbox_value(AT_USPECIAL, 3, HG_IGNORES_PROJECTILES, 1);
*/

//base dash stomp
set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USPECIAL, 4, HG_WINDOW, 5);
set_hitbox_value(AT_USPECIAL, 4, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_USPECIAL, 4, HG_LIFETIME, 8);
set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_X, 0);
set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_Y, -20);
set_hitbox_value(AT_USPECIAL, 4, HG_WIDTH, 120);
set_hitbox_value(AT_USPECIAL, 4, HG_HEIGHT, 40);
set_hitbox_value(AT_USPECIAL, 4, HG_DAMAGE, 8);
set_hitbox_value(AT_USPECIAL, 4, HG_SHAPE, 1);
set_hitbox_value(AT_USPECIAL, 4, HG_ANGLE, 90);
set_hitbox_value(AT_USPECIAL, 4, HG_PRIORITY, 8);
set_hitbox_value(AT_USPECIAL, 4, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_USPECIAL, 4, HG_KNOCKBACK_SCALING, 0.5);
set_hitbox_value(AT_USPECIAL, 4, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_USPECIAL, 4, HG_HITPAUSE_SCALING, 1);
set_hitbox_value(AT_USPECIAL, 4, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USPECIAL, 4, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_GROUP, 2);