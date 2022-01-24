/// @description boss variables
scr_init_boss();
boss_hp_show = false;
health_bar_boss_width = 400;
health_bar_boss_height = 30;

state_boss = boss_state.moving;

boss_phases_state = noone;
enum boss_phases 
{
	phase_one,
	phase_two,
	phase_three,
	phase_four
}
enum boss_state 
{
	idle,
	moving,
	attacking,
	dazed,
	jumping,
	landing,
	charging,
	power_up,
	smash_attack,
	rampage_state,
	hook_state
}