
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
            quote = "Never thought I'd see another girl with purple skin. I liked her style, though!"
            break; 
        case "3307937190": //Pastelle
            quote = "Hey, mind lending me that pen? Because I could really use a drink right now!"
            break; 
        case "3308351120": //Saelune
        case "3115049167": //Saelukune (legacy)
            quote = "I gotta admit, you creeped me out at first. And you still do. But you're also pretty nice!"
            break;
        case "3310371100": //Usher
            quote = "Oh, what I would give to dance in the rain again without smelling of burning petrichor."
            break; 
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
        //    quote = "Such graceful movements… Say, you wouldn't mind joining me for a dance, right?"
        //    break; 
           
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
            if (starbucks_event_chance != 0) quote = "Oi! Stop trying to steal my flow! Go get your own fashion sense!"
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
            quote = "I don't remember ordering a pizza- But I'm definitely not saying no to free food!";
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
        //case "": // Commando
        //    quote = "If you're not gonna eat those weird mushrooms, at least let me take one, you hoarder!"
        
        //riptide
        case "3139930266": //Amanita
            quote = "Toasted, roasted, stewed, charred, sliced… I can imagine a million ways to prepare your little minions!"
            break;
        case "2593144115": //Amaya
            quote = "What’s that, Salvbub? No, absolutely not! We can’t eat that snake, she’s also a person!"
            break;
        case "3139869895": //Arcuin
            quote = "I can sense some unusual darkness in your ice.. This means I can make Figment-flavored shaved ice!"
            break;
        case "3118680316": //Awatsu
            quote = "Aww! You’re so adorable! Now I feel bad about beating you up.. I’m sorry!"
            break;
        case "2490060793": //Barr
            quote = "So.. what’s up with the magnet? Oh it’s not a magnet? It’s your power meter? Huh… Unorthodox…"
            break;
        case "3117219382": //Bhadra
            quote = "For how much I was expecting to fight a wandering samurai, it sure took this long to happen."
            break;
        case "1882960192": //Bluey
            quote = "¡No manches! Otro latinoamericano? ¡Qué chido! Vengo de México, y tú?"
            break;
        case "2605304929": //Daora
            quote = "Keep your big, electric claws off-a me, lady. I’m not afraid to leave some awful scratch and bite marks!"
            break;
        case "3120902361": //Desperado
            quote = "What kind of animal were you? I hope you weren’t a Taxawolf, because that would be awkward."
            break;
        case "2606508459": //Fernet
            quote = "Ayayay, you sure don’t give up, do you? I could really use your enthusiasm."
            break;
        case "2652644223": //Future Ducky
            quote = "Is everyone a talking animal in the future? It doesn’t seem much different from right now, then."
            break;
        case "2605468032": //Gawr Gura
            quote = "Who the heck is this sassy talking shark girl? And what’s a “vee toobir”?"
            break;
        case "3119664631": //Helios
            quote = "I’m not at the age where I can drink alcohol. Do you serve soft drinks too?"
            break;
        case "3292951946": //Hex
            quote = "These Figments are just getting weirder and weirder. I can’t even tell what you’re supposed to be."
            break;
        case "2817605804": //Jerma986
            quote = "Jesucristo… Thank god we got out of there alive. I’ve never fought something so terrifying!"
            break;
        case "2983344228": //Kiku
            quote = "Why do you smell like baked apples after that fight? Meanwhile I have to settle with monster blood and guts.."
            break;
        case "3109768585": //Koishi
            quote = "Huh??? What just happened? Did I fight a ghost? Was that a figment? I really oughta take it easy…"
            break;
        case "3137450762": //La Reina
            quote = "Woah.. I didn’t know wrestling was real! I thought every wrestler persona was made up!"
            break;
        case "2871136791": //Lode and Puul
            quote = "Geez, you’re really heavy! Salvbub could use a few tricks of yours to move around."
            break;
        case "2108895293": //Lumina
            quote = "Where did you learn to say such solemn things? Aren’t you seven like years old?"
            break;
        case "3311683657": //Luna
            quote = "Your bubbles taste like explosive purple. What does purple taste like? That’s a secret!"
            break;
        case "2167624888": //Lyca
            quote = "Leave my Sleepers alone! They’re not shooting practice! They’re my lunch!"
            break;
        case "2546990424": //Maverick
            quote = "It’s a big monkey! Wow! Incredible!"
            break;
        case "2229832619": //N-A
            quote = "At this point I can’t tell if you’re a Figment or part of something else. I must take a bite to confirm this."
            break;
        case "3284331017": //Nacht
            quote = "That’s a space animal from the future! I wonder how I would look like in the future."
            break;
        case "2035357584": //Nade
            quote = "I didn’t know there was a war going on! Why are you fighting me!? I’m not the enemy!"
            break;
        case "3070186949": //Napstablook
            quote = "You sure you’re up to fight? Because I’m not. We can just chill together instead."
            break;
        case "2456124960": //Nate
            quote = "You remind me of this wizard girl I worked with. Can you also make gadgets by any chance?"
            break;
        case "2904134945": //Noelle
            quote = "Please stop making the air colder! Or else I’m gonna give you a frostbite!"
            break;
        case "2005036466": //Penny
            quote = "Another future fighter!? How many time rifts are open around here!?"
            break;
        case "2904498757": //Peppino
            quote = "Ooh, a tower of pizza? Wait, that’s just Italy."
            break;
        case "2820380997": //Roekoko
            quote = "I’m seein’ double here! Four foxes!"
            break;
        case "2561479115": //Rokesha
            quote = "Hey, how many rations do you have? I’ve always wanted to try ration food!"
            break;
        case "2241098230": //Rykenburn
            quote = "I hate this guy. No reason in particular, he looks like a b- Oh, we can’t say that."
            break;
        case "2802424939": //Sakuya
            quote = "That’s an awful amount of knives for a maid to carry. You don’t suppose I can take some with me?"
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
        case "1917713379": //Valkyrie
            quote = "What kind of spirits can you summon with your totems? Ooh, can you summon a guiding spirit?"
            break;
        case "2811386719": //Wally
            quote = "You look like you’d give the biggest hugs. And you sure give some dangerous hugs."
            break;
        case "3118007135": //Wren
            quote = "No lady, the coat ain’t coming off for any reason, not even in this heat!"
            break;
        case "3118659566": //Yono
            quote = "Hey, I got an important letter to send to… If you can find this person, deliver it to him, ok?"
            break;
        //    break; 
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
        case "3079776883": //Kumaki
        case "3307368173": //Sarolyn
        case "2885762133": // Brook
        case "3139930266": //Amanita
        case "3139869895": //Arcuin
        case "1882960192": //Bluey
        case "2561479115": //Rokesha
            icon = 0;
            break;
            
        //confident snarky
        case "3311683657": //Luna
        case "1996010699": //Suitcase
        case "3294183869": //Vale
            icon = 1;
            break;
        
        //angry
        case "3306584099": //Tomoko
        case "2605377553": //Mal
        case "3136330641": //Vakna
        case "2917082599": //Madeline
        case "2593144115": //Amaya
        case "2605304929": //Daora
        case "2983344228": //Kiku
        case "2871136791": //Lode and Puul
        case "2167624888": //Lyca
        case "2035357584": //Nade
        case "2904134945": //Noelle
        case "2005036466": //Penny
        case "3118007135": //Wren
            icon = 2;
            break;
        
        
        //sad
        case "3310371100": //Usher
        case "3118680316": //Awatsu
        case "3120902361": //Desperado
        case "2817605804": //Jerma986
        case "2108895293": //Lumina
        case "2241098230": //Rykenburn
        case "3118659566": //Yono
            icon = 3;
            break;
        
        //confused
        case "3302238950": //Alexis
        case "2778789055": // Po Gumbo 
        case "2977835488": //Qoedil
        case "2802914735": // Ayaka
        case "2490060793": //Barr
        case "2652644223": //Future Ducky
        case "2605468032": //Gawr Gura
        case "3292951946": //Hex
        case "3109768585": //Koishi
        case "3284331017": //Nacht
        case "2820380997": //Roekoko
        case "2802424939": //Sakuya
        case "2997493298": //Truck-kun
            icon = 4;
            break;
            
        //normal
        case "2965700442": // Humanthem
        case "1917856427": // Liz
        case "1917856427": // Liz
        case "2108895293": //Lumina
        case "2064167290": //Hana
        case "3117219382": //Bhadra
        case "2606508459": //Fernet
        case "3119664631": //Helios
        case "3137450762": //La Reina
        case "2546990424": //Maverick
        case "2229832619": //N-A
        case "3070186949": //Napstablook
        case "2456124960": //Nate
        case "2904498757": //Peppino
        case "2940069199": //Suisei
        case "1917713379": //Valkyrie
        case "2811386719": //Wally
            icon = 5;
            break;
        
        default: break;
    }
return icon
}