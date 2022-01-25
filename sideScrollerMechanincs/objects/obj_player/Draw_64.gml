/// @description 
var _size = ds_list_size(inventory);

/*for (var i = 0; i < _size; i++)
{
	var _item = inventory[|i];
	
	var _x = 10;
	var _y = 10+30 * i;
	
	draw_text(_x, _y, string(_item));
}*/

var _xx = 202;
var _y = 32;
if (_size == 1 && active_weapon == 3)
{
	draw_sprite(inventory_melee,0,_xx,_y);
}
else if(active_weapon!= noone){
	if (active_weapon == 3){
		draw_sprite(inventory_meleeSelect,0,_xx,_y);
	}
	if(active_weapon == 2)
	{
		draw_sprite(inventory_gunSelect,0,_xx,_y);
	}
}
var _x = 20;
var _yy = 32;
draw_sprite_ext(dash,0,_x,_yy,1,1,0,image_blend,global.__cooldown/10)




