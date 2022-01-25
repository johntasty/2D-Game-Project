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
function gate_state_open(_sprite, _maskchange)
{/// @function enemy_state_dead(sprite_index)
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
		
	}
	if (image_index > image_number -1)
	{
		image_index = image_number -1;
		mask_index = _maskchange;
	}
}

function enemy_state_idle_npc(_sprite)
{/// @function enemy_state_idle(sprite_index)
	if(place_meeting(x,y+_ver,obj_ground)){
		while (!place_meeting(x,y+sign(_ver),obj_ground))
		{	
			y = y + sign(_ver);
			
		}						
		_ver = 0;		
	}	
	y += _ver;
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
		
	}
	if (_point_towards < 91 || _point_towards > 271){
			image_xscale = 1;
		}else{
			image_xscale = -1;
		}
}
function enemy_state_attack(_sprite,_mask,_change,_stateAfter,_stateChange,_sound)
{/// @function enemy_state_attacking(sprite_index,mask_index,sprite_index_change)
	
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
					scr_got_hit(45);
				}
			}
		}
	}
	ds_list_destroy(hit_by_attack_);
	
	if (image_index > image_number -1)
	{	
		if (!audio_is_playing(_sound)){
			audio_play_sound(_sound,0,0);
		}	
		mask_index = _change;
		_stateAfter = _stateChange;
		alarm[5] = room_speed*3;
	}
}
function enemy_state_move(_sprite,_mask,_change)
{/// @function enemy_state_moving(sprite_index,mask_index,sprite_index_change)
	if(stuned == 0){		
		spd_enemy = 3;
	}else{spd_enemy = 0;}
	mask_index = _mask;
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	
	spd_enemy = lengthdir_x(spd_enemy,dir);	
	if place_meeting(x+spd_enemy*2,y,obj_wall){
		while(!place_meeting(round(x+sign(spd_enemy)),round(y),obj_wall)){
			x +=sign(spd_enemy);
		}	
		spd_enemy = 0;	
	}		 
	 x += spd_enemy;
	if(place_meeting(x,y+_ver,obj_ground)){
		while (!place_meeting(x,y+sign(_ver),obj_ground))
		{	
			y = y + sign(_ver);
			
		}						
		_ver = 0;		
	}	
	y += _ver;
	if(spd_enemy!=0){
		if (sprite_index != _sprite){
			sprite_index = _sprite;
			image_index = 0;		
		
		}
		if (_point_towards < 91 || _point_towards > 271){
				image_xscale = 1;
			}else{
				image_xscale = -1;
		}
	}else{
		sprite_index = _change;
		image_index = 0;
		if (_point_towards < 91 || _point_towards > 271){
				image_xscale = 1;
			}else{
				image_xscale = -1;
		}
	}
}
function flame_state_create(_sprite,_mask,_stateAfter,_stateChange)
{
	mask_index = _mask;
	if (sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;		
	}
	if (image_index > image_number -1)
	{
		image_index = image_number -1;		
		var shoot = 0; 
		var enemy_detect = distance_to_object(obj_player);
		if(enemy_detect > 100 && enemy_detect < 400){
			direction = point_direction(x,y,obj_player.x,obj_player.y);	
			shoot = 1;
			var ldx = lengthdir_x(_width*0.6, direction);		
			part_type_life(global.__flame,global.__flame_lifemin,global.__flame_lifemax);
			part_type_life(global.__smoke,global.__smoke_lifemin,global.__smoke_lifemax);
			part_type_direction(global.__flame,direction -5,direction+5,0,10);
			part_type_direction(global.__smoke,direction -5,direction+5,0,10);
			part_emitter_region(global.__fire,global.__em,x+ldx,x+ldx,y-14,y-14,ps_shape_diamond,ps_distr_linear);
			part_emitter_burst(global.__fire,global.__em,global.__smoke,3);
			part_emitter_burst(global.__fire,global.__em,global.__flame,5);
			bul_type_create(bullet,x,y-14,direction,bullet_speed);
		}else{
		shoot = 0;
		_stateAfter = _stateChange;
		}		
	}
	
}