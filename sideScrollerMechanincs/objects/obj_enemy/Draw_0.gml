/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_enemy,-1,x,y,1,1,0,clr,1);
draw_circle_color(x,y,360,clr_col,cclr_coll,6);
var pc;
pc = (health_bar / max_hp) * 100;
draw_healthbar(x - sprite_width*0.5, y + sprite_height*0.5, x + sprite_width*0.5, y + sprite_height*0.5, pc, c_black, c_red, c_lime, 0, true, true)

/*var draw_weapon = function()
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