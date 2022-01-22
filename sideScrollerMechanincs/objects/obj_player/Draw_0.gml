/// @description Insert description here
/*if (global.__sht){
testing dont delete
	global.__bulletsize += 1;//(0.2/room_speed);
	draw_sprite_pos(test_stretc,1,mouse_x,mouse_y,mouse_x+global.__bulletsize,mouse_y-global.__bulletsize,mouse_x+(global.__bulletsize*2),mouse_y+100-(global.__bulletsize*2),mouse_x,mouse_y+100,1);
	//draw_sprite_stretched(test_stretc, 0, mouse_x, mouse_y, global.__bulletsize, sprite_height );
	//draw_sprite_ext(test_stretc,0,mouse_x ,mouse_y,global.__bulletsize/60,1,global.__bulletsize,image_blend,image_alpha);
}*/
draw_circle(r_elbow_x,r_elbow_y,6,0);
arm_dir = point_direction(r_shoulder_x,r_shoulder_y,r_elbow_x,r_elbow_y);
arm_dir_l = point_direction(l_shoulder_x,l_shoulder_y,l_elbow_x,l_elbow_y);
leg_dir = point_direction(r_hip_x,r_hip_y,r_knee_x,r_knee_y);
leg_dir_l = point_direction(l_hip_x,l_hip_y,l_knee_x,l_knee_y);
if (flash)
{
	col = c_red;		
	if (alarm[2] == -1){
		alarm[2] = blink_duration;
	}
}else { col = image_blend;}


if (look_direction < 90 || look_direction > 275){
draw_sprite_ext(spr_left_arm,0,l_shoulder_x + spd,l_shoulder_y,1,1,arm_dir_l,col,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,l_hip_x + spd,l_hip_y,1,1,leg_dir_l,col,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,r_hip_x +spd,r_hip_y,1,1,leg_dir,col,image_alpha);
}else{
draw_sprite_ext(spr_left_arm,0,l_shoulder_x+spd,l_shoulder_y,1,-1,arm_dir_l,col,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,l_hip_x+spd,l_hip_y,1,-1,leg_dir_l,col,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,r_hip_x+spd,r_hip_y,1,-1,leg_dir,col,image_alpha);
}
var draw_weapon = function()
{
	if (weapon && weapon.weapon_directory != 3)
	{
		with(weapon){	
			
			draw_self();
		}
	}
}
//set order of drawing
var draw_side = function(){
	if (look_direction < 90 || look_direction > 275){
		draw_side_way  = draw_sprite_ext(MainCharacterNoLimbs,0,x,y,1,1,look_direction,col,image_alpha);
		
	}else{
		draw_side_way = draw_sprite_ext(MainCharacterNoLimbs,0,x,y,1,-1,look_direction,col,image_alpha);
		
	}
}
		

var draw_order = [draw_side, draw_weapon]
if(weapon_dir < 210 || weapon_dir > 320)
{
	draw_order = [draw_weapon, draw_side];
}

for (var i = 0; i<array_length(draw_order); i++)
{
	draw_order[i]();
}


if (look_direction < 90 || look_direction > 275){		
		draw_sprite_ext(spr_right_arm,0,r_shoulder_x+spd,r_shoulder_y,1,1,arm_dir,col,image_alpha);	
		
	}
	else {		
		draw_sprite_ext(spr_right_arm,0,r_shoulder_x+spd,r_shoulder_y,1,-1,arm_dir,col,image_alpha);
		
	}
//health bar
draw_sprite_stretched(healthbar3,0,x-(health_bar_width/2)+5, y-sprite_height, (hp/hp_max)*health_bar_width,health_bar_height);
draw_sprite_stretched(healthbar_empty,0,x-(health_bar_width/2)+5, y-sprite_height,health_bar_width,health_bar_height);