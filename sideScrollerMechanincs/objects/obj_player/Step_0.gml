/// @description Insert description here
// You can write your code in this editor

var _hor = (keyboard_check(ord("D")) - keyboard_check(ord("A")) );
key_jump = keyboard_check_pressed(vk_space);
var pickup = keyboard_check_pressed(ord("F"));
global.__sht = mouse_check_button(mb_left);
var r_sht = mouse_check_button(mb_right);
var r_sht_rel = mouse_check_button_released(mb_right);
hspeed = lerp(hspeed, _hor * 4,0.3);

if(vsp < 10) vsp += grv;
if(place_meeting(obj_player.x,obj_player.y + 20,obj_ground)){	
		vsp = key_jump * - jumpspeed;	
}
if place_meeting(x+hspeed,y,obj_wall){
	while (!place_meeting(x+hspeed,y,obj_wall))
	{
		x = x+ sign(hspeed);
	}
	hspeed = 0;
}
if place_meeting(x,y+vsp,obj_wall){
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y+ sign(vsp);
	}
	vsp = 0;
}
y += vsp;
//point weapon
weapon_dir = point_direction(x,y,mouse_x,mouse_y);
dirc = point_direction(x,y,mouse_x,mouse_y);
//if trigger pressed make bullets
bul_type_set_scale(bullet_pistol, 1, 1, global.__bulletsize, 0);

if(weapon)
{
	weapon.parent = id;
	weapon.shoot = global.__sht;
	weapon.direction= weapon_dir;
	if (r_sht)
	{
		global.__bulletsize += (0.2/room_speed);
		show_debug_message(global.__bulletsize);
		if (global.__bulletsize >= 0.5)
		{
			weapon.shoot = 1;
			global.__bulletsize = 0;
		}
		
	}
	if (r_sht_rel)
	{
		weapon.shoot = r_sht_rel;
		global.__bulletsize = 0;
	}
	
}

//weapon pick up
var weapon_list = ds_list_create();
var weapon_col = collision_circle_list(x,y,sprite_width*0.5,obj_weapon_par,false,true,weapon_list,true);
if (weapon_col > 0){
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





look_direction = point_direction(x,y,mouse_x,mouse_y);
look_direction_arm = point_direction(x,y,mouse_x,mouse_y);
if (look_direction < 90 || look_direction > 275){
		look_direction = 0;
	}
	else {
		look_direction = 180;
	}


	
if(keyboard_check(ord("D")) || keyboard_check(ord("A"))){
	
	set_limps_moving(1,1,1,2);
		
		
}else {
	set_limps_stop (1,1,0.1,0.3);
}

