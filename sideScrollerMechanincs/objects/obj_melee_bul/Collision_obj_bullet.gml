/// @description Insert description here
// You can write your code in this editor
if (collision_circle(x,y,32,obj_bullet,true,true))
{
	var _collision = collision_circle(x,y,32,obj_bullet,true,true);
	if (instance_exists(obj_bullet)){
		_collision.speed = speed*-2;
		show_debug_message(_collision.speed);
	}
}