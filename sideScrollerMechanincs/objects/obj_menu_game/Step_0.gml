/// @description Insert description here
// You can write your code in this editor
var _up = keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter);


var _move = _down - _up;
if (_move != 0)
{
	//move index position
	_index += _move;
	
	//clamp values
	var _size = array_length_1d(menu);
	if (_index < 0){_index = _size - 1;}
	
	else if (_index >= _size){_index = 0;}
}
if (_select){
	switch(_index)
	{
		case 0: 
		//continue
		global.__paused = 0;
		//instance_activate_all();
		break;
		case 1: 
		//save game		
		scr_save_game();
		break;	
		case 2:
		//exit
		game_end();
		break;
		
	}
}