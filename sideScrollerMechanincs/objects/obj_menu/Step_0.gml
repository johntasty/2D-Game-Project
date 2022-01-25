/// @description 
//get input

var _up = keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter);

var _move = _down - _up;
if (_move != 0)
{
	//move index position
	menu_index += _move;
	
	//clamp values
	var _size = array_length_2d(menu,submenu_index);
	if (menu_index < 0){menu_index = _size - 1;}
	
	else if (menu_index >= _size){menu_index = 0;}
}

if (_select)
{
	switch(submenu_index)
	{
		case 0: 
			switch(menu_index)
			{
				case 0: 
				//start
					global.__load = false;					
					room_goto_next();
					global.played = true;
					break;
				case 1: 
				//load game
					global.__load = true;
					scr_load_room();
					break;	

				case 2:
					//exit
					game_end();
					break;
			}break;
		case 1:
			switch(menu_index)
			{
				case 0: 
				//graphics
					break;
				
				case 1:
				//sound					
					break;

				case 2:
					//back
					break;
			}break;
	} 
}
