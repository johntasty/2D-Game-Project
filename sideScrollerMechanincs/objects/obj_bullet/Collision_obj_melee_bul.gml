/// @description Insert description here
// You can write your code in this editor
speed = -speed;
var bullet_int = collision_circle(x,y,16,obj_melee_bul,1,1);
if (instance_exists(bullet_int)){
	owner = bullet_int.id;
	with bullet_int instance_destroy();
}
