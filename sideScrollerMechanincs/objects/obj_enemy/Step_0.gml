/// @description Insert description here
// You can write your code in this editor

if (health_bar <= 0){
	instance_destroy();	
}	
		
var shoot = 0; 
var enemy_detect = distance_to_object(obj_player);

if(enemy_detect <= attack_dis && recoil_step < 1){
	direction = point_direction(x,y,obj_player.x,obj_player.y-30);	
	shoot = 1;
	bul_type_create(bullet,x,y,direction,bullet_speed);
	recoil_step = recoil;
	}else{
	shoot = 0;
}		
if  (collision_circle(x,y,32,obj_bullet,1,1)){
	var bullet_int = collision_circle(x,y,16,obj_bullet,1,1);
	dir_knock = point_direction( obj_bullet.x, obj_bullet.y, x, y);
	if instance_exists(bullet_int){
		if(bullet_int.owner != id && attacked == 0){

			knockingback = true;
			attacked = 1;
			blink = true;
			health_bar -= bullet_int.damage;		
			alarm[0] = room_speed/6;	
			alarm[1] = room_speed/6;
			with bullet_int instance_destroy();				
		}
	}
}
recoil_step = lerp(recoil_step,0,trigger_speed);
if collision_circle(x,y,32,obj_melee_bul,false,true){
	
	
	var melee = collision_circle(x,y,32,obj_melee_bul,false,true);
	if (melee){
		dir_knock = point_direction( obj_melee_bul.x, obj_melee_bul.y, x, y );
		if(attacked == 0){	
			repeat(6) {
				var _dir = random(45);
			
				var _len = 115;
				xprev = x;
				yprev = y-25;
				var spawn_x = x+lengthdir_x(_len,dir_knock+_dir); // The x and y where the particle will spawn
				var spawn_y = (y-25)+lengthdir_y(_len,_dir);
			
				var _dir = point_direction(x,y,xprev,yprev);
				var _part_dir = point_direction(x,y-25,spawn_x,spawn_y); // The direction from the particle spawn to the "center point" or the mouse in this case
				part_type_direction(obj_particle_controller.wormhole_part,_part_dir,_part_dir,0,0);	
				//part_type_direction(wormhole_part_step,_part_dir,_part_dir,0,0); // 0,359,4,0
				part_type_orientation(obj_particle_controller.wormhole_part, _part_dir, _part_dir, 0, 0, 0);
				//part_type_orientation(wormhole_part_step,_part_dir,_part_dir,0,0,0); // 0,0,0,0,0
			
			
				part_particles_create(obj_particle_controller.wormhole_ps_upper,xprev,yprev,obj_particle_controller.wormhole_part,1);
	
			}
			knockingback = true;
			stuned = 1;
			attacked = 1;
			blink = true;			
			health_bar -= melee.damage/10;						
			alarm[0] = room_speed/2;
			alarm[1] = room_speed/6;
			with melee instance_destroy();
		}			
	}
}
if(knockingback == true){
				
	x += lengthdir_x(knockback,dir_knock);
	
}
if (bounce_back == true){
	x -= lengthdir_x(knockback,dir_knock);
}

	

