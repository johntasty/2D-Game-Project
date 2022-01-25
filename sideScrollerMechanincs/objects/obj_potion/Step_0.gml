/// @description Insert description here
// You can write your code in this editor
ui_show = false;
 if (collision_circle(x,y,sprite_width , obj_player, false , true))
 {
	ui_show = true;
 }
ui_alpha = lerp(ui_alpha, ui_show, 0.2);