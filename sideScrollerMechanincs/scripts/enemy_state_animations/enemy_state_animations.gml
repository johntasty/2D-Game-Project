function enemy_state_idle(_sprite)
{/// @function enemy_state_idle(sprite_index)
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
		
	}
	if (_point_towards < 91 || _point_towards > 271){
			image_xscale = -1;
		}else{
			image_xscale = 1;
		}
}
function enemy_state_attacking(_sprite,_mask,_change)
{/// @function enemy_state_attacking(sprite_index,mask_index,sprite_index_change)
	if(place_meeting(x,y+spdier_ver,obj_ground)){
		while (!place_meeting(x,y+sign(spdier_ver),obj_ground))
		{	
			y = y + sign(spdier_ver);
			
		}	
		
		spdier_ver = dodge* -8;		
	}	
	y += spdier_ver;
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
		
		ds_list_clear(hit_by_attacking);
	}
	
	mask_index = _mask;
	var hit_by_attack_ = ds_list_create();
	var hits = instance_place_list(x,y,obj_player,hit_by_attack_,false);
	
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			var hitId = hit_by_attack_[|i];
			
			if (ds_list_find_index(hit_by_attacking, hitId) == -1)
			{
				ds_list_add(hit_by_attacking,hitId);
				with (hitId)
				{
					scr_got_hit(20);
				}
			}
		}
	}
	ds_list_destroy(hit_by_attack_);
	
	if (image_index > image_number -1)
	{
		mask_index = _change;
		state_enemy = enemy_state.moving;
		alarm[5] = room_speed*3;
	}
}
function enemy_state_moving(_sprite,_mask,_change)
{/// @function enemy_state_moving(sprite_index,mask_index,sprite_index_change)
	
	mask_index = _mask;
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	if(stuned == 0){		
		spd_enemy = 3;
	}else{spd_enemy = 0;}
	spd_enemy = lengthdir_x(spd_enemy,dir);	
	show_debug_message(spd_enemy);
	if place_meeting(x+spd_enemy*2,y,obj_wall){
		while(!place_meeting(round(x+sign(spd_enemy)),round(y),obj_wall)){
			x +=sign(spd_enemy);
		}	
		spd_enemy = 0;	
	}		 
	 x += spd_enemy;
	if(place_meeting(x,y+spdier_ver,obj_ground)){
		while (!place_meeting(x,y+sign(spdier_ver),obj_ground))
		{	
			y = y + sign(spdier_ver);
			
		}						
		spdier_ver = dodge* -5;		
	}	
	y += spdier_ver;
	if(spd_enemy!=0){
		if (sprite_index != _sprite){
			sprite_index = _sprite;
			image_index = 0;		
		
		}
		if (_point_towards < 91 || _point_towards > 271){
				image_xscale = -1;
			}else{
				image_xscale = 1;
		}
	}else{
		sprite_index = _change;
		image_index = 0;
		if (_point_towards < 91 || _point_towards > 271){
				image_xscale = -1;
			}else{
				image_xscale = 1;
		}
	}
}
function enemy_state_dead(_sprite)
{/// @function enemy_state_dead(sprite_index)
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
		
	}
	if (image_index > image_number -1)
	{
		instance_destroy();
	}
}