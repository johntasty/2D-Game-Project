/// @description Insert description here
// You can write your code in this editor
if collision_circle(x,y,16,obj_bullet,false,true){
	var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
		//if !collision_line(x,y,bullet_int.x, bullet_int.y, obj_ground, 1, 1){	
			if(bullet_int.owner == obj_gun.id){
				clr = c_red;	
				health_bar -= bullet_int.damage;
				show_debug_message(health_bar);
				with bullet_int instance_destroy();				
			//}
		}
}
else
{
	clr = c_white;
}