function set_dash(){
	len = spd * 3;	
	vsp = 0;
	var dash_dis = -1;
	if (look_direction < 90 || look_direction > 275){
		dash_dis = 1;
	}
	else {
		dash_dis = -1;
	}
	if(len == 0){len = dash_dis*(4*3);}
	else{len = spd * 3;}	
	var dash_resolution = len;
	if((!place_meeting(x+dash_resolution,y,obj_ground) && !place_meeting(x+dash_resolution,y,obj_wall))){
			part_type_scale(obj_particle_controller.particle_shadow, dash_dis, 1);
			part_particles_create(obj_particle_controller.particle_below, x,y,obj_particle_controller.particle_shadow, 1);
			x += dash_resolution;
	}

}

