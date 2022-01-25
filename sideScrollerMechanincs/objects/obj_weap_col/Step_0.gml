/// @description collision melee

switch (state_enemy)
{
	case enemy_state.idle: enemy_state_idle(spr_spideridle_strip2); break;
	case enemy_state.moving: enemy_state_moving(spr_spiderwalk_strip4,spr_spideridle_strip2,spr_spideridle_strip2); break;
	case enemy_state.attacking: enemy_state_attacking(spr_spiderattack_strip9,spider_hit_box,spr_spideridle_strip2); break;
	case enemy_state.dead: enemy_state_dead(spr_spiderdeath_strip9); break;
	
}

if (health_bar <= 0 && !dead){
	dead = true;
	state_enemy = enemy_state.dead;
}				
if(spdier_ver < 10) spdier_ver += grav;

if(distance_to_object(obj_player) > 80 && distance_to_object(obj_player) < 150){
	dodge = 1;
}else{dodge = 0;}
if (!dead){
	if collision_rectangle(x-400,y-200,x+400,y+100,obj_player,false,true){
		state_enemy = enemy_state.moving;
		if (distance_to_object(obj_player) < 5){
			state_enemy = enemy_state.attacking;
		}
	}
	else {state_enemy = enemy_state.idle;}
}
if collision_circle(x,y,32,obj_melee_bul,false,true){
	
	dir_knock = point_direction( obj_player.x, obj_player.y, x, y );
	var melee = collision_circle(x,y,32,obj_melee_bul,false,true);
	if (melee){		
		if (!audio_is_playing(slash_hit)){
			audio_play_sound(slash_hit,1,0);
		}
		if(attacked == 0){			
			knockingback = true;
			stuned = true;
			attacked = 1;						
			health_bar -= melee.damage;
			blink = true;
			alarm[2] = room_speed/6;
			alarm[0] = room_speed/2;
			alarm[1] = room_speed/2;
		}
		
		
			
	}
}


if  collision_circle(x,y,16,obj_bullet,false,true){
	var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
	if (instance_exists(bullet_int)){					
		if(bullet_int.owner != id){
			health_bar -= bullet_int.damage;
			blink = true;
			with bullet_int instance_destroy();				
		}
	}
}

if(knockingback == true){				
	x += lengthdir_x(knockback,dir_knock);	
}
