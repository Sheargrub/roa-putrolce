//                      --APPLYING COLOR SHADE CHANGES--                      //

// online player is actually player 0, alt_fix communicates with the css, and changes the player based on that
var alt_cur = "alt_fix" in self ? get_player_color(alt_fix) : get_player_color(player);

// colormapping
if (alt_cur == 0) {
    set_character_color_slot(5, 57, 33, 47);
    set_character_color_slot(6, 236, 0, 79);
    set_character_color_slot(7, 139, 114, 154);
    set_article_color_slot(5, 57, 33, 47);
    set_article_color_slot(6, 236, 0, 79);
    set_article_color_slot(7, 139, 114, 154);
}

// Skip special alt behavior if indices are uninitialized
if ("alt_stanced" not in self) exit;

// Colorful stances
if (alt_cur == alt_stanced) {
    switch (stance){
        case 1:
            set_character_color_slot(0, 49, 19, 120);
            set_character_color_slot(4, 49, 19, 120);
            set_character_color_slot(6, 49, 19, 120);
            set_article_color_slot(0, 49, 19, 120);
            set_article_color_slot(4, 49, 19, 120);
            set_article_color_slot(6, 49, 19, 120);
        break;
        case 2:
            set_character_color_slot(0, 255, 50, 38);
            set_character_color_slot(4, 255, 50, 38);
            set_character_color_slot(6, 255, 50, 38);
            set_article_color_slot(0, 255, 50, 38);
            set_article_color_slot(4, 255, 50, 38);
            set_article_color_slot(6, 255, 50, 38);
        break;
        case 3:
            set_character_color_slot(0, 255, 218, 60);
            set_character_color_slot(4, 255, 218, 60);
            set_character_color_slot(6, 255, 218, 60);
            set_article_color_slot(0, 255, 218, 60);
            set_article_color_slot(4, 255, 218, 60);
            set_article_color_slot(6, 255, 218, 60);
        break;
        default:
        case 4:
            set_character_color_slot(0, 62, 190, 219);
            set_character_color_slot(4, 62, 190, 219);
            set_character_color_slot(6, 62, 190, 219);
            set_article_color_slot(0, 62, 190, 219);
            set_article_color_slot(4, 62, 190, 219);
            set_article_color_slot(6, 62, 190, 219);
        break;
        
    }
}

if (object_index == oPlayer || object_index == oTestPlayer) outline_color = stance_outlines[stance-1];