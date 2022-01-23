/// @description enemy that fires bullets, set the type of bullets your want
knockback = 5;
attacked = 0;
clr = c_white;
health_bar = 100;
max_hp = 100;
attack_dis = 180;
knockingback = false;
bounce_back = false;
//create type of bullet to shoot
bullet = new bul_type();
bul_type_set_life(bullet,50);
bul_type_set_sprite(bullet, spr_bullet, 0, 0,false);
bul_type_set_flame(bullet,true);
bul_type_set_scale(bullet, 3, 1, 0.1, 0.1);
bul_type_set_damage (bullet, 0.2);
bullet_speed = 5;