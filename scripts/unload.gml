
ds_list_destroy(afterimage_list);

//Sending win quotes to result screen <3 code by Frtoud
if (!putrolce_handled_victory_quote)
{
    //default values
    var transfer_array = [];
    for (var p = 1; p <= 4; p++)
    { 
        transfer_array[p] = 
        {
            order: 99999,             // placement in results. only known later
            team: get_player_team(p), // current team of player
            priority: 0,              // message priority (0 default, 1 builtin, 2 explicit)
            quote:"",                 // message if Hypercam wins against you
            icon: 0,                   // victory icon for putrolce
            //===========================================================================
            status_quote: ""         // message for this Hypercam if he wins under certain conditions
            //held_cd_color:-1          // Current color of CD for Hypercam
        }
    }
    
    with (oPlayer) if (player <= 4)
    {
        var data = transfer_array[player];
        if (url == other.url)
        {
            //only one putrolce has to handle this for everyone: notify them.
            putrolce_handled_victory_quote = true;
            
            data.priority = 2;
            data.icon = putrolce_victory_icon;
            data.quote = putrolce_victory_quote;
            //else... >:]
            
        }
        else if ("putrolce_victory_quote" in self)
        {
            var builtin_quote = try_get_quote(url);
            var builtin_icon = try_get_icon(url);
            data.icon = builtin_icon;
            if (string_length(builtin_quote) > 0)
            {
                data.priority = 1;
                data.quote = builtin_quote;
            }
            init_shader();
        }
        else
        {
            var builtin_icon = try_get_icon(url);
            data.icon = builtin_icon;

            
            var builtin_quote = try_get_quote(url);
            if (string_length(builtin_quote) > 0)
            {
                data.priority = 1;
                data.quote = builtin_quote;
            }
            
        }
            
        transfer_array[player] = data;
    }
    
    //Hackiest of hacks: smuggle into victory screen using a persistent hitbox!
    var smuggler = instance_create(0, 0, "pHitBox");
    smuggler.persistent = true; //survive room end
    smuggler.type = 2;
    smuggler.length = 60; //will destroy itself automatically after one second.
    
    smuggler.putrolce_victory_screen_array = transfer_array;
    //smuggler.uhc_batteries = uhc_batteries;
}
/*checklist
*/

//==============================================================
#define try_get_quote(char_url)
{
    //=========================================================
    // Approximate maximum line:
            //      "aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa";
    //=========================================================
    var quote = "";
    switch (char_url)
    {
        //ash characters
        case "3302238950": //Alexis
            quote = "A wizard engineer? What d'ya make? Robot brooms? Fireball guns? Well, that's just a gun."
            break; 
        case "3306584099": //Tomoko
            quote = "You could've saved yourself an ass-whooping if you'd just left me alone."
            break; 
        case "3307368173": //Sarolyn
            quote = "You could've saved yourself an ass-whooping if you'd just left me alone."
            break; 
        case "3307937190": //Pastelle
            quote = "Hey, mind lending me that pen? Because I could really use a drink right now!"
            break; 
        case "3308351120": //Saelune
        case "3115049167": //Saelukune (legacy)
            quote = "I gotta admit, you creeped me out at first. And you still do. But you're also pretty nice!"
            break; 
        //case "": //Usher
        //    quote = "Oh, what I would give to dance in the rain again without smelling of burning petrichor."
        //    break; 
        //case "": //Ciela
        //    quote = ""
        //    break; 
        //case "": //Lumi
        //    quote = "Thank God I'm wearing my big jacket. We can go ice skating now!"
        //    break; 
        
        //case "": //Asra
        //    quote = ""
        //    break; 
        //case "": //Venus
        //    quote = ""
        //    break; 
           
        //reapers
        case "2871608790": //Azi
            quote = "Hey kid, join me next hunt if your backpack really is that hungry!"
            break;
        case "2977835488": //Qoedil
            quote = "Salvbub, what was that about a great horror? I just saw a 5-star banquet."
            break;
        case "2965700442": // Humanthem
            quote = "If I could skewer things like that, I'd go get me some Jig-Apart kebabs!";
            break;
        case "3079776883": //Kumaki
            quote = "I've never thought much about Figment blood. I bet Rabbithole Morcela would be exquisite!"
            break;
        
        //misc
        case "2605377553": //Mal
            quote = "Oi! Stop trying to steal my flow! Go get your own fashion sense!"
            break;
        case "3136330641": //Vakna
            quote = "No, I’m -not- giving you a slice of this pizza!!!"
            break;
        case "2778789055": // Po Gumbo 
            quote = "What's a Louisiana? Is that a type of Figment? Yum!"
            break;

        default: break;
    }

return quote

}

#define try_get_icon(char_url)
{

    var icon = 0;
    switch(char_url)
    {
        //happy friendly
        case "3307937190": //Pastelle
        case "3308351120": //Saelune
        case "3115049167": //Saelukune (legacy)
        case "2871608790": //Azi
        case "2965700442": // Humanthem
        case "3079776883": //Kumaki
            icon = 0;
            break;
            
        //confident snarky
        //case "2977835488": //Qoedil
            icon = 1;
            break;
        
        //angry
        case "3307368173": //Sarolyn
        case "3306584099": //Tomoko
        case "2605377553": //Mal
        case "3136330641": //Vakna
            icon = 2;
            break;
        
        
        //sad
        //case "": //Usher
        //    icon = 3;
        //    break;
        
        //confused
        case "3302238950": //Alexis
        case "2778789055": // Po Gumbo 
        case "2977835488": //Qoedil
            icon = 4;
            break;
        
        default: break;
    }
return icon
}