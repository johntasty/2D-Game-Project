/// @description Insert description here
// You can write your code in this editor
if (blink)
{
	shader_set(shd_hit_flash);
	draw_self();
	shader_reset();
	if (alarm[1] == -1){
		alarm[1] = blink_duration;
	}
}else {draw_self();}