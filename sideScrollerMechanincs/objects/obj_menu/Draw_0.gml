/// @description

//draw the menu on  screen

draw_set_halign(fa_center);
draw_set_font(fnt_menu);

//line spacing
var _gap = 60;
draw_sprite(spr_menu,0,room_width/2, room_height * 0.4+90);
//draw menu items
for (var i = 0; i < array_length_2d(menu,submenu_index); i++)
{
	draw_set_color(c_white);
	
	if (i == menu_index )
	{
		var _spr = menu[1,i];	
		draw_sprite(real(_spr),0,room_width/2, room_height * 0.4 + _gap*i);
		draw_sprite(spr_arrow,0,room_width/2 - 85 + sin(current_time/80) , room_height * 0.4 + _gap*i - 5);
	}
	
}
