/// @description 
var _grv = random(_grav)

if(_vsp <= 10) _vsp += _grv;
var hit_by_attack_ = ds_list_create();
var hits = instance_place_list(x,y,obj_player,hit_by_attack_,false);
	
if (hits > 0)
{
	for (var i = 0; i < hits; i++)
	{
		var hitId = hit_by_attack_[|i];
		
		if (ds_list_find_index(hit_by_rock, hitId) == -1)
		{
			ds_list_add(hit_by_rock,hitId);
			with (hitId)
			{
				scr_got_hit(5);
			}
		}
	}
}
	ds_list_destroy(hit_by_attack_);
if(place_meeting(x,y+_vsp,obj_ground) ){
	if (!audio_is_playing(rock_hit)){
	audio_play_sound(rock_hit,0,0);
}	
	while (!place_meeting(x,y+sign(_vsp),obj_ground))
	{
		y = y + sign(_vsp);
		
	}
	repeat(5){
	part_particles_create(obj_particle_controller.dust,x,y+sprite_height*0.5,obj_particle_controller.dust_part,1);
	}
	ds_list_clear(hit_by_rock);
	instance_destroy();	
}
y += _vsp;