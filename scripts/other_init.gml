
// Status effect info (used for dspec abyss rune)
putrolce_status_owner = 0;
putrolce_status_timer = 0;

// If compat is in effect, or if rock positions were already initialized, exit.
if "putrolce_petrify_spr" in self exit;
if "putrolce_rocks_x" in self exit;

// Initialize rock positions for petrified state.
// Note that these can be custom-set as an alternate compat approach.
putrolce_seed = (url == "" ? 0 : real(url)) % 200; // other_init is weirdly unsafe, so this may throw a harmless error

var spr = hitstun_hurtbox_spr; // good proxy for char size in hitstun
if (hitstun_hurtbox_spr == -1) spr = hurtbox_spr;
var spread_x = (sprite_get_bbox_right(spr) - sprite_get_bbox_left(spr))*0.6;
var spread_y = (sprite_get_bbox_bottom(spr) - sprite_get_bbox_top(spr))*0.6;

// If either of the above is zero, the opponent's probably doing something
// strange, but char_height will work as a passable backup.
if (spread_x == 0 || spread_y == 0) {
    spread_x = char_height*0.6;
    spread_y = char_height*0.6;
}

putrolce_rocks_x = [];
putrolce_rocks_y = [];
putrolce_rocks_rot = [];
putrolce_rocks_type = [0, 0, 0, 0, 0];
putrolce_rocks_y_offset = floor(spread_y * (5/6) / 2) * 2;

// Randomly choose two rocks to use the larger sprite.
var lrock = mass_random_func(5, true);
putrolce_rocks_type[lrock] = 1;
lrock = (lrock + 1 + mass_random_func(4, true)) % 5;
putrolce_rocks_type[lrock] = 1;

// Randomly select positions and rotations.
for (var i = 0; i < 5; i++) {
    var angle = mass_random_func(100, false) - 50 + (72*i);
    
    // Processing the positions in this way keeps the rocks from being mixeled relative to the sprite.
    array_push(putrolce_rocks_x, round(lengthdir_x(spread_x, angle)/2)*2);
    array_push(putrolce_rocks_y, round(lengthdir_y(spread_y, angle)/2)*2);
    
    array_push(putrolce_rocks_rot, 90*mass_random_func(4, true));
}


#define mass_random_func(high_value, floored)
    putrolce_seed = (putrolce_seed + 7) % 200;
    return random_func_2(putrolce_seed, high_value, floored);