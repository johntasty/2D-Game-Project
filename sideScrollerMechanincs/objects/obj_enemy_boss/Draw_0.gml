/// @description Insert description here
// You can write your code in this editor
//point_towards_draw = point_direction(boss_r_shoulder,boss_r_shoulder_y,boss_r_hand_x,boss_r_hand_y);

if (blink)
{
	shader_set(shd_hit_flash);
	draw_self();
	shader_reset();
	if (alarm[3] == -1){
		alarm[3] = blink_duration;
	}
}else {draw_self();}
//draw_circle(boss_r_shoulder,boss_r_shoulder_y,6,false);

//draw_sprite_ext(spr_mace_test,1,boss_r_shoulder,boss_r_shoulder_y,1,1,point_towards_draw,image_blend,image_alpha);