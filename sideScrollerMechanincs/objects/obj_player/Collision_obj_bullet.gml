/// @description Insert description here
// You can write your code in this editor
var bullet_int = collision_circle(x,y,16,obj_bullet,1,1);
if instance_exists(bullet_int){
	if(bullet_int.owner != obj_gun_melee.id){
		
		with bullet_int instance_destroy();	
		scr_got_hit(0.2);
	}
}