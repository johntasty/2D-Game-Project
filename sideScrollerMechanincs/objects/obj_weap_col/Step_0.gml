/// @description collision melee

if (health_bar <= 0){
				instance_destroy();	
}				

if collision_rectangle(x-400,y-100,x+400,y+100,obj_player,false,true){
	dir = point_direction(x,y,obj_player.x,obj_player.y);
		if(stuned == 0){		
			spd_enemy = 1;
		}else{spd_enemy = 0;}
	spd_enemy = lengthdir_x(spd_enemy,dir);	
	if place_meeting(x+spd_enemy,y,obj_wall){
		while(!place_meeting(round(x+sign(spd_enemy)),round(y),obj_wall)) x +=sign(spd_enemy);
		spd_enemy = 0;	
	}		 
	 x += spd_enemy;
	 
	
}
if collision_circle(x,y,32,obj_gun,false,true){
	
	nearest_gun = instance_nearest(x, y, obj_gun);	
	var melee = collision_circle(x,y,32,obj_gun,false,true);
	if (nearest_gun.weapon_directory == 3 && obj_player.state == playerStates.attacking){
		
		if(attacked == 0){			
			knockingback = true;
			stuned = 1;
			attacked = 1;
			clr = c_red;			
			health_bar -= melee.damage_melee/10;
			
			alarm[2] = room_speed/6;
			alarm[0] = room_speed/2;
			alarm[1] = room_speed/2;
		}
		
		
			
	}
}else{
	clr = c_white;
}


if  collision_circle(x,y,16,obj_bullet,false,true){
	var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
						
	if(bullet_int.owner != id){
		clr = c_red;	
		health_bar -= bullet_int.damage;
		with bullet_int instance_destroy();				
	}
}
else
{
	clr = c_white;
}

if(knockingback == true){
	knockback_dir = point_direction(nearest_gun.x, nearest_gun.y,x,y);
	x += lengthdir_x(knockback,knockback_dir);
	//y += lengthdir_y(knockback,knockback_dir);
	
}
