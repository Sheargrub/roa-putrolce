
set_ui_element(UI_HUD_ICON, sprite_get("hud_icon")); // the game doesn't reset this automatically
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
            voiceline: noone,
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
            data.voiceline = putrolce_victory_voiceline;
            
        }
        else if ("putrolce_victory_quote" in self)
        {
            print_debug("overriding");
            data.icon = putrolce_victory_icon;
            data.quote = putrolce_victory_quote;
            data.voiceline = ("putrolce_victory_voiceline" in self) ? putrolce_victory_voiceline : noone;
            init_shader();
        }
        else
        {
            var builtin_icon = try_get_icon(url);
            data.icon = builtin_icon;
            
            with (other) var builtin_quote = try_get_quote(other.url); // Scope trickery is for the sake of sfx
            if (string_length(builtin_quote[0]) > 0)
            {
                data.priority = 1;
                data.quote = builtin_quote[0];
                data.voiceline = builtin_quote[1];
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
    smuggler.is_voiced = is_voiced;
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
    var voiceline = noone;
    switch (char_url)
    {
        //ash characters
        case "3302238950": //Alexis
            quote = "I can't say I’m a big fan of sci-fi or fantasy. But that magic hoverboard does look cool."
            voiceline = sound_get("voice_alexiswin");
            break; 
        case "3306584099": //Tomoko
            quote = "You should've known better than to chase me if you didn't want to get your ass kicked!"
            voiceline = sound_get("voice_tomokowin");
            break; 
        case "3307368173": //Sarolyn
            quote = "Don't call me pathetic.. You don't know the hell I've been through to be here!"
            voiceline = sound_get("voice_sarolynwin");
            break; 
        case "3307937190": //Pastelle
            quote = "Hey, mind lending me that pen? Because I could really use a drink right now!"
            break; 
        case "3308351120": //Saelune
        case "3115049167": //Saelukune (legacy)
            quote = "I gotta admit, you creeped me out at first. And you still do. But you're also pretty nice!"
            break;
        case "3310371100": //Usher
            quote = "...I wish I was as carefree... dancing in the rain without smelling like sulfur..."
            break; 
        case "3382637663": //Ciela
            quote = "Fighting from high up won't help you! Don't you know one stone can kill two birds?"
            break; 
        case "3316054693": //Asra
            quote = "Do not sneak up on me again, or I swear I'll stab YOUR back for real!"
            break; 
        case "3316053085": //Venus
            quote = "I didn't know angels could look so... modern?"
            break; 
           
        //reapers
        case "2871608790": //Azi
            quote = "Hey kid, join me next hunt if your backpack's really that hungry!"
            break;
        case "2977835488": //Qoedil
            quote = "Salvbub, what was that about a great horror? I just saw a 5-star banquet."
            break;
        case "2965700442": //Humanthem
            quote = "If I could skewer things like that, I'd go get me some Jig-Apart kebabs!";
            break;
        case "3079776883": //Kumaki
            quote = "I've never thought much about Figment blood. I bet Rabbithole Morcela would be exquisite!"
            break;
        
        //misc
        case "2605377553": // Mal
            var starbucks_event_chance = random_func_2(7, 9, true)
            if (starbucks_event_chance != 0) quote = "... What are you looking at, huh? Get your own fashion sense!"
            else quote = "And this is why you're banned from Starbucks."
            print_debug(starbucks_event_chance)
            break;
        case "3136330641": // Vakna
            quote = "No, I’m -not- giving you a slice of this pizza!!!"
            break;
        case "2778789055": // Po Gumbo 
            quote = "What's a Louisiana? Is that a type of Figment? Yum!"
            break;
        case "2802914735": // Ayaka
            quote = "Have I seen your face before? Oh! You're one of those “Two-whos”, right?"; 
            break;
        case "2885762133": // Brook
            quote = "Huh? What do you mean I gotta pay!? I didn't even get a drink with this!";
            break;
        case "1917856427": // Liz
        case "1917856427": // Liz
        case "2108895293": // Lumina
        case "2064167290": // Hana
            quote = "What's a kid like you doing here? You should be back home, eating candy and watching cartoons!"
            break;
        case "2917082599": // Madeline
            quote = "'Part of you'?! I don't even know who you are!!"
            break;
        case "3482233882": // Commando
            quote = "If you're not gonna eat those weird mushrooms, at least let me take one, you hoarder!"
            break;
        case "3353256940": // Twenny
            quote = "I'm sorry, but I'm not interested in being a janitor! Though the location would be an improvement..."
            voiceline = sound_get("voice_twennywin");
            break;

        //riptide
        case "3139930266": //Amanita
            quote = "Toasted, roasted, stewed, charred, sliced… I can imagine a million ways to prepare your little minions!"
            break;
        case "2593144115": //Amaya
            quote = "What’s that, Salvbub? No, absolutely not! We can’t eat that snake, she’s also a person!"
            break;
        case "1882960192": //Bluey
            quote = "¡No manches! Otro latinoamericano? ¡Qué chido! Vengo de México, y tú?"
            break;
        case "3120902361": //Desperado
            quote = "What kind of animal were you? I hope you weren’t a Taxawolf, because that would be awkward."
            break;
        case "3292951946": //Hex
            quote = "These Figments are just getting weirder and weirder. What the hell are you even supposed to be?"
            break;
        case "2817605804": //Jerma986
            quote = "Jesucristo… Thank god we got out of there alive. I’ve never fought something so terrifying!"
            break;
        case "3109768585": //Koishi
            quote = "Huh??? What just happened? Did I fight a ghost? Was that a figment? I really oughta take it easy…"
            break;
        case "3137450762": //La Reina
            quote = "¡No mames, es el R*y Mist*rio!"
            break;
        case "2871136791": //Lode and Puul
            quote = "Geez, you’re really heavy! Salvbub could use a few tricks of yours to move around."
            break;
        case "2546990424": //Maverick
            quote = "It’s a big monkey! Wow! Incredible!"
            break;
        case "2229832619": //N-A
            quote = "I can’t even tell if you’re a Figment or not. Still, you look pretty appetizing, heh."
            break;
        case "3070186949": //Napstablook
            quote = "You sure you’re up to fight? Because I’m not. We can just chill together instead."
            break;
        case "2456124960": //Nate
            quote = "You remind me of this wizard girl I worked with. Can you also make gadgets by any chance?"
            break;
        case "2904134945": //Noelle
            quote = "The hell do you mean I remind you of another mean girl? I'm not trying to be mean!"
            break;
        case "2802424939": //Sakuya
            quote = "That’s an awful amount of knives for a maid to carry. You don't mind if I take some, right?"
            break;
        case "2940069199": //Suisei
            quote = "Geez, I didn’t think a newscaster anchor would be so good at fighting, let alone be a pro gamer."
            break;
        case "1996010699": //Suitcase
            quote = "Someone lost their luggage. I’m sure they won’t mind if I take a peek inside, and take some things."
            break;
        case "2997493298": //Truck-kun
            quote = "A runaway truck!? There’s nothing driving it! Is it another Figment?! What does it taste like!?"
            break;
        case "3294183869": //Vale
            quote = "Why would you give up on such a perfect opportunity? Oh well, at least I can reap the fame!"
            break;
        case "2811386719": //Wally
            quote = "You look like you’d give the biggest hugs. And you sure give some dangerous hugs."
            break;
        case "3118659566": //Yono
            quote = "Hey, I got an important letter to send to… If you can find this person, deliver it to him, ok?"
            break;
        case "2811822410": //Hatsune Miku
            quote = "*nom* ...thish leek ish a little... digital, ya know? *om nom*"
            break;
        case "3512110671": //Kasane Teto
            quote = "*om nom* ..shorry, but that baguette looked sho good! *nom*"
            break;
        case "3258475151": //Case Oh
            quote = "Dios... I never thought I would ever meet someone who eats more than me."
            break; 
        default: break;
    }

return [quote, voiceline];

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
        case "3079776883": //Kumaki
        case "3139930266": //Amanita
        case "1882960192": //Bluey
        case "3137450762": //La Reina
        case "3512110671": //Kasane Teto
            icon = 0;
            break;
            
        //confident snarky
        case "1996010699": //Suitcase
        case "3294183869": //Vale
        case "3382637663": //Ciela
            icon = 1;
            break;
        
        //angry
        case "2885762133": //Brook
        case "3307368173": //Sarolyn
        case "3306584099": //Tomoko
        case "2605377553": //Mal
        case "3136330641": //Vakna
        case "2917082599": //Madeline
        case "2593144115": //Amaya
        case "2871136791": //Lode and Puul
        case "3316054693": //Asra
        case "3482233882": // Commando
            icon = 2;
            break;
        
        
        //sad
        case "3310371100": //Usher
        case "3120902361": //Desperado
        case "2817605804": //Jerma986
        case "3118659566": //Yono
        case "2904134945": //Noelle
        case "3258475151": //CaseOh
            icon = 3;
            break;
        
        //confused
        case "3302238950": //Alexis
        case "2778789055": //Po Gumbo 
        case "2977835488": //Qoedil
        case "2802914735": //Ayaka
        case "3292951946": //Hex
        case "3109768585": //Koishi
        case "2802424939": //Sakuya
        case "2997493298": //Truck-kun
        case "3316053085": //Venus
        case "2811822410": //Hatsune Miku
            icon = 4;
            break;
            
        //normal
        case "2965700442": // Humanthem
        case "1917856427": //Liz
        case "2108895293": //Lumina
        case "2064167290": //Hana
        case "2546990424": //Maverick
        case "2229832619": //N-A
        case "3070186949": //Napstablook
        case "2456124960": //Nate
        case "2940069199": //Suisei
        case "2811386719": //Wally
            icon = 5;
            break;
        
        default: break;
    }
return icon
}