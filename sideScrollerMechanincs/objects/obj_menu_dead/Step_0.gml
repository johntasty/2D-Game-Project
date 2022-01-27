/// @description Insert description here
// You can write your code in this editor
//check if you are dead
if (global.__dead){
//pop up the menu 
	instance_deactivate_all(true);
	var _up = keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(ord("S"));
	var _select = (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter));

	var _move = _down - _up;
	if (_move != 0)
	{//itterate through the menu 
		audio_play_sound(menu_switch,0,0);
		//move index position
		_index_dead += _move;
	
		//clamp values
		var _size = array_length_2d(menu_dead,submenu_index_dead);
		if (_index_dead < 0){_index_dead = _size - 1;}
	
		else if (_index_dead >= _size){_index_dead = 0;}
	}
	if (_select){
		audio_play_sound(menu_select,0,0);
		switch(submenu_index_dead)
		{
			case 0:
				switch(_index_dead)
				{
					case 0:
					//main menu
					room_goto(1);
					global.played = true;
					break;
					case 1: 
					//restart
					room_restart();									
					break;
					case 2: 
					//load						
					global.__dead = 0;
					instance_activate_all();
					//if load is hit set the boss back to its original position, and set the player back to its saved game position
					obj_enemy_boss.x = obj_enemy_boss.starting_x;
					obj_enemy_boss.y = obj_enemy_boss.starting_y;					
					scr_load_game_dead();
					//instance_destroy(obj_menu_dead);
					break;	
					case 3:
					//exit
					game_end();
					break;		
				}
		}
	}
}