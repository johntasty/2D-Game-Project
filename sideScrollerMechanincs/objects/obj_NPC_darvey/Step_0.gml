ui_show = false;
 if (collision_circle(x,y,sprite_width , obj_player, false , true) && !global.inDialogue)
 {
	ui_show = true;
 }
ui_alpha = lerp(ui_alpha, ui_show, 0.2);

if (health_bar <= 0 && !dead){
	dead = true;
	global.darveyDead = false;
	instance_destroy();
}	
if(_ver < 10) _ver += grav;
switch (darvey_state)
{
	case enemyState.idle: enemy_state_idle_npc(Darveybewalkingtho); break;
	case enemyState.walking: enemy_state_move(Darveybewalkingtho,Darveybewalkingtho,Darveybewalkingtho); break;
	case enemyState.attacking: enemy_state_attack(DarveyAcidAttackMelee,darvey_hit_box,Darveybewalkingtho,darvey_state,enemyState.walking); break;	
}
if (global.darveyFight)
{
	if collision_rectangle(x-400,y-200,x+400,y+100,obj_player,false,true){
			darvey_state = enemyState.walking;
			if (distance_to_object(obj_player) < 65){
				darvey_state = enemyState.attacking;
			}
		}
	else {darvey_state = enemyState.idle;}

	if collision_circle(x,y,32,obj_melee_bul,false,true){	
		dir_knock = point_direction( obj_player.x, obj_player.y, x, y );
		var melee = collision_circle(x,y,32,obj_melee_bul,false,true);
		if (melee){		
			if(attacked == 0){			
				attacked = 1;						
				health_bar -= (melee.damage/3);
				blink = true;
				alarm[0] = room_speed/2;
			}
		
		
			
		}
	}

	if  collision_circle(x,y,16,obj_bullet,false,true){
		var bullet_int = collision_circle(x,y,32,obj_bullet,1,1);
		if (instance_exists(bullet_int)){					
			if(bullet_int.owner != id){
				health_bar -= bullet_int.damage;
				blink = true;
				with bullet_int instance_destroy();				
			}
		}
	}
}
