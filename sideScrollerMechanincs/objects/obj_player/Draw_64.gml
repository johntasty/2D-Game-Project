/// @description 
var _size = ds_list_size(inventory);

/*for (var i = 0; i < _size; i++)
{
	var _item = inventory[|i];
	
	var _x = 10;
	var _y = 10+30 * i;
	
	draw_text(_x, _y, string(_item));
}*/

var _xx = 20;
var _y = 32;
if(active_weapon!= noone){
	draw_sprite(spr_arm_gun,active_weapon,_xx,_y);
}