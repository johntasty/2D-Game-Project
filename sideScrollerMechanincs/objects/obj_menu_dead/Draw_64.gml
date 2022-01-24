/// @description 
if (global.__dead){
	
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,view_wport[0],view_hport[0],false);
	draw_set_alpha(1.0);
	draw_set_halign(fa_center);
	draw_set_font(fnt_menu);

	//line spacing
	var _gap = 40;

	//draw menu items
	for (var i = 0; i < array_length_1d(menu_dead); i++)
	{
		draw_set_color(c_white);
	
		if i == _index draw_set_color(c_teal);
	
		draw_text(view_wport[0]/2, view_hport[0] * 0.3 + _gap*i, menu_dead[i]);
	}
}
