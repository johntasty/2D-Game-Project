/// @description Insert description here
// You can write your code in this editor
//impose gravity
if(verspd < 10) verspd += grav;
dir = point_direction(boss_r_shoulder, boss_r_shoulder_y, obj_player.r_shoulder_x, obj_player.r_shoulder_y);

var hit_box = collision_circle(boss_r_hand_x,boss_r_hand_y,16,obj_ground,0,1);
if (hit_box)
{
	scr_screenshake(10, 5, 0.25);	
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
	case boss_state.rampage_state: scr_rampage_state(); break;
	case boss_state.hook_state: scr_hook(); break;
}

switch(boss_phases_state)
{
	case boss_phases.phase_one: scr_boss_phase_one();
	case boss_phases.phase_two: scr_boss_phase_two();
}
if (max_health >= 80)
{
	boss_phases_state = boss_phases.phase_one;
}
if (max_health <= 79 && max_health >= 59)
{
	boss_phases_state = boss_phases.phase_two;
}

//charge attack	
if (keyboard_check_pressed(vk_f1))
{ 
	state_boss = boss_state.charging;
	alarm[2] = room_speed *2;	
}

if (keyboard_check_pressed(vk_f2)){
	state_boss = boss_state.jumping
	shake_ground = true;	
}

//attack
if (keyboard_check_released(vk_f3))
{		
	state_boss = boss_state.attacking;
}

if ((_angle >= 200 || _angle <= -200) && cooldown_attack == 0)
{
	cooldown_attack = 1;
	alarm[1] = room_speed;
}
if (keyboard_check_pressed(vk_f4))
{	
	state_boss = boss_state.hook_state;
}
if (keyboard_check(vk_f5))
{
	state_boss = boss_state.rampage_state;
}
if (keyboard_check(vk_f6)){
	state_boss = boss_state.idle;
}