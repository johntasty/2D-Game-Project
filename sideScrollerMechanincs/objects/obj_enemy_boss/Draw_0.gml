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
//draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);

if (boss_hp_show){
	draw_sprite_stretched(healthbar3,0,x-(health_bar_boss_width/2)+5, y-200, (max_health/max_bar_health)*health_bar_boss_width,health_bar_boss_height);
	
}
//draw_circle(boss_r_shoulder,boss_r_shoulder_y,6,false);

//draw_sprite_ext(spr_mace_test,1,boss_r_shoulder,boss_r_shoulder_y,1,1,point_towards_draw,image_blend,image_alpha);