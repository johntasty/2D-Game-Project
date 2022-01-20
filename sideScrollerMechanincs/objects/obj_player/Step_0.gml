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
if(weapon == -1){	
if(spd > 0.1 || spd < -0.1){	
	set_limps_moving(1,0,0,1);
	scr_aim();
	
}else {
	
	set_limps_stop (1,0,0.1,0.3);	
	scr_aim();
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
if(vsp <= 10) vsp += grav;
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
if place_meeting(x+spd,y,obj_wall){
	while (!place_meeting(x+spd,y,obj_wall))
	{
		x = x+ sign(spd);
	}
	spd = 0;	
}
x += spd;
if(place_meeting(x,y+vsp,obj_ground) ){	
	while (!place_meeting(x,y+sign(vsp),obj_ground))
	{
		y = y + sign(vsp);
		
	}	
	vsp = key_jump * - jumpspeed;
}

if (place_meeting(x,y+vsp,obj_wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
		
		
	}	
	vsp = key_jump * - jumpspeed;
}

y += vsp;
global.__spdex = spd;
global.__vsdex = vsp;

//point weapon
weapon_dir = point_direction(r_elbow_x,r_elbow_y,mouse_x,mouse_y);


//if trigger pressed make bullets

bul_type_set_scale(bullet_pistol, 1, 1, global.__bulletsize, 0);
bul_type_set_damage (bullet_pistol,global.__bullet_dmg);

if(weapon)
{
	
	active_weapon = (weapon.image_index);
	weapon.parent = id;
	if(weapon.weapon_directory == 2){
		weapon.shoot = global.__sht;
	}else if(weapon.weapon_directory == 3){
		
		weapon.shoot =global.__shtpress;
	}		
	else{
		weapon.shoot = global.__shtrelease;
		}
	weapon.direction= weapon_dir;
	
	if (weapon.weapon_directory != 3){
		weapon_hook = false;
		if(spd > 0.1 || spd < -0.1){	
			set_limps_moving(1,0,0,1);
			scr_aim();
		}else {
			set_limps_stop (1,0,0.1,0.3);
			scr_aim();
		}
			
	}else{		
		weapon_hook = true;
		if(spd > 0.1 || spd < -0.1){	
			set_limps_moving(1,0,1,1);
			if (global.__shtpress && melee_cooldown == 0){	
					
				melee_cooldown = 1;					
				state = playerStates.attacking;					
				alarm[1] = room_speed/30;
			}
			/*if (global.__r_sht_hook && melee_cooldown == 0){					
					active = true;					
					scr_aim();
					bul_type_create(bullet_graplling, r_elbow_x, r_elbow_y , weapon_dir, 20);
				}*/
			}else {
				set_limps_stop (1,3,0.1,0.3);
				if (global.__shtpress && melee_cooldown == 0){	
					
					melee_cooldown = 1;					
					state = playerStates.attacking;					
					alarm[1] = room_speed/30;
					}
				/*if (global.__r_sht_hook && melee_cooldown == 0){
					active = true;
					scr_aim();
					bul_type_create(bullet_graplling, r_elbow_x, r_elbow_y , weapon_dir, 20);
				}*/if(global.__r_sht_rel) {active = false;}		
			}			
	}
	if (weapon.weapon_directory == 1){
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
}


//weapon pick up
var weapon_list = ds_list_create();
var weapon_col = collision_circle_list(x,y,sprite_width*0.5,obj_weapon_par,false,true,weapon_list,true);

if (weapon_col > 0)
{
	for (var i = 0; i<weapon_col; i++){
		var w = weapon_list[|i];
		
		if (w == weapon){continue; }
		if(pickup) {			
			//var _size = ds_list_size(inventory);			
			w.parent = id;

			var _find = ds_list_find_index(inventory,w);	
			if (_find == -1){
				ds_list_add(inventory,w);
			}
			if (ds_list_empty(inventory)){
				ds_list_add(inventory,w);
			}			
			
			break;
		}
		
	}
	
}


if (!ds_list_empty(inventory)){
	if(keyboard_check(ord("1"))){
		weapon = inventory[|0];
				
	}
	if(keyboard_check(ord("2")) && !ds_list_find_index(inventory,1)){
		weapon = inventory[|1];	
		
	}
	if(keyboard_check(ord("3"))&& !ds_list_find_index(inventory,2)){
		weapon = inventory[|2];		
	
	}
}

		
