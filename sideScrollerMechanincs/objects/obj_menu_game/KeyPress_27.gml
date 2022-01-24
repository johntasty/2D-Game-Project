/// @description Insert description here
// You can write your code in this editor
if (!global.__paused)
{
	instance_create_layer(x,y,"Base_Level",obj_menu_game);
	global.__paused = 1;	
	instance_deactivate_all(true);
}
else {
	global.__paused = 0;
	instance_destroy(obj_menu_game)
	instance_activate_all();
	global._saved = 0;
}