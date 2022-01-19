function set_limps (_yy,__xx,should_x,_bcl, _frl, _thl, _cll)
{
	///@ function set_limps (shoulders_placement, hips_placement,biceplength, forearm_length, thigh_length, calf_legth)
	
	//arms
	displacement =   _yy;
	hip_place = __xx;
	bicep_length = _bcl;
	forearm_length = _frl;
	shoulder_dis = should_x;
	//legs
	thigh_length = _thl;
	calf_length = _cll;
	
	r_arm_move = 0;
	r_shoulder_x = x;
	r_shoulder_y = y-displacement;
	r_elbow_x = x;
	r_elbow_y = y-displacement;
	r_hand_x = x;
	r_hand_y = y-displacement;
	//left arm
	l_arm_move = 90;
	l_shoulder_x = x;
	l_shoulder_y = y-displacement;
	l_elbow_x = x;
	l_elbow_y = y-displacement;
	l_hand_x = x;
	l_hand_y = y-displacement;

	

	//right leg
	r_move = 0;

	r_hip_x = x;
	r_hip_y = y - hip_place;
	r_knee_x = x;
	r_knee_y = y - hip_place;
	r_foot_x = x;
	r_foot_y = y - hip_place;

	//left leg
	l_move = 90;

	l_hip_x = x;
	l_hip_y = y - hip_place;
	l_knee_x = x;
	l_knee_y = y - hip_place;
	l_foot_x = x;
	l_foot_y = y - hip_place;

}
function set_limps_moving (_armspeed, _shoulder, _hip,_legspeed )
{
	///@function set-limps_moving (arm_movement, space_between_shoulders, space_between_hips, speed_legs)
		var _movearm = _armspeed;
		r_arm_move += _movearm;
		l_arm_move += _movearm;
	
		//shoulder
		var _shoulderoffset = _shoulder;
		r_shoulder_x = (x ) + lengthdir_x(_shoulderoffset,look_direction);		
		r_shoulder_y = (y+(vsp/2)-displacement)+lengthdir_y(_shoulderoffset,look_direction);
	
		l_shoulder_x = (x) + lengthdir_x(_shoulderoffset+shoulder_dis,look_direction);
		l_shoulder_y = (y+(vsp/2)-displacement) - lengthdir_y(_shoulderoffset,look_direction);
		
		//right arm
		r_elbow_x = r_shoulder_x + lengthdir_x(cos(r_arm_move/10) * bicep_length,look_direction);
		r_elbow_y = r_shoulder_y  + lengthdir_y(cos(r_arm_move/10)* bicep_length,look_direction) + bicep_length;
		r_elbow_y = clamp(r_elbow_y, (y-displacement)-bicep_length,(y-displacement)+bicep_length);
		
		
		//right hand
		r_hand_x = r_elbow_x + lengthdir_x(abs(cos(r_arm_move / 10)) * bicep_length, look_direction);
		r_hand_y = r_elbow_y - (lengthdir_y(cos(r_arm_move/10) * bicep_length, look_direction) + sin(r_arm_move / 10) * forearm_length/2) + forearm_length/2;
		r_hand_y = clamp(r_hand_y, (y-displacement)-(bicep_length+forearm_length),(y-displacement)+(bicep_length+forearm_length));
		
		
		//left arm
		l_elbow_x = l_shoulder_x + lengthdir_x(cos(l_arm_move/10) * bicep_length,look_direction);
		l_elbow_y = l_shoulder_y  + lengthdir_y(cos(l_arm_move/10)* bicep_length,look_direction) + bicep_length;
		l_elbow_y = clamp(l_elbow_y, (y-displacement)-bicep_length,(y-displacement)+bicep_length);
		//right hand
		l_hand_x = l_elbow_x + lengthdir_x(abs(cos(l_arm_move / 10)) * bicep_length, look_direction);
		l_hand_y = l_elbow_y - (lengthdir_y(cos(l_arm_move/10) * bicep_length, look_direction) + sin(l_arm_move / 10) * forearm_length/2) + forearm_length/2;
		l_hand_y = clamp(l_hand_y, (y-displacement)-(bicep_length+forearm_length),(y-displacement)+(bicep_length+forearm_length));
		//arm shoot
		
		//legs move

		var _movespd = _legspeed;
		r_move += _movespd;
		l_move += _movespd;
	
		//hips
		var _hipoffset = _hip;
		r_hip_x = x+lengthdir_x(_hipoffset+(shoulder_dis/1.5),look_direction );
		r_hip_y = (y+vsp-hip_place)+lengthdir_y(_hipoffset,look_direction );
		
		l_hip_x = x-lengthdir_x(_hipoffset-(shoulder_dis/3),look_direction);
		l_hip_y = (y+vsp-hip_place)-lengthdir_y(_hipoffset,look_direction );
	
		// right leg
		//knee
		r_knee_x = r_hip_x + lengthdir_x(cos(r_move/10) * thigh_length,look_direction);
		r_knee_y = r_hip_y + lengthdir_y(cos(r_move/10)* thigh_length,look_direction) + thigh_length;
		r_knee_y = clamp(r_knee_y, r_hip_y-thigh_length, r_hip_y+thigh_length);

		//foot
		r_foot_x = r_knee_x - lengthdir_x(abs(cos(r_move / 10)) * calf_length, look_direction);
		r_foot_y = r_knee_y + (lengthdir_y(cos(r_move/10) * calf_length, look_direction) + sin(r_move / 10) * calf_length/2) + calf_length/2;
		r_foot_y = clamp(r_foot_y, r_hip_y-(thigh_length+calf_length), r_hip_y+(thigh_length+calf_length));
	
		// left leg
		//knee
		l_knee_x = l_hip_x + lengthdir_x(cos(l_move/10) * thigh_length,look_direction);
		l_knee_y = l_hip_y + lengthdir_y(cos(l_move/10)* thigh_length,look_direction) + thigh_length;
		l_knee_y = clamp(l_knee_y,  l_hip_y-thigh_length, l_hip_y+thigh_length);

		//foot
		l_foot_x = l_knee_x - lengthdir_x(abs(cos(l_move / 10)) * calf_length, look_direction);
		l_foot_y = l_knee_y + (lengthdir_y(cos(l_move/10) * calf_length, look_direction) + sin(l_move / 10) * calf_length/2) + calf_length/2;
		l_foot_y = clamp(l_foot_y, l_knee_y-(thigh_length+calf_length), l_knee_y+(thigh_length+calf_length));
}
function set_limps_stop (_shoulder,_hip,_armlerp,_leglerp)
{
	///@function set_limps_stop (shoulder_whenstop,hip_when_stop,speed_off_stoping_legs,speed_of_stoping_arms)


	//make hands stop moving
	var _shoulderoffset = _shoulder;
	r_shoulder_x = (x)+lengthdir_x(_shoulderoffset,look_direction );
	r_shoulder_y = (y+(vsp/2)-displacement)+lengthdir_y(_shoulderoffset,look_direction );
	
	l_shoulder_x = (x)+lengthdir_x(_shoulderoffset+shoulder_dis,look_direction );
	l_shoulder_y = (y+(vsp/2)-displacement)-lengthdir_y(_shoulderoffset,look_direction);

	var _lerpspd = _armlerp;
	r_elbow_x = lerp(r_elbow_x,r_shoulder_x,_lerpspd);
	r_elbow_y = lerp(r_elbow_y,r_shoulder_y + bicep_length,_lerpspd);
	
	r_hand_x = lerp(r_hand_x,r_elbow_x,_lerpspd);
	r_hand_y = lerp(r_hand_y,r_elbow_y + forearm_length,_lerpspd);
	
	l_elbow_x = lerp(l_elbow_x,l_shoulder_x,_lerpspd);
	l_elbow_y = lerp(l_elbow_y,l_shoulder_y + bicep_length,_lerpspd);
	
	l_hand_x = lerp(l_hand_x,l_elbow_x,_lerpspd);
	l_hand_y = lerp(l_hand_y,l_elbow_y + forearm_length,_lerpspd);
		
	//make legs stop moving
	var _hipoffset = _hip;
	r_hip_x = x+lengthdir_x(_hipoffset+(shoulder_dis/1.5),look_direction);
	r_hip_y = (y+vsp-hip_place)+lengthdir_y(_hipoffset,look_direction );
	
	l_hip_x = x-lengthdir_x(_hipoffset-(shoulder_dis/3),look_direction );
	l_hip_y = (y+vsp-hip_place)-lengthdir_y(_hipoffset,look_direction);
	var _lerpspd = _leglerp;
	r_knee_x = lerp(r_knee_x,r_hip_x,_lerpspd);
	r_knee_y = lerp(r_knee_y,r_hip_y + thigh_length,_lerpspd);
	
	r_foot_x = lerp(r_foot_x,r_knee_x,_lerpspd);
	r_foot_y = lerp(r_foot_y,r_knee_y + calf_length,_lerpspd);
	
	l_knee_x = lerp(l_knee_x,l_hip_x,_lerpspd);
	l_knee_y = lerp(l_knee_y,l_hip_y + thigh_length,_lerpspd);
	
	l_foot_x = lerp(l_foot_x,l_knee_x,_lerpspd);
	l_foot_y = lerp(l_foot_y,l_knee_y + calf_length,_lerpspd);	
}