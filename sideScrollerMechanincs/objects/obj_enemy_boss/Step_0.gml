/// @description Insert description here
// You can write your code in this editor

//draw health bar
point_towards = point_direction(x,y,obj_player.x,obj_player.y);
if (distance_to_object(obj_player) < 600){
	obj_gate_boss.engaged = true;
	boss_hp_show = true;
	audio_stop_sound(Down_Town_V2);
	if (!audio_is_playing(Boss_Battle)){
	audio_play_sound(Boss_Battle,1,1);
}	
}else{boss_hp_show = false;
		audio_stop_sound(Boss_Battle);
	}
if(!boss_begin && distance_to_object(obj_player) < 600){
	boss_begin = true;
	state_boss = boss_state.moving;
}
//impose gravity
if (max_health <= 0){
	if (!audio_is_playing(boss_dying)){
		audio_play_sound(boss_dying,1,0);
	}	
	obj_gate_boss.engaged = false;
	instance_destroy();
	
}
if(verspd < 10) verspd += grav;
dir = point_direction(boss_r_shoulder, boss_r_shoulder_y, obj_player.r_shoulder_x, obj_player.r_shoulder_y);

var hit_box = collision_circle(boss_r_hand_x,boss_r_hand_y,16,obj_ground,0,1);
if (hit_box)
{
	if (object_exists(obj_enemy_boss)){
		if (!audio_is_playing(rocks_start_falling)){
			audio_play_sound(rocks_start_falling,1,0);
		}	
		obj_falling_rocks.falling_rock = true;
		scr_screenshake(10, 5, 0.25);	
	}
}

switch (state_boss)
{
	case boss_state.idle: scr_idle_state(); break;
	case boss_state.moving: scr_moving_state(); break;
	case boss_state.attacking: scr_attacking_state(); break;
	case boss_state.dazed: scr_dazed_state(); break;
	case boss_state.jumping: scr_jumpin_state(); break;
	case boss_state.landing: scr_landing_state(); break;
	case boss_state.charging: scr_charging_state(); break;
	case boss_state.power_up: scr_power_up(); break;	
	case boss_state.rampage_state: scr_rampage_state(); break;
	case boss_state.hook_state: scr_hook(); break;
}

switch(boss_phases_state)
{
	case boss_phases.phase_one: scr_boss_phase_one();
	case boss_phases.phase_two: scr_boss_phase_two();
	case boss_phases.phase_three: scr_boss_phase_three();
	case boss_phases.phase_four: scr_boss_phase_four();
}


if (max_health >= 80)
{
	
	boss_phases_state = boss_phases.phase_one;
}
if (max_health <= 79 && max_health >= 59)
{
	
	boss_phases_state = boss_phases.phase_two;
}
if (max_health <= 58 && max_health >= 28)
{	
	boss_phases_state = boss_phases.phase_three;
}
if (max_health <= 27)
{
	boss_phases_state = boss_phases.phase_four;
}


if ((_angle >= 200 || _angle <= -200) && cooldown_attack == 0)
{
	cooldown_attack = 1;
	alarm[1] = room_speed;
}
