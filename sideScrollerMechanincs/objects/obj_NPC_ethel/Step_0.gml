ui_show = false;
 if (collision_circle(x,y,sprite_width , obj_player, false , true) && !global.inDialogue)
 {
	ui_show = true;
 }
ui_alpha = lerp(ui_alpha, ui_show, 0.2);