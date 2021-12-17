/// @description Insert description here
// You can write your code in this editor

	if (health_bar <= 0){
				instance_destroy();	
				
	}	
		
	var shoot = 0; 
	var enemy_detect = distance_to_object(obj_player);
	if(enemy_detect <= attack_dis){
			direction = point_direction(x,y,obj_player.x,obj_player.y-30);
			clr_col = c_red;
			cclr_coll = c_red;
 			shoot = 1;
			bul_type_create(bullet,x,y,direction,bullet_speed);
			
			
	}else{
			shoot = 0;
			clr_col = c_white;
			cclr_coll = c_white;
	}		
	var dmg_taken = collision_circle(x,y,32,obj_bullet,false,true);
if (instance_exists(dmg_taken)){	
	if  (dmg_taken && dmg_taken.owner != id){
			//var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
			clr = c_red;	
			health_bar -= dmg_taken.damage;
		  	with dmg_taken instance_destroy();	
			
			
	}else
	{
		clr = c_white;
	}
}