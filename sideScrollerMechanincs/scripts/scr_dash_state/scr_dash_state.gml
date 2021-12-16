function set_dash(){
	len = spd * 3;	
	
	var dash_dis = -1;
	if (look_direction < 90 || look_direction > 275){
		dash_dis = 1;
	}
	else {
		dash_dis = -1;
	}
	if(len == 0){len = dash_dis*(4*3);}
	else{len = spd * 3;}	
	//hspd =  lengthdir_x(len, dir);
	//show_debug_message(hspd);
	//set frames of dashing, and distance
	var dash_frames = 10;
	var dash_resolution = len;
for (var i = 0; i< dash_frames; i++){
		if((!place_meeting(x+dash_resolution,y,obj_ground) && !place_meeting(x+dash_resolution,y,obj_wall))){
		
			part_type_scale(obj_particle_controller.particle_shadow, dash_dis, 1);
			
			part_particles_create(obj_particle_controller.particle_below, x,y,obj_particle_controller.particle_shadow, 1);
			x += dash_resolution;
		}
	}
}