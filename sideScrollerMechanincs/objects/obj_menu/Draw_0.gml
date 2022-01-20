/// @description

//draw the menu on  screen

draw_set_halign(fa_center);
draw_set_font(fnt_menu);

//line spacing
var _gap = 40;

//draw menu items
for (var i = 0; i < array_length_2d(menu,submenu_index); i++)
{
	draw_set_color(c_white);
	
	if i == menu_index draw_set_color(c_teal);
	
	draw_text(room_width/2, room_height * 0.4 + _gap*i, menu[submenu_index,i]);
}
