/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_enemy,-1,x,y,1,1,0,clr,1);

var pc;
pc = (health_bar / max_hp) * 100;
draw_healthbar(x - sprite_width*0.5, y + sprite_height*0.5, x + sprite_width*0.5, y + sprite_height*0.5, pc, c_black, c_red, c_lime, 0, true, true)
