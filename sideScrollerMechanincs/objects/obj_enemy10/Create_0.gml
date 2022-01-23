/// @description Insert description here
// You can write your code in this editor
clr = c_white;

max_hp = 100;
health_bar  = 100;

clr_col = c_white;
cclr_coll = c_white;

bullet = new bul_type();
bul_type_set_life(bullet,50);
bul_type_set_sprite(bullet, spr_bullet, 0, 0,false);
bul_type_set_flame(bullet,true);
bul_type_set_scale(bullet, 3, 1, 0.1, 0.1);
bul_type_set_damage (bullet, 0.2);
bullet_speed = 5;

path_start(Path1,2,path_action_reverse,true)