function scr_set_defaults_fortext() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variables for every letter/character
	for (var c = 0; c < 500; c++)
		{
		col_1[c,page_number] = c_white;
		col_2[c,page_number] = c_white;
		col_3[c,page_number] = c_white;
		col_4[c,page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
		}
	
	txtb_spr[page_number] = spr_textbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_voice_mid;
	}

//-----------text VFX-------------//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){
	
	for (var c = _start; c <= _end; c++)
		{
		col_1[c, page_number-1] = _col1;
		col_2[c, page_number-1] = _col2;	
		col_3[c, page_number-1] = _col3;	
		col_4[c, page_number-1] = _col4;	
		}

	}

/// @param 1st_char
/// @param last_char
function scr_text_float(_start, _end){
	
		for (var c = _start; c <= _end; c++)
		{
		float_text[c, page_number-1] = true;
		}
}

/// @param 1st_char
/// @param last_char
function scr_text_shake(_start, _end){
	
		for (var c = _start; c <= _end; c++)
		{
		shake_text[c, page_number-1] = true;
		}
}

/// @param text
/// @param [character]
/// @param [side]
function scr_text(_text){
	
	scr_set_defaults_fortext();

	text[page_number] = _text;
	
	//get character infor
	if argument_count > 1 {
		switch(argument[1])
			{
				//player
				case "player":
					txtb_spr[page_number] = spr_textbox;
					snd[page_number] = snd_voice_low;
					break;
				
				//npc 1
				case "npc_1_talk":
					speaker_sprite[page_number] = spr_npc_1_talk;
					txtb_spr[page_number] = spr_textbox;
					snd[page_number] = snd_voice_mid;
					break;
				case "npc_1_sad":
					speaker_sprite[page_number] = spr_npc_1_sad;
					txtb_spr[page_number] = spr_textbox;
					snd[page_number] = snd_voice_mid;
					break;
			}
		
		//spreaker_sprite[page_number] = argument[1];
		}
	
	//side the character is on
	if argument_count > 2 {
		speaker_side[page_number] = argument[2];
		}
	page_number++;

	}





///@param option
///@param link_id
function scr_option(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

/// @param text_id
function create_textbox(_text_id) {
	if (instance_exists(obj_textbox)){
		with (obj_textbox){
			instance_destroy();
		}
	}
	with (instance_create_depth(obj_player.x,obj_player.y-150,-9999, obj_textbox) )
	{
		global.inDialogue = true;
		scr_game_text(_text_id);
	}
	
}