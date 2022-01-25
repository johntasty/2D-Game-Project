ui_show = false;
ui_alpha = 0;
npcName = "harvey";

//set variables 
harvey_state = enemyState.idle;

stuned = false;
attacked = 0;
health_bar = 100;
max_hp = 100;
spd_enemy = 3;

fighting = global.harveyFight;
fin = global.harveyFin;

blink = false;
blink_number = 3;
blink_counter = 0;
blink_duration = 3;

grav = 0.3;
_ver = 0;
dead = false;
hit_by_attacking = ds_list_create();
attacking_player_ = true;

//flamethrower
bullet = new bul_type();
bul_type_set_life(bullet,50);
bul_type_set_sprite(bullet, spr_bullet, 0, 0,0);
bul_type_set_flame(bullet,false);
bul_type_set_scale(bullet, 3, 1, 0.1, 0.1);
bul_type_set_damage (bullet, 0.2);
bullet_speed = 5;
_width = sprite_get_width(harvey_mask);