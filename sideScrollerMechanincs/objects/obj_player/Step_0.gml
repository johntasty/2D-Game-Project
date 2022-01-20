/// @description Insert description here

scr_input();
spd = lerp(spd, _hor * 4,0.3);
dir = point_direction(0,0,x,y);

look_direction = point_direction(x,y,mouse_x,mouse_y);

look_direction_draw = point_direction(x,y,mouse_x,mouse_y);
look_direction_arm = point_direction(x,y - 94,mouse_x,mouse_y);
if (look_direction < 90 || look_direction > 275){
		look_direction = 0;
	}
	else {
		look_direction = 180;
	}
if(!weapon){	
if(spd > 0.1 || spd < -0.1){	
	set_limps_moving(1,0,0,1);
	scr_aim();
}else {
	
	set_limps_stop (1,0,0.1,0.3);
	
	if (global.__shtpress && melee_cooldown == 0){	
					
					melee_cooldown = 1;
					//scr_melee();
					state = playerStates.attacking;
					
					alarm[1] = room_speed;}
	//scr_aim();
	}
}

switch state {
	case playerStates.idle : {
		set_limps_stop (1,0,0.1,0.3);
	}; break;	
	case playerStates.attacking : {				
		scr_melee();
	}; break;
	case playerStates.dash : {
		set_dash();
	}; break;
	
}

if (global.__dash_key && cooldown == 0){ 
	set_dash();
	//state = playerStates.dash;
	alarm[0] = room_speed;
	cooldown = 1;
}
if(vsp < 10) vsp += grv;
if (place_meeting(x,y,obj_ladder))
{	while(!place_meeting(x,y,obj_ladder))
	{
		y = y + sign(vsp);	
		
	}	
	vsp = lerp(vsp, _ver * 4,0.3);	
	grv = 0;
}else{grv = 0.3;}

if place_meeting(x+spd,y,obj_ground){
	while (!place_meeting(x+spd,y,obj_ground))
	{
		x = x + sign(spd);
	}
	
	spd = 0;

}
if(place_meeting(x,y+vsp,obj_ground) ){	
	while (!place_meeting(x,y+sign(vsp),obj_ground))
	{
		y = y+ sign(vsp);
	}	
	vsp = key_jump * - jumpspeed;
}
if place_meeting(x+spd,y,obj_wall){
	while (!place_meeting(x+spd,y,obj_wall))
	{
		x = x+ sign(spd);
	}
	spd = 0;
	
}
else if (place_meeting(x,y+vsp,obj_wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y+ sign(vsp);
		
		show_debug_message("collision");
	}	
	vsp = key_jump * - jumpspeed;
}

if (place_meeting(x,y-sprite_height*0.5,obj_ceiling)){	
	vsp += grv;
}
y += vsp;
x += spd;
//point weapon
weapon_dir = point_direction(r_elbow_x,r_elbow_y,r_hand_x,r_hand_y);

//if trigger pressed make bullets

bul_type_set_scale(bullet_pistol, 1, 1, global.__bulletsize, 0);
bul_type_set_damage (bullet_pistol,global.__bullet_dmg);

if(weapon)
{
	
	weapon.parent = id;
	if(weapon.weapon_directory == 2){
		weapon.shoot = global.__sht;
	}else{weapon.shoot = global.__shtrelease;}
	weapon.direction= weapon_dir;
	
		if (weapon.weapon_directory != 3){			
			if(spd > 0.1 || spd < -0.1){	
				set_limps_moving(1,5,1,1);
				scr_aim();
			}else {
				set_limps_stop (1,5,0.1,0.3);
				scr_aim();
			}
			
		}else{			
			if(spd > 0.1 || spd < -0.1){	
				set_limps_moving(1,5,1,1);
				if (global.__shtpress){		
					
					state = playerStates.attacking;					
					alarm[1] = room_speed;}
			}else {
				set_limps_stop (1,5,0.1,0.3);
				if (global.__shtpress && melee_cooldown == 0){	
					melee_cooldown = 1;
					state = playerStates.attacking;
					
					alarm[1] = room_speed;}
			}			
	}
	if (global.__r_sht)
	{
		global.__bulletsize += (0.2/room_speed);
		global.__bullet_dmg +=0.3;
		weapon.direction= weapon_dir;
		if (global.__bulletsize >= 0.5)
		{
			weapon.shoot = 1;
			global.__bulletsize = 0;
			global.__bullet_dmg = 5;
		}
		
	}
	if (global.__r_sht_rel)
	{
		weapon.shoot = global.__r_sht_rel;
		global.__bulletsize = 0;
		global.__bullet_dmg = 5;
	}
	
}

//weapon pick up
var weapon_list = ds_list_create();
var weapon_col = collision_circle_list(x,y,sprite_width*5,obj_weapon_par,false,true,weapon_list,true);

if (weapon_col > 0)
{
	for (var i = 0; i<weapon_col; i++){
		var w = weapon_list[|i];
		if (w == weapon){continue; }
		if(pickup) {
			//get rid of current 
			if(weapon != -1)
			{
				weapon.parent = noone;
				weapon.direction = random(360);
				weapon.speed = 5;
				weapon = -1;
			}
			//equip new
			weapon = w;
			w.parent = id;
			w.direction = weapon_dir;
			w.image_angle = weapon_dir;
			
			break;
		}
	}
}

var interact_list = ds_list_create();
var interact_col = collision_circle_list(x,y,sprite_width*5,NPC_TEST,false,true,interact_list,true);



if (interact_list > 0)
{
	for	(var i = 0; i<interact_col; i++)
	{
		var w = interact_list[|i];
		if(interact)
		{
			with(w)
			{
				scr_game_text("ethel");
			}
		}
	}
	

}


		
