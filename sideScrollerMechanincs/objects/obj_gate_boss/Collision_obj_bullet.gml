/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_bullet){
	var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
	with bullet_int instance_destroy();	
}