function scr_melee(){
	
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
		var _slash = audio_play_sound(slash,1,0);
		audio_sound_pitch(_slash,0.8);	
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