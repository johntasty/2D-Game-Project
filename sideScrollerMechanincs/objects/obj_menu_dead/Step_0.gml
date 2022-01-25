/// @description Insert description here
// You can write your code in this editor
if (global.__dead){
	var _up = keyboard_check_pressed(ord("W"));
	var _down = keyboard_check_pressed(ord("S"));
	var _select = keyboard_check_pressed(vk_enter);

	var _move = _down - _up;
	if (_move != 0)
	{
		//move index position
		_index_dead += _move;
	
		//clamp values
		var _size = array_length_2d(menu_dead,submenu_index_dead);
		if (_index_dead < 0){_index_dead = _size - 1;}
	
		else if (_index_dead >= _size){_index_dead = 0;}
	}
	if (_select){
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
					scr_load_game_dead();			
					break;	
					case 3:
					//exit
					game_end();
					break;		
				}
		}
	}
}