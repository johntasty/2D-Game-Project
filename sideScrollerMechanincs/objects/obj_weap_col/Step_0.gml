/// @description collision melee

if (health_bar <= 0){
				instance_destroy();	
}				

if collision_rectangle(x-200,y-100,x+200,y+100,obj_player,false,true){
	if(stuned == 0){
		move_towards_point(obj_player.x,y,1);
		
	}else{ move_towards_point(obj_player.x,obj_player.y,0);}
}
if collision_circle(x,y,32,obj_gun,false,true){
	
	nearest_gun = instance_nearest(x, y, obj_gun);
	
	var melee = collision_circle(x,y,32,obj_gun,false,true);
	if (nearest_gun.weapon_directory == 3){
		if(attacked == 0){
			knockback_dir = point_direction(nearest_gun.x, nearest_gun.y,x,y);	
			x += lengthdir_x(knockback,knockback_dir);
			y += lengthdir_y(knockback, knockback_dir);
			stuned = 1;
			attacked = 1;
			clr = c_red;	
			
			health_bar -= melee.damage_melee;
		
			alarm[0] = room_speed/6;
			alarm[1] = room_speed/2;
		
			}	
	}
}else{
	clr = c_white;
}


if  collision_circle(x,y,16,obj_bullet,false,true){
					var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
					if !collision_line(x,y,bullet_int.x, bullet_int.y, obj_ground , 1, 1){	
						if(bullet_int.owner != id){
							clr = c_red;	
							health_bar -= bullet_int.damage;
		  				with bullet_int instance_destroy();				
	 				}
				}else
				{
					clr = c_white;
				}
}