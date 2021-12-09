global.__bullettype = [];
global.__bullettypemax = 3;

for(var i =0; i<global.__bullettypemax; i++){
	global.__bullettype[i] = new bul_type();
	
}

#macro bullet_pistol global.__bullettype[0]
#macro bullet_shotgun global.__bullettype[1]
#macro bullet_laser global.__bullettype[2]

//pistol bullet
bul_type_set_life(bullet_pistol, -1);
bul_type_set_sprite(bullet_pistol,spr_bullet,0,0,true);

//shotgun
bul_type_set_life(bullet_shotgun, 60);
bul_type_set_sprite(bullet_shotgun,spr_bullet,0,0,true);
bul_type_set_scale(bullet_shotgun, 10, 1, 0, 0.1);
bul_type_set_color(bullet_shotgun, c_black);


//flamethrower
bul_type_set_life(bullet_laser,50);
bul_type_set_sprite(bullet_laser, spr_bullet, 0, 0,false);
bul_type_set_flame(bullet_laser,true);
bul_type_set_scale(bullet_laser, 3, 1, 0.1, 0.1);


