ui_show = false;
ui_alpha = 0;
npcName = "darveyStage1";

//set variables 
darvey_state = enemyState.idle;

stuned = false;
attacked = 0;
health_bar = 100;
max_hp = 100;
spd_enemy = 3;

blink = false;
blink_number = 3;
blink_counter = 0;
blink_duration = 3;

grav = 0.3;
_ver = 0;
dead = false;
hit_by_attacking = ds_list_create();
attacking_player_ = true;