//              --character sprite offsets (has small_sprites)--              //
sprite_change_offset("idle"                 , 48, 63);
sprite_change_offset("idle_overstuffed"     , 30, 47);
sprite_change_offset("idle_voracious"       , 30, 47);
sprite_change_offset("idle_famished"        , 30, 47);
sprite_change_offset("idle_flourish"        , 48, 63);
sprite_change_offset("hurt"                 , 48, 63);
sprite_change_offset("crouch"               , 48, 63);
sprite_change_offset("walk"                 , 48, 63);
sprite_change_offset("walkturn"             , 48, 63);
sprite_change_offset("dash"                 , 48, 63);
sprite_change_offset("dashstart"            , 48, 63);
sprite_change_offset("dashstop"             , 48, 63);
sprite_change_offset("dashturn"             , 48, 63);
sprite_change_offset("moonwalk"             , 48, 63);
sprite_change_offset("uphurt"               , 48, 63);
sprite_change_offset("bighurt"              , 48, 63);
sprite_change_offset("downhurt"             , 48, 63);
sprite_change_offset("spinhurt"             , 48, 63);
sprite_change_offset("hurtground"           , 48, 63);

sprite_change_offset("jumpstart"            , 48, 63);
sprite_change_offset("jump"                 , 48, 63);
sprite_change_offset("jumploop"             , 48, 63);
sprite_change_offset("platfall"             , 32, 47);
sprite_change_offset("doublejump"           , 48, 63);
sprite_change_offset("walljump"             , 48, 63);
sprite_change_offset("pratfall"             , 48, 63);
sprite_change_offset("land"                 , 48, 63);
sprite_change_offset("landinglag"           , 48, 63);

sprite_change_offset("parry"                , 48, 63);
sprite_change_offset("roll_forward"         , 48, 63);
sprite_change_offset("roll_backward"        , 48, 63);
sprite_change_offset("airdodge"             , 48, 63);
sprite_change_offset("waveland"             , 48, 63);
sprite_change_offset("tech"                 , 48, 63);

sprite_change_offset("jab"                  , 62, 81, true);
sprite_change_offset("dattack"              , 64, 79, true);
sprite_change_offset("ftilt"                , 64, 79, true);
sprite_change_offset("ftilt_rock"           , 22, 22);
sprite_change_offset("dtilt"                , 64, 79, true);
sprite_change_offset("utilt"                , 48, 63, true);
sprite_change_offset("nair"                 , 48, 63, true);
sprite_change_offset("fair"                 , 48, 63, true);
sprite_change_offset("bair"                 , 67, 79, true);
sprite_change_offset("uair"                 , 64, 79, true);
sprite_change_offset("dair"                 , 48, 63, true);
sprite_change_offset("fstrong"              , 61, 82, true);
sprite_change_offset("ustrong"              , 64, 79, true);
sprite_change_offset("dstrong"              , 64, 79, true);
sprite_change_offset("nspecial"             , 64, 79, true);
sprite_change_offset("fspecial"             , 64, 81, true);
sprite_change_offset("fspecial_fx"          , 64, 81, true);
sprite_change_offset("fspecial_fx_famished" , 64, 81, true);
sprite_change_offset("fspecial_fx_voracious", 64, 81, true);
sprite_change_offset("fspecial_fx_overstuffed", 64, 81, true);
sprite_change_offset("uspecial"             , 48, 63, true);
sprite_change_offset("uspecial_grab"        , 48, 63, true);
sprite_change_offset("dspecial"             , 64, 79, true);
sprite_change_offset("taunt"                , 48, 63, true);

sprite_change_offset("plat"                 , 64, 83);

set_victory_theme( sound_get ("putrolce_victory"));
set_victory_bg( sprite_get( "victory_putrolce" ));

//                  --other sprite offsets (no small_sprites)--               //
// includes projectiles, vfx, articles

sprite_change_offset("hfx_rock_small_bg", 64, 64);
sprite_change_offset("hfx_rock_large", 128, 128);
sprite_change_offset("hfx_bite", 128, 128);
sprite_change_offset("fx_ashe_trail", 9, 9);

sprite_change_offset("slp_rock", 76, 54); // main sprites
sprite_change_offset("slp_rock_to_wave", 76, 54);
sprite_change_offset("slp_wave", 76, 54);
sprite_change_offset("slp_wave_to_homing", 76, 54);
sprite_change_offset("slp_homing", 76, 54);
sprite_change_offset("slp_idle_passive", 76, 54);

sprite_change_offset("slp_mask", 20, 20); // sleeper collision
sprite_change_offset("slp_tracker_mask_1", 0, 60);
sprite_change_offset("slp_tracker_mask_-1", 240, 60);

sprite_change_offset("slp_phase", 76, 54); // vfx
sprite_change_offset("slp_destroyed", 76, 54);
sprite_change_offset("slp_homing_death", 76, 54);
sprite_change_offset("slp_sleepingvfx_temp", 12, 14);

sprite_change_offset("petrify_rocks", 11, 10);

sprite_change_offset("taunt_skull", 32, 32);

sprite_change_offset("mami_transformation", 32, 48); // compat