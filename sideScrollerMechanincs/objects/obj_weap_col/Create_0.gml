/// @description Enemy that follows for melee attacks
knockback = 5;
stuned = 0;
attacked = 0;
health_bar = 100;
max_hp = 100;
spd_enemy = 2;
knockingback = false;

blink = false;
blink_number = 3;
blink_counter = 0;
blink_duration = 3;

verspd = 0;
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