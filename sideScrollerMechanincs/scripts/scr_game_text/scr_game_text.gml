// @param text_id
function scr_game_text(_text_id){

switch(_text_id) {


//-----------database of npc dialogue-----------//
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
		
	case "npc_2":
		scr_text("Hi! I'm NPC 2!");
		scr_text("I'm 2 cool!");
		scr_text("2 2");
		break;
		
	case "npc_3":
		scr_text("Hi! I'm NPC 3! And I speak quite a lot. By a lot, I mean like REALLY a lot");
		scr_text("THREEEEE!");
		break;
		
	case "npc_4":
		scr_text("Hi! I'm NPC 4!");
		scr_text("Now I will speak!");
		scr_text("4");
		break;
		
	case "npc_5":
		scr_text("Hi! I'm NPC 5!");
		scr_text("Now I will speak!");
		break;

	}

}