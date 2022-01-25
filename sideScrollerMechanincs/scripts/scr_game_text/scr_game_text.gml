// @param text_id
function scr_game_text(_text_id){

switch(_text_id) {

//-----------database of npc dialogue-----------//
///////////////////////////////////////////////////////////////////////////////////////////////////////
	case "npc_1":
		scr_text("Oh, hello.", "player");
		scr_text("Hi! Hello there! ", "npc_1_talk", -1);
			scr_text_float(0,3); scr_text_color(0,3, c_aqua,c_aqua,c_aqua,c_aqua);
		scr_text("Will you be my friend?", "npc_1_talk", -1);
			scr_text_float(15,22); scr_text_color(15,22, c_aqua,c_aqua,c_aqua,c_aqua);
			scr_option("Ok!", "npc_1 - okay")
			scr_option("No.", "npc_1 - sad")
		break;
		case "npc_1 - okay":
			scr_text("Umm.. Sure?", "player");
			scr_text_float(6,11);
			scr_text("Yay! I have a friend now!", "npc_1_talk", -1);
			scr_text_float(14,20); scr_text_color(14,20, c_aqua,c_aqua,c_aqua,c_aqua);
			break;
		case "npc_1 - sad":
			scr_text("No! Ew. Go Away!", "player");
				scr_text_color(3, 15, c_red, c_red, c_red, c_red); scr_text_shake(3,15);
			scr_text("Oh umm...", "npc_1_sad", -1);
			scr_text_shake(0,9);
			scr_text("Ok then...", "npc_1_sad", -1);
			scr_text_shake(0,10);
			break;
///////////////////////////////////////////////////////////////////////////////////////////////////////
	case "ethel":
		scr_text("Hey you! Yes you! Why are you on my roof!? Don't you know that this is MY ROOF?!?!");
		scr_text_shake(0,82);
		scr_text("I hate people walking on my roof! It's noisy and incredibly bad for my roof!");
		global.darveyStage = "darveyStage1";
			scr_option("[Apologize]","ethel - 1a");
			scr_option("Tone it down!","ethel - 1b");
			scr_option("I was thrown down here!","ethel - 1c");
		break;
		case "ethel - 1a":
			scr_text("Yes that is right! You should be apologizing! Now tell me what you were doing on my roof!");
				scr_option("Tone it down!","ethel - 1b");
				scr_option("I was thrown down here!","ethel - 1c");
			break;
		case "ethel - 1b":
			scr_text("You're tell me to tone it DOWN? You're telling ME?!?!");
			scr_text("[The woman seems to be getting more aggressive]");
				scr_option("[Apologize]","ethel - 1aa");
				scr_option("[Draw your weapon]","ethel - fight");
			break;
		case "ethel - fight":
			instance_destroy(obj_textbox);
			//FIGHT
			global.ethelFight = true;
			global.inDialogue = false;
			break;
		case "ethel - 1aa":
			scr_text("Yes that is right! You should be apologizing! Now tell me what you were doing on my roof!");
				scr_option("I was thrown down here!","ethel - 1c");
			break;
		case "ethel - 1c":
			scr_text("Oh! My grandson lives there! How is he doing? Is he well? He never writes back to me these days...");
				scr_option("[Lie] He's dead...", "ethel - 2a");
				scr_option("What is a grandson?", "ethel - 2b");
				scr_option("[Lie] He's doing fine", "ethel - 2c");
			break;
		case "ethel - 2a":
			scr_text("NO!! He's still alive. You're a LIAR! You know what we do to liars here?!");
				scr_option("[Draw your weapon]","ethel - fight");
			break;
		case "ethel - 2b":
			scr_text("You don't know what a grandson is? Where are you from?");
				scr_option("I'm from space!", "ethel - 3a");
			break;
		case "ethel - 2c":
			scr_text("WOW? Really?! I'm happy to hear my dear boy is well. You're such a sweetie");
			scr_text("[Ethel goes on and on about how great her grandson is]");
			scr_text("Hey, could you do me a favor real quick?");				
				scr_option("Sure?", "ethel - 3b");
				scr_option("No", "ethel - 3c");
			break;
		case "ethel - 3a":
			scr_text("Oh you're one of them crazies. Well... at least you're not a thug.");
			scr_text("Hey, could you do me a favor real quick?");				
				scr_option("Sure?", "ethel - 3b");
				scr_option("No", "ethel - 3c");
			break;
		case "ethel - 3b":
			scr_text("Darvey dropped his gamebro while running away when I scolded him for being on my roof!");
			scr_text("He's a good for nothing swine! But... I know he cares for it deeply. Mind brining it to him?");
				scr_option("I'll be glad to", "ethel - 4a");
				scr_option("No", "ethel - 3b");
			break;
		case "ethel - 3c":
			scr_text("Bah. Okay, okay. Just don't go on my roof ever again!");
			instance_destroy(obj_trapdoor);
			global.ethelFin = true;
			global.inDialogue = false;
			break;
		case "ethel - 4a":
			scr_text("Thanks sweetie, here");
			scr_text("[Ethel gives you a gamebro]");
			scr_text("Thanks sweeite, you have a good day now!");
			global.haveGamebro = true;
			global.darveyStage = "darveyStage2";
			instance_destroy(obj_trapdoor);
			global.ethelFin = true;
			global.inDialogue = false;
			break;
///////////////////////////////////////////////////////////////////////////////////////////////////////
	case "harvey":
		scr_text("FIRE TO ALL THOSE DAMNED BASTARDS! FIRE RULES!");
		scr_text("O-oh, I'm sorry I didn't see you there... I hope I didn't scare you...");
			scr_option("FIRE RULES!","harvey - 1a");
			scr_option("Is something wrong?","harvey - 1b");
		break;
		case "harvey - 1a":
			scr_text("Oh..");
			scr_text("Oh?");
			scr_text("OHH AAHAAHA!!");
			scr_text("YES MY NEW FRIEND, IT MOST CERTAINLY DOES!");
			scr_text("I'm so happy to meet like minded people, few appreciate the final spark!");
				scr_option("Final spark?","harvey - 2aa");
			break;
		case "harvey - 2aa":
			scr_text("Yes! The final spark! I'm one of the followers and it appears you are one too, friend!");
				scr_option("Hurray for the final spark!", "harvey - 3aa");
				scr_option("I am no follower of the final spark", "harvey - 3bb");
			break;
		case "harvey - 3aa":
			scr_text("HURRAY!!!");
				scr_option("HURRAY!", "harvey - 4aa");
			break;
		case "harvey - 3bb":
			scr_text("Oh! I'm so sorry! That is totally okay! There are not many of us anyways...");
			scr_text("Could I perhaps still ask you to do something for me?");	
				scr_option("Sure", "harvey - 5aa");
				scr_option("Nah, you are weird", "harvey - 5bb");
			break;
		case "harvey - 4aa":
			scr_text("YES!! Oh I'm so happy right now! Ah friend! could I ask you to do something for me?");
				scr_option("YES of course!", "harvey - 5aa");
				scr_option("No, you are weird", "harvey - 5bb");
			break;
		case "harvey - 5bb":
			scr_text("SAYING THAT TO A FRIEND IS A BIT MEAN DON'T YOU THINK?!?!");
				scr_option("We are NOT friends", "harvey - 6aa");
				scr_option("[Apologize]", "harvey - 6bb");
			break;
		case "harvey - 6aa":
			scr_text("OH you!... The final spark is mad at you now! and I'm... I'm never going to get my flamethrower back...");
			scr_text("[Having a flamethrower would be useful]");
				scr_option("You want the flamethrower back?", "harvey - 3caa");
				scr_option("Sooo... the flamethrower is in the basement?", "harvey - 2bd");
			break;
		case "harvey - 6bb":
			scr_text("[SOB] It's too late for that now! I don't need empty words!");
			scr_text("If you are really sorry then show it by killing those nasty creatures in my basement!");
				scr_option("Yes of course, I will!", "harvey - 5aa");
				scr_option("Nasty creatures?", "harvey - 1b");
				scr_option("No! I will NOT!", "harvey - 6aa");
			break;
		case "harvey - 5aa":
			scr_text("Ah! Thank you friend! You are a good person! I'm sure of it! So the thing is... Well...");
			scr_text("Ah... Yes you see, The lightbulbs in my basement suddenly came to life and turned into...");
			scr_text("[Sob] They turned into...");
			scr_text("Into...");
			scr_text("SPIDERS!!");
				scr_option("Oh no!", "harvey - 1bb");
				scr_option("What are spiders?", "harvey - 2b");
				scr_option("How did that happen?", "harvey - 2c");
			break;
		case "harvey - 1b":
			scr_text("Ah... Yes you see, The lightbulbs in my basement suddenly came to life and turned into...");
			scr_text("[Sob] They turned into...");
			scr_text("Into...");
			scr_text("SPIDERS!!");
				scr_option("Oh no!", "harvey - 1bb");
				scr_option("What are spiders?", "harvey - 2b");
				scr_option("How did that happen?", "harvey - 2c");
			break;
		case "harvey - 1bb":
			scr_text("YES! [Sob] Terrible am I right!?");
				scr_option("What are spiders?", "harvey - 2b");
				scr_option("How did that happen?", "harvey - 2c");
			break;
		case "harvey - 2a":
			scr_text("AAAA! Please don't make me discribe them! Oh, but if you insist...");
			scr_text("They are terrible terrible creatures! They have multiple legs and those tiny tiny eyes");
			scr_text("They steal all of your money if you look in their eyes for too long!");
				scr_option("No way!", "harvey - 2ab");
				scr_option("Oh no!", "harvey - 2bb");
			break;
		case "harvey - 2b":
			scr_text("AAAA! Please don't make me discribe them! Oh, but if you insist...");
			scr_text("They are terrible terrible creatures! They have multiple legs and those tiny tiny eyes");
			scr_text("They steal all of your money if you look in their eyes for too long!");
				scr_option("No way!", "harvey - 2bb");
			break;
		case "harvey - 2bb":
			scr_text("YES! [sob] Terrible am I right?!!?");
				scr_option("How did that happen?", "harvey - 2c");
			break;
		case "harvey - 2c":
			scr_text("Please! don't make me relive such a terrible moment!");
			scr_text("But if you must know...");
			scr_text("I was in my basment paying respects to the final spark when...");
			scr_text("BOOM!!!!!");
			scr_text("Something big fell down! Of course I was shocked! And then my lightbulbs started flickering. And then...");
			scr_text("And then...");
			scr_text("You know... those terrible creatures just appeared! And you know what the worst part is?");
			scr_text("I dropped my flamethrower while trying to escape those beasts!");
			scr_text("[Having a flame thrower would be useful]");
				scr_option("You want the flamethrower back?", "harvey - 3caa");
				scr_option("So the flamethrower is down there?", "harvey - 2bd");
			break;
		case "harvey - 2bd":
			scr_text("Yes! [Sob]... W-wait you don't plan on 'stealing' it do you?!?!");
				scr_option("[Lie] What!? Of course not!", "harvey - 4ca");
				scr_option("Yea... I do want to do that", "harvey - 4cb");
				scr_option("I would never steal from the final spark!", "harvey - 4cc");
			break;
		case "harvey - 3caa":
			scr_text("Yes! I would like it back!");
				scr_option("I'll get it for you!", "harvey - 4cd");
				scr_option("TOO BAD! I'm stealing it!", "harvey - 4ce");
			break;
		case "harvey - 4cd":
			scr_text("OH! YES! You are a great great person!");
			scr_text("You know what? If you kill the creatures in my basement you can keep the flamethrower!");
			instance_destroy(obj_hatch);
			global.inDialogue = false;
			global.harveyFin = true;
			break;
		case "harvey - 4ce":
			scr_text("I HATE THIEVES!");
				scr_option("[Fight Harvey]", "harvey - fight");
			break;
		case "harvey - 4ca":
			scr_text("I HATE LIARS!");
				scr_option("[Fight Harvey]", "harvey - fight");
			break;
		case "harvey - 4cb":
			scr_text("Ah well at least you're honest. I like that!");
			scr_text("You know what? If you kill the creatures you can keep the flamethrower!");
			instance_destroy(obj_hatch);
			global.inDialogue = false;
			global.harveyFin = true;
			break;
		case "harvey - 4cc":
			scr_text("HURRAY FOR THE FINAL SPARK!!!");
				scr_option("HURRAY!", "harvey - 4cd");
			break;
		case "harvey - fight":
			instance_destroy(obj_textbox);
			//FIGHT
			global.harveyFight = true;
			global.inDialogue = false;
			global.harveyFin = true;
			break;
///////////////////////////////////////////////////////////////////////////////////////////////////////
	case "darveyStage1":
		//Player doesn't have gamebro
		scr_text("...");
		scr_text("...");
		scr_text("Oh, hi there...");
		scr_text("I'm sorry I don't feel like talking today...");
			scr_option("Okay","darvey - end");
		break;
	case "darvey - end":
		instance_destroy(obj_textbox);
		global.inDialogue = false;
		obj_player.interacted = -1;
		break;
	case "darveyStage2":
		//Player has gamebro
		scr_text("...");
		scr_text("...");
		scr_text("Oh, hi there...");
		scr_text("I'm sorry I don't feel like tal-");
		scr_text("W-Wait is that my gamebro?!?! D-did you come all this way to give this to me?");
			scr_option("[Give darvey the gamebro]", "darveyStage2 - 1aa");
			scr_option("Nope", "darveyStage2 - 1ba");
		break;
	case "darveyStage2 - 1aa":
		scr_text("Thank you so much! I must've dropped it while sleep walking again...");
		scr_text("Have you met my brother Harvey yet??");
			scr_option("Yes", "darveyStage2 - 2aa");
			scr_option("No", "darveyStage2 - 2ba");
		break;
	case "darveyStage2 - 1ba":
		scr_text("GIVE MY GAMEBRO BACK!");
			scr_option("[Fight Darvey]", "darvey - fight");
		break;
	case "darveyStage2 - 2ba":
		scr_text("You should go meet him when you have time... B-but don't tell him I told you to!");
		scr_text("Harvey's my brother");
		scr_text("I don't see him often, even though he lives 2 houses away from me...");
		scr_text("I wish I'd visit him more often... However g-going outside scares me deeply...");
			scr_option("But you're outside right now?", "darveyStage2 - 3aa");
			scr_option("Why does it scare you?", "darveyStage2 - 3ab");
		break;
	case "darveyStage2 - 2aa":
		scr_text("Harvey's my brother");
		scr_text("I don't see him often, even though he lives next door...");
		scr_text("I wish I'd visit him more often... However g-going outside scares me deeply...");
			scr_option("But you're outside right now?", "darveyStage2 - 3aa");
			scr_option("Why does it scare you?", "darveyStage2 - 3ab");
		break;
	case "darveyStage2 - 3aa":
		scr_text("Ah... Yes...");
		scr_text("Hehe... I'm sure you can't tell but my legs are trembling b-because...");
		scr_text("Because people freak me out! But for whatever reason you don't");
		scr_text("Uhm... just a weird question... are you you know... human?");
			scr_option("[Tell Darvey what you are]", "darveyStage2 - 4aa");
			scr_option("[Lie] Yes I am human", "darveyStage2 - 4ab");
		break;
	case "darveyStage2 - 4aa":
		scr_text("Woah! That's the reason! You must've travled far then. I always dreamed of traveling you know?");
		scr_text("Yeah! Adventuring and stuff... Ahh...");
		scr_text("I envy you, you know? I'm too scared to travel. What if something goes wrong?");
		scr_text("What if... I'm just a dissapointment?");
		scr_text("What if I meet new people? What if I get lost?");
		scr_text("...");
		scr_text("Maybe you think the same way as me... but you are here! That means you are a very brave person!");
		scr_text("I'm curious now... what brings you all the way over here?");
			scr_option("[Explain what you are looking for]", "darveyStage2 - 5aa");
			scr_option("None of your business", "darveyStage2 - 5ba");
		break;
	case "darveyStage2 - 4ab":
		scr_text("O-oh... sorry for asking something so weird, but you must be from far away then?");
			scr_option("Something like that, yes", "darveyStage2 - 4aba");
		break;
	case "darveyStage2 - 4aba":
		scr_text("Oh woah! Maybe that's the reason... I always dreamed of traveling you know?");
		scr_text("Yeah! Adventuring and stuff... Ahh...");
		scr_text("I envy you, you know? I'm too scared to travel. What if something goes wrong?");
		scr_text("What if... I'm just a dissapointment?");
		scr_text("What if I meet new people? What if I get lost?");
		scr_text("...");
		scr_text("Maybe you think the same way as me... but you are here! That means you are a very brave person!");
		scr_text("I'm curious now... what brings you all the way over here?");
			scr_option("[Explain what you are looking for]", "darveyStage2 - 5aa");
			scr_option("None of your business", "darveyStage2 - 5ba");
		break;
	case "darveyStage2 - 5aa":
		scr_text("Oh wow really? Uhm... I think I might know something...");
		scr_text("You see, an online friend of mine told me they saw something weird fall down the city a couple days ago");
		scr_text("It fits the discription you gave... Well the on fire falling down part at least");
		scr_text("Big chance the object you are looking for is down there!");
		scr_text("Oh but you have to watch out for the guard! I hear he's the reason we have earthquakes now");
			scr_option("Thank you for the information", "darveyStage2 - 6aa");
		break;
	case "darveyStage2 - 5ba":
		scr_text("Eep! O-okay! I-I'm sorry!");
		global.inDialogue = false;
		global.darveyFin = true;
		break;
	case "darveyStage2 - 6aa":
		scr_text("It's okay! you are very welcome! Also, if you have time...");
		scr_text("Come visit me again when you are done!");
		scr_text("I would love to hear about all the things you encounter!");
		global.inDialogue = false;
		global.darveyFin = true;
		break;
	case "darveyStage3":
		//Player has fought harvey
		scr_text("W-wait... Just now I saw you figth with Harvey!");
			scr_option("[Lie] What? No I did not", "darveyStage3 - 1aa");
			scr_option("Yes I did", "darveyStage3 - 1ba");
		break;
	case "darveyStage3 - 1aa":
		scr_text("Oh... I'm sorry, I must've been seeing things again!");
		scr_text("Harvey's my brother");
		scr_text("I don't see him often, even though he lives 2 houses away from me...");
		scr_text("I wish I'd visit him more often... However g-going outside scares me deeply...");
			scr_option("But you're outside right now?", "darveyStage2 - 3aa");
			scr_option("Why does it scare you?", "darveyStage2 - 3ab");
		break;
	case "darveyStage2 - 3ab":
		scr_text("Because people freak me out! But for whatever reason you don't");
		scr_text("Uhm... just a weird question... are you you know... human?");
			scr_option("[Tell Darvey what you are]", "darveyStage2 - 4aa");
			scr_option("[Lie] Yes I am human", "darveyStage2 - 4ab");
		break;
	case "darveyStage3 - 1ba":
		scr_text("Eep!");
		scr_text("P-Please don't hurt me!");
		scr_text("B-But... My brother...");
		scr_text("No Darvey! You need to take revenge for your brother!");
		scr_text("Fight me, you monster!");
			scr_option("[Fight Darvey]", "darvey - fight");
		break;
	case "darvey - fight":
		//FIGHT
		instance_destroy(obj_textbox);
		global.darveyFight = true;
		global.inDialogue = false;
		break;
///////////////////////////////////////////////////////////////////////////////////////////////////////
	case "maudStage1":
		//Player does not have flamethrower
		scr_text("Sorry, can't let you pass, too dangerous. I'll only let you pass if you have a flamethrower");
		global.inDialogue = false;
		obj_NPC_maud.npcName = "maudStage1";
		obj_player.interacted = -1;
		break;
	case "maudStage2":
		//Player has flamethrower
		//Player killed Ethel, but no one else
		scr_text("Oh! Hello there stranger!");
		scr_text("Harvey told me he gave you his flamethrower!");
		scr_text("Harvey must really like you, he spoke highly of you!");
		scr_text("You can pass into the mines if you want! But please, be careful!");
		global.inDialogue = false;
		global.maudFin = true;
		obj_gate.state_gate = gateStates.open;
		break;
	case "maudStage3":
		//Player has not killed anybody
		scr_text("Oh! Hi! Ethel told me about you");
		scr_text("Also, Harvey told me he gave you his flamethrower!");
		scr_text("Harvey must really like you, he spoke highly of you!");
		scr_text("You can pass into the mines if you want! But please, be careful!");
		global.inDialogue = false;
		global.maudFin = true;
		obj_gate.state_gate = gateStates.open;
		break;
	case "maudStage4":
		//Player only killed harvey
		scr_text("Oh... Hi... Ethel told me about you");
		scr_text("But she must have misjudged you...");
		scr_text("You did something terrible...");
		scr_text("Why did you do it? Because they are different?");
		scr_text("Because it seemed easy? Because it seemed fun?");
		scr_text("It doesn't even matter anymore...");
		scr_text("Heh. I see you even stole from Harvey...");
		scr_text("This place is better off without people like you...");
			scr_option("[Fight Maud]", "maud - Fight");
		break;
	case "maudStage5":
		//Player killed everyone
		scr_text("...");
		scr_text("What are you?");
		scr_text("Some kind of monster?");
		scr_text("It doesn't even matter anymore...");
		scr_text("Heh. I see you even stole from Harvey...");
		scr_text("This place is better off without people like you...");
			scr_option("[Fight Maud]", "maud - Fight");
		break;
	case "maud - Fight":
		instance_destroy(obj_textbox);
		//FIGHT
		global.maudFight = true;
		global.inDialogue = false;
		break;
///////////////////////////////////////////////////////////////////////////////////////////////////////
//TEMPLATE
		case "":
			scr_text("");
				scr_option("");
			break;
	}

}