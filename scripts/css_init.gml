css_intro_timer = 0;
css_intro_state = 0;

//kill victory screen audio
for(var i = 1; i < 4; i++){
  sound_stop(sound_get("voice_defaultwin"+string(i)));
}

//kill specific win quotes
sound_stop(sound_get("voice_alexiswin"));
sound_stop(sound_get("voice_putrolcewin"));
sound_stop(sound_get("voice_sarolynwin"));
sound_stop(sound_get("voice_tomokowin"));
sound_stop(sound_get("voice_twennywin"));

// Voice mode button vars
if (get_synced_var(player) != clamp(get_synced_var(player), 0, 1)) set_synced_var(player, 0); 

ht_status = get_synced_var(player); // should be 0 or 1, regardless of how synced_var is handled

ht_w = 30;
ht_h = 26;

ht_x_default = 74;
ht_y_default = 178;
ht_x_cpu = 60;
ht_y_cpu = 178;
ht_x_online = 172;
ht_y_online = 36;

ht_x = ht_x_default;
ht_y = ht_y_default;

ht_col_online = get_player_color(0);
ht_hovered = false;


cpu_hover_init(); //put this anywhere above your #defines

//as always, #defines go at the bottom of the script.
#define cpu_hover_init()
cpu_hovering_player = -1; //the current player that's hovering the cpu. -1 for nobody
cpu_is_hovered = -1; //whether the cpu is hovered currently.
cpu_hover_time = 0; //the timer for the cpu hover indicator
cpu_color_swap_time = 0; //the timer for the cpu indicator's smooth color swap
cpuh_prev_color = c_gray;
cpuh_new_color = c_gray;

var c = [-4,-4,-4,-4,-4];
with (asset_get("cs_playercursor_obj")) { //this sets the cursor array
    c[get_instance_player(self)] = self;
}
cursors = c;

x = floor(x); //hehe
y = floor(y);
plate_bounds = [x,y,x+219,y+207]; //boundaries of the player plate
portrait_bounds = [x+10,y+10,x+210,y+151]; //boundaries of the player portrait. unused but useful
cpu_hover_sprite = sprite_get("cpu_controllingplayer_outline"); //the outline sprite.