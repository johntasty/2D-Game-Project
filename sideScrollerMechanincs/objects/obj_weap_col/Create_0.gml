/// @description Enemy that follows for melee attacks
knockback = 2;
stuned = false;
attacked = 0;
health_bar = 100;
max_hp = 100;
spd_enemy = 3;
knockingback = false;
dodge = 0;
blink = false;
blink_number = 3;
blink_counter = 0;
blink_duration = 3;

spdier_ver = 0;
grav = 0.3;
dead = false;
hit_by_attacking = ds_list_create();
state_enemy = enemy_state.idle;
attacking_player_ = true;
enum enemy_state 
{
	idle,
	moving,
	attacking,
	dead
}