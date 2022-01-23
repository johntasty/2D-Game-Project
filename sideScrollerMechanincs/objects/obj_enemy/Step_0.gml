/// @description Insert description here
// You can write your code in this editor

if (health_bar <= 0){
	instance_destroy();	
}	
		
var shoot = 0; 
var enemy_detect = distance_to_object(obj_player);
if(enemy_detect <= attack_dis){
	direction = point_direction(x,y,obj_player.x,obj_player.y-30);	
	shoot = 1;
	bul_type_create(bullet,x,y,direction,bullet_speed);
	}else{
	shoot = 0;
}		
if  (collision_circle(x,y,32,obj_bullet,1,1)){
	var bullet_int = collision_circle(x,y,16,obj_bullet,1,1);
	dir_knock = point_direction( obj_bullet.x, obj_bullet.y, x, y );
	if instance_exists(bullet_int){
		if(bullet_int.owner != id && attacked == 0){
			knockingback = true;
			attacked = 1;
			clr = c_red;	
			health_bar -= bullet_int.damage;		
			alarm[0] = room_speed/6;	
			alarm[1] = room_speed/6;
			with bullet_int instance_destroy();				
		}
	}
}else {clr = c_white;}
if collision_circle(x,y,32,obj_gun,false,true){
	
	nearest_gun = instance_nearest(x, y, obj_gun);	
	var melee = collision_circle(x,y,32,obj_gun,false,true);
	if (nearest_gun.weapon_directory == 3 && obj_player.state == playerStates.attacking){
		
		if(attacked == 0){			
			knockingback = true;
			stuned = 1;
			attacked = 1;
			clr = c_red;			
			health_bar -= melee.damage_melee;						
			alarm[0] = room_speed/2;
			alarm[1] = room_speed/6;
		}			
	}
}
if(knockingback == true){

	x += lengthdir_x(knockback,dir_knock);
	
}
if (bounce_back == true){
	x -= lengthdir_x(knockback,dir_knock);
}