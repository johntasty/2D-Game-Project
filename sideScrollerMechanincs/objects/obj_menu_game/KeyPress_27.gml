/// @description Insert description here
// You can write your code in this editor
if (!global.__paused)
{
	global.__paused = 1;
	instance_deactivate_all(true);
}
else {
	global.__paused = 0;
	instance_activate_all();
	global._saved = 0;
}