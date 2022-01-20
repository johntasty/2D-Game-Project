/// @description knockback effect

var melee = collision_circle(x,y,16,obj_ground,false,true);


 if(melee)
 {
	 
	 scr_screenshake(5, 0.5, 0.25);
	dir_knock = point_direction(melee.x, melee.y, obj_player.x, obj_player.y);
	if ((direction > 0 && direction < 70) || (direction < 180 && direction > 110)){
		knockingback = true;
		instance_destroy();
		alarm[0] = room_speed/30;	
	}
	if (direction > 269 && direction < 285){
		knockingup = true;
		instance_destroy();
		
		alarm[0] = room_speed/30;	
	}
	shaking = true;
	alarm[1] = room_speed/6;
 }
 
if(knockingback == true){				
	obj_player.spd = lengthdir_x(knockback,dir_knock);
	
}
if(knockingup == true){				
	obj_player.vsp = -5;
	
}
