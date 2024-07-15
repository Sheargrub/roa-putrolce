//                      --APPLYING COLOR SHADE CHANGES--                      //
//colormapping
if (get_player_color(player) == 0)
{
    set_character_color_slot( 6, 57, 33, 47 );
    set_character_color_slot(7, 236, 0, 79 );
}
/* // WIP
if "num_base_colors" in self {
for (var i=0; i < num_base_colors; i++) {
    set_character_color_shading(i, col_shade_list[get_player_color(player)][i]);
}
}
*/
