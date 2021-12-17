/// @description Insert description here

arm_dir = point_direction(r_shoulder_x,r_shoulder_y,r_elbow_x,r_elbow_y);
arm_dir_l = point_direction(l_shoulder_x,l_shoulder_y,l_elbow_x,l_elbow_y);
leg_dir = point_direction(r_hip_x,r_hip_y,r_knee_x,r_knee_y);
leg_dir_l = point_direction(l_hip_x,l_hip_y,l_knee_x,l_knee_y);
draw_line_width_color(r_elbow_x,r_elbow_y,r_hand_x,r_hand_y,6,c_red,c_red);
//draw_line_width_color(l_hip_x,l_hip_y,l_knee_x,l_knee_y,6,c_black,c_black);
draw_circle(r_elbow_x,r_elbow_y,6,c_black);
if (look_direction < 90 || look_direction > 275){
draw_sprite_ext(spr_left_arm,0,l_shoulder_x + spd,l_shoulder_y,1,1,arm_dir_l,image_blend,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,l_hip_x + spd,l_hip_y,1,1,leg_dir_l,image_blend,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,r_hip_x +spd,r_hip_y,1,1,leg_dir,image_blend,image_alpha);
}else{
draw_sprite_ext(spr_left_arm,0,l_shoulder_x+spd,l_shoulder_y,1,-1,arm_dir_l,image_blend,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,l_hip_x+spd,l_hip_y,1,-1,leg_dir_l,image_blend,image_alpha);
draw_sprite_ext(MainCharacterLeg2,0,r_hip_x+spd,r_hip_y,1,-1,leg_dir,image_blend,image_alpha);
}
var draw_weapon = function()
{
	if (weapon)
	{
		with(weapon){			
			draw_self();
		}
	}
}
//set order of drawing
var draw_side = function(){
	if (look_direction < 90 || look_direction > 275){
		draw_side_way  = draw_sprite_ext(MainCharacterNoLimbs,0,x,y,1,1,look_direction,image_blend,image_alpha);
		
	}else{
		draw_side_way = draw_sprite_ext(MainCharacterNoLimbs,0,x,y,1,-1,look_direction,image_blend,image_alpha);
		
	}
	return draw_side_way;
}
		

var draw_order = [draw_side, draw_weapon]
if(weapon_dir< 180)
{
	draw_order = [draw_weapon, draw_side];
}
for (var i = 0; i<array_length(draw_order); i++)
{
	draw_order[i]();
}


if (look_direction < 90 || look_direction > 275){		
		draw_sprite_ext(spr_right_arm,0,r_shoulder_x+spd,r_shoulder_y,1,1,arm_dir,image_blend,image_alpha);	
		
	}
	else {		
		draw_sprite_ext(spr_right_arm,0,r_shoulder_x+spd,r_shoulder_y,1,-1,arm_dir,image_blend,image_alpha);
		
	}



