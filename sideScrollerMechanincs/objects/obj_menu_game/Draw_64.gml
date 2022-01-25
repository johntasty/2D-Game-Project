/// @description 
if (global.__paused){
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,view_wport[0],view_hport[0],false);
	draw_set_alpha(1.0);
	draw_set_halign(fa_center);
	draw_set_font(fnt_menu);

	//line spacing
	var _gap = 62;
	draw_sprite(spr_menu_game,0,view_wport[0]/2, view_hport[0] * 0.4+90);
	draw_sprite(control_menu,0,view_wport[0]/4,view_hport[0] * 0.4);
	//draw menu items
		
	for (var i = 0; i < array_length_2d(menu,submenu_index_game); i++)
	{
		draw_set_color(c_white);
	
		if (i == _index )
			{
				var _spr = menu[1,i];	
				draw_sprite(real(_spr),0,view_wport[0]/2, view_hport[0] * 0.4 + _gap*i);
				draw_sprite(spr_arrow,0,view_wport[0]/2 - 85 + sin(current_time/80) , view_hport[0] * 0.4 + _gap*i - 5);
			}	
	}
	
}
if (global._saved)
{	
	draw_set_halign(fa_center);
	draw_set_font(fnt_menu);
	draw_set_color(c_white);
	draw_text(view_wport[0]/2, view_hport[0] * 0.1, "SAVED");	
}