
function scr_boss_phase_one(){
	if (boss_phases_state == boss_phases.phase_one){
		if ((distance_to_object(obj_player) < 100 ) && !attacking_player)
		{
			attacking_player = true;
			//alarm[6] = room_speed*4;
			var _attack = choose(1,2);
			switch (_attack)
			{
				case 1: 
					state_boss = boss_state.jumping; 
					shake_ground = true; break;
				case 2: state_boss = boss_state.attacking; break;
			
			}		
		}
	}
}

function scr_boss_phase_two()
{
	if (boss_phases_state == boss_phases.phase_two){
	if ((distance_to_object(obj_player) < 100 ) && !attacking_player)
	{
		attacking_player = true;
		//alarm[6] = room_speed*4;
		var _attack = choose(1,1,2,2,2,2,3,3,3,4);
		_attack_ = _attack;
		switch (_attack_)
		{
			case 1: 
					state_boss = boss_state.jumping; 
					shake_ground = true; break;
			case 2: state_boss = boss_state.attacking; break;
			case 3: state_boss = boss_state.power_up;  break;
			case 4: state_boss = boss_state.rampage_state; break;
		}		
	}
	}
}
function scr_boss_phase_three()
{
	if (boss_phases_state == boss_phases.phase_three){
		if (distance_to_object(obj_player) > 250 && (distance_to_object(obj_player) < 400) && !attacking_player)
		{
			attacking_player = true;
			state_boss = boss_state.hook_state;
		}
		if ((distance_to_object(obj_player) < 100 ) && !attacking_player)
		{
			attacking_player = true;
			//alarm[6] = room_speed*4;
			var _attack = choose(1,1,1,2,2,2,2,2,3,3,3,4,4);
			_attack_ = _attack;
		
			switch (_attack_)
			{
				case 1: 
						state_boss = boss_state.jumping; 
						shake_ground = true; break;
				case 2: state_boss = boss_state.attacking; break;
				case 3: state_boss = boss_state.power_up;  break;
				case 4: state_boss = boss_state.rampage_state; break;
				case 5: state_boss = boss_state.hook_state; break;
			}		
		}
	}
}
function scr_boss_phase_four()
{
	if (boss_phases_state == boss_phases.phase_four){
		if (distance_to_object(obj_player) > 250 && (distance_to_object(obj_player) < 400) && !attacking_player)
		{
			attacking_player = true;
			state_boss = boss_state.hook_state;
		}
		if ((distance_to_object(obj_player) < 100 ) && !attacking_player)
		{
			attacking_player = true;
			//alarm[6] = room_speed*4;
			var _attack = choose(1,1,1,1,2,2,2,3,3);
			_attack_ = _attack;

			switch (_attack_)
			{
			
				case 1: state_boss = boss_state.attacking; break;
				case 2: state_boss = boss_state.power_up;  break;
				case 3: state_boss = boss_state.rampage_state; break;
				case 4: state_boss = boss_state.hook_state; break;
			}		
		}
	}
}