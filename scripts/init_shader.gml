//                      --APPLYING COLOR SHADE CHANGES--                      //

//online player is actually player 0, alt_fix communicates with the css, and changes the player based on that
var alt_cur = "alt_fix" in self ? get_player_color(alt_fix) : get_player_color(player);

//colormapping
if (alt_cur == 0) {
    set_character_color_slot(5, 57, 33, 47);
    set_character_color_slot(6, 236, 0, 79);
    set_character_color_slot(7, 139, 114, 154);
    set_article_color_slot(5, 57, 33, 47);
    set_article_color_slot(6, 236, 0, 79);
    set_article_color_slot(7, 139, 114, 154);
}

if (object_index == oPlayer || object_index == oTestPlayer) outline_color = stance_outlines[stance-1];