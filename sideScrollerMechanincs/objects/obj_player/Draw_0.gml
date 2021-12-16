/// @description Insert description here
// You can write your code in this editor



//draw weapon

draw_line_width(l_shoulder_x,l_shoulder_y,l_elbow_x,l_elbow_y,6);


/*for (var i = 0; i<sprite_get_number(Sprite1_strip8); i++){

	draw_sprite_ext(Sprite1_strip8, i, x-hspeed, y-vspeed - 8 - i, 1, 1, direction, image_blend, image_alpha);
	
 }   */

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
var draw_order = [draw_self, draw_weapon]
if(weapon_dir< 180)
{
	draw_order = [draw_weapon, draw_self];
}
for (var i = 0; i<array_length(draw_order); i++)
{
	draw_order[i]();
}
draw_set_color(c_black);

//right leg
//thigh
draw_line_width(r_hip_x,r_hip_y,r_knee_x,r_knee_y,12);


//calf
draw_line_width(r_knee_x, r_knee_y, r_foot_x, r_foot_y, 6);

//left leg
//thigh
draw_line_width(l_hip_x,l_hip_y,l_knee_x,l_knee_y,12);

//calf
draw_line_width(l_knee_x, l_knee_y, l_foot_x, l_foot_y, 6);


draw_set_color(c_black);
draw_line_width(r_shoulder_x,r_shoulder_y,r_elbow_x,r_elbow_y,6);
