/// @description Insert description here
// You can write your code in this editor
xx = lengthdir_x(sprite_width*0.4,direction);
yy = lengthdir_y(sprite_width*0.4,direction);
line_len = distance_to_object(obj_enemy_boss);
line_lenght = point_distance(x,y,obj_enemy_boss.boss_r_shoulder,obj_enemy_boss.boss_r_shoulder_y);
direct = point_direction(x,y,obj_enemy_boss.x, obj_enemy_boss.y);
direct_chain = point_direction(obj_enemy_boss.boss_r_shoulder,obj_enemy_boss.boss_r_shoulder_y,x,y);

var collision_all = collision_point(x-xx*2,y-yy*2,obj_player,1,0);
if (collision_all && instance_exists(obj_hook)){	

	speed = 0;	
	pull = true;
}

// if player is hit pull him towards you		
if ((pull))
{	//calculate length on the way back
	var line_len_x = distance_to_object(obj_enemy_boss);
	//set direction of hook on way back
	var _mx = obj_enemy_boss.boss_r_shoulder;
	var _my = obj_enemy_boss.boss_r_shoulder_y;

	rx = x;
	ry = y;
	_mx = rx + lengthdir_x(line_len,direct);
	_my = ry + lengthdir_y(line_len,direct);
	//retract hook 	
	x += (obj_enemy_boss.boss_r_shoulder - _mx)*0.3;
	y += (obj_enemy_boss.boss_r_shoulder_y - _my)*0.3;
	
	var _x = (obj_enemy_boss.boss_r_shoulder - _mx)*0.3;
	var _y = (obj_enemy_boss.boss_r_shoulder_y - _my)*0.3;
	//check for player collision
	if((!place_meeting(x+_x,y,obj_ground) && !place_meeting(x+_x,y,obj_wall))){
		obj_player.x = x; 
	}
	if((!place_meeting(x+_y,y,obj_ground) && !place_meeting(x+_y,y,obj_wall))){
		obj_player.y = y+25;
	}
	
	if (line_len_x < 60){
		pull = false;
		instance_destroy();
	}	
}
//set the distance of extension, destoy if higher
if (line_len >= max_line_len){
	instance_destroy();
	
}

//move sprite to edge of point
var collision_one = collision_point(x+xx,y+yy,obj_wall,1,0);
var collision_one_wall = collision_point(x+xx,y+yy,obj_ground,1,0);
var collision_two = collision_point(x-xx/2,y-yy/2,obj_wall,1,0);
var collision_two_wall = collision_point(x-xx/2,y-yy/2,obj_ground,1,0);
if (collision_one || collision_one_wall){
	instance_destroy();
	
	
}

