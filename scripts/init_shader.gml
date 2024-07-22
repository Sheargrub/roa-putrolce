//                      --APPLYING COLOR SHADE CHANGES--                      //
//colormapping
if (get_player_color(player) == 0) {
    set_character_color_slot(6, 57, 33, 47);
    set_character_color_slot(7, 236, 0, 79);
    set_article_color_slot(6, 57, 33, 47);
    set_article_color_slot(7, 236, 0, 79);
}

//transparency forcing
/*
if ("forcing_transparency" not in self) forcing_transparency = false;
else if (forcing_transparency) {
    set_color_profile_slot_range( 7, 255, 255, 255 );
    set_article_color_slot( 7, 0, 0, 0, 0 );
    set_character_color_slot( 7, 0, 0, 0, 0 );
}
else {
    set_color_profile_slot_range( 7, 2, 1, 27 ); // identical to colors.gml
}*/