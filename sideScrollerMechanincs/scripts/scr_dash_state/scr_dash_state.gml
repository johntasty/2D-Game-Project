function set_dash(){

	len = spd * 3;
	hspd =  lengthdir_x(len, dir);
	//set frames of dashing, and distance
	var dash_dis = 10;
	var dash_resolution = hspd;
	for (var i = 0;i< dash_dis; i++)
	{
		if(!place_meeting(x+dash_resolution,y,obj_ground) && (!place_meeting(x+dash_resolution,y,obj_wall))){
			part_particles_create(obj_particle_controller.particle_below, x,y,obj_particle_controller.particle_shadow, 1);
			x += dash_resolution;
		}
		else {break;}
	}
}
