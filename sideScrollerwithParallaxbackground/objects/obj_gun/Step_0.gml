if (keyboard_check(ord("1"))){
		guntype = gun_set_pistol;
		guntype();
		weapon_directory = 1;
		
		}
	if (keyboard_check(ord("2"))){
		guntype = gun_set_laser;
		guntype();
		weapon_directory = 2;
		}
	if (keyboard_check(ord("3"))){
		guntype = gun_set_shotgun;
		guntype();
		weapon_directory = 3;
		
		}

gun_update(); 
ui_show = false;
 if (collision_circle(x,y,sprite_width , obj_player, false , true))
 {
	ui_show = true;
 }
ui_alpha = lerp(ui_alpha, ui_show, 0.2);
