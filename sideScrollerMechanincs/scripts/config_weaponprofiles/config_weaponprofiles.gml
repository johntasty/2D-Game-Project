function gun_set_pistol()
{
	gun_set(spr_arm_gun,0,bullet_pistol,20,0.2,10);
}
function gun_set_shotgun()
{
	gun_set(spr_arm_gun,1,bullet_shotgun,8,0.1,20);
}
function gun_set_laser()
{
	gun_set(spr_arm_gun,2,bullet_laser,10,0,0);	
	global.__flame_lifemin = 40;
	global.__flame_lifemax = 50;
	global.__smoke_lifemin = 50;
	global.__smoke_lifemax = 60;
	global.__fire = part_system_create();
	global.__flame = part_type_create();
	global.__smoke = part_type_create();
	//global.__smoke = part_type_create();
	dirc = 0;

	global.__em = part_emitter_create(global.__fire);
	//part_type_sprite(global.__flame,spr_fire,false,false,false);
	part_type_color3(global.__flame,c_white,c_orange,c_red);
	part_type_life(global.__flame,global.__flame_lifemin,global.__flame_lifemax);
	part_type_direction(global.__flame,direction-5,direction+5,0,0); 
	part_type_shape(global.__flame,pt_shape_sphere);
	part_type_speed(global.__flame,10,12,0,0.25);
	part_type_size(global.__flame,0.15,0.3,0.014,0.003);
	part_type_alpha3(global.__flame,0.2,1,0);
	part_type_blend(global.__flame,1);	
	
	part_type_color2(global.__smoke,c_gray,c_black);
	part_type_life(global.__smoke,global.__smoke_lifemin,global.__smoke_lifemax);
	part_type_direction(global.__smoke,dirc-1,dirc+1,0,0); 
	part_type_shape(global.__smoke,pt_shape_smoke);
	part_type_speed(global.__smoke,9,11,0,0.25);
	part_type_size(global.__smoke,0.15,0.2,0.016,0.003);
	part_type_alpha3(global.__smoke,1,0.8,0);
	part_type_blend(global.__smoke,0);	
	
	
		
}
