/// @description enemy that fires bullets, set the type of bullets your want
knockback = 2;
attacked = 0;
clr = c_white;
health_bar = 100;
max_hp = 100;
attack_dis = 180;
knockingback = false;
bounce_back = false;
//create type of bullet to shoot
trigger_speed = 0.1;
recoil = 50;
recoil_step = 0.2;
bullet = new bul_type();
bul_type_set_life(bullet,60);
bul_type_set_sprite(bullet, spr_bullet, 0, 0,true);
bul_type_set_scale(bullet, 1, 1, 0, 0);
bul_type_set_damage (bullet, 10);
bullet_speed = 5;

//moveable
