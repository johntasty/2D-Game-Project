/// @description Insert description here
// You can write your code in this editor


function draw_chain ()
{
	var _originX = (obj_enemy_boss.boss_r_shoulder);
	var _originY = (obj_enemy_boss.boss_r_shoulder_y);
	
	var _chains = line_lenght / hookSize;
	var gap = line_lenght / _chains
	
	for (var i = 0; i < _chains; i++)
	{
		
		draw_sprite
		(
			spr_chain,
			0,
			_originX + lengthdir_x(i*(gap), direct_chain),
			_originY + lengthdir_y(i*(gap), direct_chain) 
		);
		
	}
}
draw_chain();
draw_self();
