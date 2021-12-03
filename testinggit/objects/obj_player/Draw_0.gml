/// @description Insert description here
// You can write your code in this editor



//draw weapon

draw_line_width(l_shoulder_x,l_shoulder_y,l_elbow_x,l_elbow_y,6);
draw_line_width(l_elbow_x, l_elbow_y, l_hand_x, l_hand_y, 6);



var draw_weapon = function()
{
	if (weapon)
	{
		with(weapon){
			draw_sprite_ext(
			//weapon shadow
				sprite_index,
				image_index,
				other.x ,
				other.y,
				image_xscale,
				image_yscale,
				image_angle,
				c_black,
				1
			)
			draw_self();
		}
	}
}
//set order of drawing
var draw_order = [draw_self, draw_weapon]
/*if(weapon_dir< 180)
{
	draw_order = [draw_weapon, draw_self];
}*/
for (var i = 0; i<array_length(draw_order); i++)
{
	draw_order[i]();
}
draw_set_color(c_black);

//right leg
//thigh
draw_line_width(r_hip_x,r_hip_y,r_knee_x,r_knee_y,12);

draw_line_width(r_elbow_x, r_elbow_y, r_hand_x, r_hand_y, 6);
//calf
draw_line_width(r_knee_x, r_knee_y, r_foot_x, r_foot_y, 6);

//left leg
//thigh
draw_line_width(l_hip_x,l_hip_y,l_knee_x,l_knee_y,12);

//calf
draw_line_width(l_knee_x, l_knee_y, l_foot_x, l_foot_y, 6);

/*for (var i = 0; i<sprite_get_number(spr_head); i++){

	draw_sprite_ext(spr_head, i, x-hspeed, y-vspeed - 8 - i, 1, 1, direction, image_blend, image_alpha);
	
 }*/   

/*if (look_direction > 91 && look_direction < 265){
	
	draw_sprite_ext(spr_head, 0, x-hspeed, y-vspeed - 2, -1, 1, 0, image_blend, image_alpha);
}else{
	draw_sprite_ext(spr_head, 0, x-hspeed, y-vspeed - 2, 1, 1, 0, image_blend, image_alpha);
}*/

//physics_world_draw_debug(phy_debug_render_shapes);	




//draw_sprite_ext(spr_arm_gun, 0, r_elbow_x, r_elbow_y, 1, 1, weapon_dir, image_blend, image_alpha);
draw_set_color(c_black);
draw_line_width(r_shoulder_x,r_shoulder_y,r_elbow_x,r_elbow_y,6);
