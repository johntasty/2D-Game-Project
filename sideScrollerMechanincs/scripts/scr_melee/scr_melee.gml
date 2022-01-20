function scr_melee(){
	
	//r_hand_x = lerp(r_hand_x,r_elbow_x,0.9);
	//r_hand_y = lerp(r_hand_y,r_elbow_y + forearm_length,0.9);
			
			
	/*		
	time += timeSpeed;
	time = time mod 1;
	var direction_face = point_direction(x,y,mouse_x,mouse_y);
	if(direction_face <91 || direction_face > 275 ){
		direction_face = 1;
	}
	else{direction_face = -1;}

	var _curveStruct = animcurve_get(channel_test);
	var _channel = animcurve_get_channel(_curveStruct, "x");
	var _value = animcurve_channel_evaluate(_channel,time);

	xstart = r_shoulder_x;

	r_elbow_x = xstart +lengthdir_x(30,look_direction_draw+(_value*direction_face));
	r_hand_x = r_elbow_x + lengthdir_x(abs(cos(r_arm_move / 10)) * bicep_length, look_direction_draw+(_value*direction_face));


	//r_hand_x = xstart +lengthdir_x(80,look_direction_draw+(_value));

	var _curveStruct = animcurve_get(channel_test);
	var _channel = animcurve_get_channel(_curveStruct, "y");
	var _value = animcurve_channel_evaluate(_channel,time);
	ystart = r_shoulder_y;
	r_elbow_y = ystart + lengthdir_y(30,look_direction_draw+(_value*direction_face));
	r_hand_y = r_elbow_y - (lengthdir_y(cos(r_arm_move/10) * bicep_length, look_direction_draw+(_value*direction_face)) + sin(r_arm_move / 10) * forearm_length/2) + forearm_length/2;
	//r_hand_y = ystart +lengthdir_x(80,look_direction_draw+(_value));
	
	image_angle = look_direction_draw + (_value*direction_face) ;


	xprev = r_elbow_x;
	yprev = r_elbow_y;

	part_type_scale(obj_particle_controller.pt_flare_particles_testing, 1,2);
	part_type_orientation(obj_particle_controller.pt_flare_particles_testing, look_direction_draw+(_value*direction_face), look_direction_draw+(_value*direction_face),0, 0, 0);
	//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, _value,_value, 0, 0, 0);
	part_type_direction(obj_particle_controller.pt_flare_particles_testing,(_value*direction_face)-90,(_value*direction_face)-90,0,0);
	part_particles_create(obj_particle_controller.particle_below,xprev,yprev,obj_particle_controller.pt_flare_particles_testing,1);
		*/
		r_elbow_x = r_shoulder_x + lengthdir_x(bicep_length,look_direction_draw);
		r_elbow_y = r_shoulder_y  + (lengthdir_y( bicep_length,look_direction_draw));
		r_elbow_y = clamp(r_elbow_y, (y-displacement)-bicep_length,(y-displacement)+bicep_length);
		//right hand
		r_hand_x = r_elbow_x + lengthdir_x(bicep_length, look_direction_draw);
		r_hand_y = r_elbow_y + (lengthdir_y( bicep_length, look_direction_draw)); // + sin(r_arm_move / 10) * forearm_length/2) + forearm_length/2;
		r_hand_y = clamp(r_hand_y, (y-displacement)-(bicep_length+forearm_length),(y-displacement)+(bicep_length+forearm_length));
		
		part_type_scale(obj_particle_controller.melee_part, 1,1);
		part_type_orientation(obj_particle_controller.melee_part, look_direction_draw, look_direction_draw,0, 0, 0);
		//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, _value,_value, 0, 0, 0);
		//part_type_direction(obj_particle_controller.melee_part,(_value*direction_face)-90,(_value*direction_face)-90,0,0);
		part_particles_create(obj_particle_controller.melee_upper,r_hand_x+spd,r_hand_y+vsp,obj_particle_controller.melee_part,1);	
		
}
		
	


function scr_aim(){
		if(global.__sht) || (global.__r_sht) || (global.__r_sht_rel){
		//right arm
		r_elbow_x = r_shoulder_x + lengthdir_x(bicep_length,look_direction_draw);
		r_elbow_y = r_shoulder_y  + (lengthdir_y( bicep_length,look_direction_draw));
		r_elbow_y = clamp(r_elbow_y, (y-displacement)-bicep_length,(y-displacement)+bicep_length);
		//right hand
		r_hand_x = r_elbow_x + lengthdir_x(bicep_length, look_direction_draw);
		r_hand_y = r_elbow_y + (lengthdir_y( bicep_length, look_direction_draw)); // + sin(r_arm_move / 10) * forearm_length/2) + forearm_length/2;
		r_hand_y = clamp(r_hand_y, (y-displacement)-(bicep_length+forearm_length),(y-displacement)+(bicep_length+forearm_length));
		}
}