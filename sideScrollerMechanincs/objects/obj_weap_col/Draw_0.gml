/// @description Insert description here
// You can write your code in this editor
if (blink)
{
	shader_set(shd_hit_flash);
	draw_self();
	shader_reset();
	if (alarm[3] == -1){
		alarm[3] = blink_duration;
	}
}else {draw_self();}
var pc;
pc = (health_bar / max_hp) * 100;

draw_healthbar(x - sprite_width*0.5, y + sprite_height*0.5, x + sprite_width*0.5, y + sprite_height*0.6, pc, c_black, c_red, c_lime, 0, true, true)
