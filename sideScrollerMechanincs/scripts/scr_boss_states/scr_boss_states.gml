function scr_init_boss()
{
	//moving variables
	boss_spder = 3;
	verspd = 0;
	grav = 0.3;
	//attacking
	hit_by_attack = ds_list_create();
	hit_by_overhead = ds_list_create();
	attacking_player = false;
	_angle = 0;
	_angle_rampage = 0;
	_side = 0;
	_attacks_rampage = 0;
	dazed = false;
	cooldown_attack = 0;
	jumping = false;
	jump_speed = 10;
	charge_spd = 1;
	charge_state = true;
	colission_chek = false;
	//visual indicator of hurt
	blink = false;
	blink_number = 3;
	blink_counter = 0;
	blink_duration = 3;
	hit = false;
	shake_ground = false;
	dazed = false;
	_shake = false;
	//health
	max_health = 100;
	max_bar_health = 100;

	starting_x = x;
	starting_y = y;
	//set moving parts
	r_moving = 0;
	shoulder_length = sprite_get_width(spr_mace_test);
	
	boss_r_shoulder = x;
	boss_r_shoulder_y = y - sprite_width*0.5;

	boss_r_hand_x = x;
	boss_r_hand_y = y - sprite_width*0.5;
	}
function scr_moving_state()
{
	mask_index = BossJumpAscend;
	//move towards player
	
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	if(point_towards > 10 && point_towards < 91){point_towards = 0;}
	if(point_towards > 91 && point_towards < 175){point_towards = 180;}
	boss_spd = lengthdir_x(boss_spder,point_towards);
	if (distance_to_object(obj_player) < 50 ){boss_spd = 0;}
	//check collision sideways
	
	/*if place_meeting(x+boss_spd,y,obj_ground){
		while (!place_meeting(x+boss_spd,y,obj_ground))
		{
			x += sign(boss_spd);
		}	
		
		boss_spd = 0;
		show_debug_message(boss_spd);
	}	*/
	if place_meeting(x+boss_spd,y,obj_wall73){
			while(!place_meeting(round(x+sign(boss_spd)),round(y),obj_wall73)) x +=sign(boss_spd);
			boss_spd = 0;	
		}
	x += boss_spd;
	//check collision vertical 
	if(place_meeting(x,y+verspd,obj_ground)){	
		
		while (!place_meeting(x,y+sign(verspd),obj_ground))
		{	
			jumping = false;
			if(shake_ground){ alarm[0] = room_speed/2;}
			y = y+ sign(verspd);
		}		
		verspd = jumping * - jump_speed;
		if(shake_ground && !jumping)
		{	
			state_boss = boss_state.landing;
			scr_screenshake(20, 5, 0.25);
			
		}	
	}
	
	y += verspd;
	if (boss_spd != 0){
		if (sprite_index != BossWalkCycle){
			sprite_index = BossWalkCycle;
			image_index = 0;
			//image_xscale = 1;
			if (_point_towards < 91 || _point_towards > 271){
				image_xscale = 1;
			}else{
				image_xscale = -1;
			}
			
			
		}
	}else {
		sprite_index = BossJumpAscend;
		image_index = 0;
		if (_point_towards < 91 || _point_towards > 271){
				image_xscale = 1;
			}else{
				image_xscale = -1;
			}
	}
	//set hand position
	boss_r_shoulder = (x) + lengthdir_x(1,point_towards);		
	boss_r_shoulder_y = (y-((sprite_width*0.3)*image_xscale))+lengthdir_y(1,point_towards);
	var _movearm = 0;
	r_moving += _movearm;		
		
	boss_r_hand_x = boss_r_shoulder + lengthdir_x((shoulder_length),point_towards-180);
	boss_r_hand_y = boss_r_shoulder_y  + lengthdir_y((shoulder_length),point_towards-180);

}
function scr_attacking_state()
{
	
	if (sprite_index != BossAttackHorizontal){
		sprite_index = BossAttackHorizontal;
		image_index = 0;	
		if (!audio_is_playing(boss_swing)){
			audio_play_sound(boss_swing,1,0);
			show_debug_message("play");
		}
		ds_list_clear(hit_by_attack);
	}
	
	mask_index = boss_hit_box;
	var hit_by_attack_ = ds_list_create();
	var hits = instance_place_list(x,y,obj_player,hit_by_attack_,false);
	
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			var hitId = hit_by_attack_[|i];
			
			if (ds_list_find_index(hit_by_attack, hitId) == -1)
			{
				ds_list_add(hit_by_attack,hitId);
				if (obj_player.state != playerStates.dash){
					with (hitId)
					{
						scr_got_hit(20);
					}
				}
			}
		}
	}
	ds_list_destroy(hit_by_attack_);
	
	if (image_index > image_number -1)
	{
		
		mask_index = BossJumpAscend;
		state_boss = boss_state.moving;
		alarm[6] = room_speed*3;
	}

}
function scr_charging_state()
{	mask_index = BossJumpAscend;
	
	var _boss_spd = 1;
		if (direction == 180){
			_boss_spd = -1;
		}else {_boss_spd = 1;}
		
		if(place_meeting(x+speed*_boss_spd,y,obj_wall73)){			
			speed = 0;			
			if(!_shake){
				scr_screenshake(20, 5, 0.25);				
			}
			sprite_index = BossJumpLanding;			
			image_index = 1;
			dazed = true;
			_shake = true;				
			state_boss = boss_state.dazed;			
		} 
		if(!place_meeting(x+speed*_boss_spd,y,obj_wall73)){
			if (sprite_index != BossChargeactive){
				sprite_index = BossChargeactive;
				image_index = 0;
				ds_list_clear(hit_by_attack);
			}
			_shake = false;
		}
	var hit_by_attack_ = ds_list_create();
	var hits = instance_place_list(x,y,obj_player,hit_by_attack_,false);
	
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			var hitId = hit_by_attack_[|i];
			
			if (ds_list_find_index(hit_by_attack, hitId) == -1)
			{
				ds_list_add(hit_by_attack,hitId);
				if (obj_player.state != playerStates.dash){
					with (hitId)
					{
						scr_got_hit(10);
					}
				}
			}
		}
	}
	ds_list_destroy(hit_by_attack_);
	if (charge_state){
		charge_state = false;
		move_towards_point(obj_player.x,y,8);
		
	}
}
function scr_hook()
{
	scr_hook_create(spr_graple, boss_r_shoulder, boss_r_shoulder_y, dir, 10);
	state_boss = boss_state.attacking;
	
}
 function scr_hook_create(_ind, _x, _y, dir, spd) 
 {
	 ///@func bul_type_create(bullet_id, x, y, direction, speed)
	var xx = _x + lengthdir_x(10, dir);
	var yy = _y + lengthdir_y(10, dir);
	if (instance_exists(obj_hook)){
		with(obj_hook){
			instance_destroy();
		}
	}
	var bul = instance_create_layer(xx, yy, "Instances", obj_hook);
	with(bul){
		
		owner = other.id;
	}
		
	bul.direction = dir;
	bul.image_angle = dir;
	bul.speed = spd;
 }
 function scr_rampage_state()
 {
	
	point_towards_now = point_direction(x,y,obj_player.x,obj_player.y);
	
	
	var _attck = 6;	
	var _angle_x = 1;
	if (_attacks_rampage >= 6){
		_attacks_rampage = 0;
		state_boss = boss_state.moving;
		alarm[6] = room_speed*3;}
	if (_side == 0){
		_angle_rampage += _attck;
	}else{
		
		_angle_rampage -= _attck;}
	
	if (_angle_rampage >= 200)
	{	
		_attacks_rampage += 1;
		_angle_rampage = 200;
		_side = 1;
	}
	if (_angle_rampage <= -30)
	{
		_angle_rampage = -30;
		_side = 0;
	}
	if (_angle_rampage != 0){
		if(_attacks_rampage mod 2 == 0)
		{
			_angle_x = 1;
		}else {_angle_x = -1;}
	}else{_angle_x = 1;}
	boss_r_shoulder = (x) + lengthdir_x(1,point_towards_now);		
	boss_r_shoulder_y = (y-((sprite_width*0.1)*image_xscale))+lengthdir_y(1,point_towards_now);
	
	boss_r_hand_x = boss_r_shoulder + lengthdir_x((shoulder_length),(0+_angle_rampage)*1);
	boss_r_hand_y = boss_r_shoulder_y  + lengthdir_y((shoulder_length),(0+_angle_rampage)*1);
	
	if (sprite_index != BossOverheadSwing){
		sprite_index = BossOverheadSwing;
		image_index = 0;	
		if (!audio_is_playing(boss_slam)){
			audio_play_sound(boss_slam,0,0);
		}
		ds_list_clear(hit_by_overhead);
		image_xscale = _angle_x;
	}
	mask_index = overhead_hitbox;
	var hit_by_attack_ = ds_list_create();

	var hits = instance_place_list(x,y,obj_player,hit_by_attack_,false);
	
	if (hits > 0)
	{
		
		for (var i = 0; i < hits; i++)
		{
			var hitId = hit_by_attack_[|i];
			
			if (ds_list_find_index(hit_by_overhead, hitId) == -1)
			{
				
				ds_list_add(hit_by_overhead,hitId);
				with (hitId)
				{
					
					scr_got_hit(20);
				}
			}
			
		}
	}
	ds_list_destroy(hit_by_attack_);
	
	if (image_index > image_number -1)
	{
		sprite_index = BossJumpAscend;		
	}
	
	
 }
 function scr_idle_state()
 {
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	if (sprite_index != BossJumpAscend){
		sprite_index = BossJumpAscend;
		image_index = 0;		
		
	}
	if (_point_towards < 91 || _point_towards > 271){
			image_xscale = 1;
		}else{
			image_xscale = -1;
		}
	boss_r_shoulder = (x) + lengthdir_x(1,point_towards);		
	boss_r_shoulder_y = (y-((sprite_width*0.3)*image_xscale))+lengthdir_y(1,point_towards);
	var _movearm = 0;
	r_moving += _movearm;		
		
	boss_r_hand_x = boss_r_shoulder + lengthdir_x((shoulder_length),point_towards-180);
	boss_r_hand_y = boss_r_shoulder_y  + lengthdir_y((shoulder_length),point_towards-180);
 }
 function scr_jumpin_state()
 {
	if (sprite_index != BossJumpLiftoff){
		sprite_index = BossJumpLiftoff;
		image_index = 0;
		}
	if(image_index > image_number -1)
		{
			jumping = true;
			state_boss = boss_state.moving;
			alarm[6] = room_speed*3;
	}
		
 }
 function scr_landing_state()
 {
	if (sprite_index != BossJumpLanding){
		sprite_index = BossJumpLanding;
		image_index = 0;
		}
	if(image_index > image_number -1)
		{
			state_boss = boss_state.moving;
			alarm[6] = room_speed*3;
	}
 }
 function scr_dazed_state()
 {	
	 sprite_index = BossJumpLanding;
	 image_index = 0;
	 if(dazed){
		 dazed = false;
		 charge_state = true;		
		alarm[6] = room_speed*3;
	 }
	
 }
 function scr_power_up()
 {
	var _point_towards = point_direction(x,y,obj_player.x,obj_player.y);
	if (sprite_index != chargebossstartup){
		sprite_index = chargebossstartup;
		image_index = 0;
		}
	if (_point_towards < 91 || _point_towards > 271){
			image_xscale = 1;
	}else{
			image_xscale = -1;
	}
	if(image_index > image_number -1)
		{			
			state_boss = boss_state.charging;
	}
 }