global.__bullettype = [];
global.__bullettypemax = 4;
global.__bulletsize = 0;
global.__bullet_dmg = 5
for(var i =0; i<global.__bullettypemax; i++){
	global.__bullettype[i] = new bul_type();
	
}

#macro bullet_pistol global.__bullettype[0]
#macro bullet_shotgun global.__bullettype[1]
#macro bullet_laser global.__bullettype[2]
#macro bullet_graplling global.__bullettype[3]

//pistol bullet
bul_type_set_life(bullet_pistol, -1);
bul_type_set_sprite(bullet_pistol,spr_bullet,0,0,true);
bul_type_set_scale(bullet_pistol, 1, 1, global.__bulletsize, 0);
bul_type_set_damage (bullet_pistol,global.__bullet_dmg);

//shotgun
bul_type_set_life(bullet_shotgun,20);
bul_type_set_sprite(bullet_shotgun,spr_bullet,0,0,0);
bul_type_set_radial(bullet_shotgun,5,45,true);
bul_type_set_damage(bullet_shotgun,25);
bul_type_set_scale(bullet_shotgun,1,1,0,0);
//graplling
bul_type_set_sprite(bullet_graplling,spr_graple,0,0,1);
bul_type_set_scale(bullet_graplling,1,1,0,0);
bul_type_set_life(bullet_graplling, 1);
bul_type_set_hook(bullet_graplling, true);
//flamethrower
bul_type_set_life(bullet_laser,50);
bul_type_set_sprite(bullet_laser, spr_bullet, 0, 0,false);
bul_type_set_flame(bullet_laser,true);
bul_type_set_scale(bullet_laser, 3, 1, 0.1, 0.1);
bul_type_set_damage(bullet_laser,1.5);

