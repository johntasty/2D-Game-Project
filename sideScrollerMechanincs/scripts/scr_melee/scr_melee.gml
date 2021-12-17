function scr_melee(){
	
			var attack_frames = 1;				
			var bicep_arc = bicep_length
			
			global.__particle += room_speed/60;
			
		for (var i = 0; i < attack_frames; i++){
			var _lerpspdpunch = 0.2;
			//right arm
				r_elbow_x = lerp(r_elbow_x,r_shoulder_x + (lengthdir_x(bicep_arc*2,look_direction_arm)),_lerpspdpunch);
				r_elbow_y = lerp(r_elbow_y, r_shoulder_y+(lengthdir_y( bicep_arc*2,look_direction_arm)),_lerpspdpunch);
				//r_elbow_y = clamp(r_elbow_y, (y-displacement)-bicep_arc,(y-displacement)+bicep_arc);
				//right hand
				r_hand_x = lerp(r_hand_x, r_elbow_x + lengthdir_x(bicep_arc*2, look_direction_arm),_lerpspdpunch);
				r_hand_y = lerp(r_hand_y, r_elbow_y + (lengthdir_y( bicep_arc*2, look_direction_arm)),_lerpspdpunch);	
				//r_hand_y = clamp(r_hand_y, (y-displacement)-(bicep_arc*2+forearm_length),(y-displacement)+(bicep_arc*2+forearm_length));
				
				bicep_arc -= i;
				
				
				
				
			}	
			/*curvePosition += curveSpeed;
			curvePosition = curvePosition mod 1;
			
			var curveStruct = animcurve_get(curveAsset);
			var _channel = animcurve_get_channel(curveStruct,"x");
			var _value = animcurve_channel_evaluate(_channel,curvePosition);
			xstart = r_hand_x
			r_hand_x = xstart + lengthdir_x(_value,look_direction_arm);
			show_debug_message(lengthdir_x(_value,look_direction_arm));
			var _channel = animcurve_get_channel(curveStruct,"y");
			var _value = animcurve_channel_evaluate(_channel,curvePosition);
			ystart = r_hand_y
			r_hand_y = ystart + lengthdir_y(_value,look_direction_arm);*/
			
				xprev=r_hand_x;
				yprev=r_hand_y;

				/// All your movement code goes here

				var p_dir = point_direction(r_hand_x,r_hand_y,xprev,yprev)
				var orient = point_direction(r_hand_x,r_hand_y,mouse_x,mouse_y);
			
				part_type_scale(obj_particle_controller.pt_flare_particles, global.__particle, 1);
				part_type_orientation(obj_particle_controller.pt_flare_particles, p_dir, p_dir, 0, 0, 0);
				part_type_direction(obj_particle_controller.pt_flare_particles, orient, orient, 0, 0);
			
				part_particles_create(obj_particle_controller.ps_above,r_hand_x ,r_hand_y,obj_particle_controller.pt_flare_particles,1)		
			
	}
		
	


function scr_aim(){
		if(global.__sht) || (global.__r_sht){
		//right arm
		r_elbow_x = r_shoulder_x + lengthdir_x(bicep_length,look_direction_arm);
		r_elbow_y = r_shoulder_y  + (lengthdir_y( bicep_length,look_direction_arm));
		r_elbow_y = clamp(r_elbow_y, (y-displacement)-bicep_length,(y-displacement)+bicep_length);
		//right hand
		r_hand_x = r_elbow_x + lengthdir_x(bicep_length, look_direction_arm);
		r_hand_y = r_elbow_y + (lengthdir_y( bicep_length, look_direction_arm)); // + sin(r_arm_move / 10) * forearm_length/2) + forearm_length/2;
		r_hand_y = clamp(r_hand_y, (y-displacement)-(bicep_length+forearm_length),(y-displacement)+(bicep_length+forearm_length));
		}
}