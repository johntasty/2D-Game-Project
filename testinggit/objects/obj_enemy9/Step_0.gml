if (instance_exists(obj_enemy9)){
	if (health_bar <= 0){
				instance_destroy();	
				//instance_destroy(obj_gun_enemy);	
	}

	
		
	var shoot = 0;
	var enemy_detect = collision_circle(x,y,360,obj_player,false,true);
	if(enemy_detect){
			direction = point_direction(x,y,obj_player.x,obj_player.y-30);
			clr_col = c_red;
			cclr_coll = c_red;
 			shoot = 1;
			bul_type_create(bullet,x,y,direction,bullet_speed);
			
			if  collision_circle(x,y,16,obj_bullet,false,true){
					var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
					if !collision_line(x,y,bullet_int.x, bullet_int.y, obj_wall, 1, 1){	
						if(bullet_int.owner != id){
							clr = c_red;	
							health_bar -= bullet_int.damage;
		  				with bullet_int instance_destroy();				
	 				}
				}else
				{
					clr = c_white;
				}
	}else{
			shoot = 0;
			clr_col = c_white;
			cclr_coll = c_white;
	}	
	
}
}