//particle creator
global.__particle = 1;
global.__sword_part = part_system_create();
ps_above = part_system_create();

particle_below = part_system_create_layer("Instances_below", false);
#region
	particle_shadow = part_type_create();
	part_type_sprite(particle_shadow,MainCharacterNoLimbs,0, 0, 0);
	part_type_size(particle_shadow, 1, 1, 0, 0);
	part_type_scale(particle_shadow, 1, 1);
	part_type_life (particle_shadow,20,20);
	part_type_color1(particle_shadow,c_white);
	part_type_direction(particle_shadow, 0, 0, 0, 0);
	part_type_orientation(particle_shadow, 0, 0, 0, 0, 0);
	part_type_alpha3(particle_shadow,0.5,0.3,0.1);
#endregion
#region

pt_flare_particles_trail = part_type_create();
part_type_sprite(pt_flare_particles_trail,wormhole_line,0, 0, 0);
//part_type_sprite(pt_flare_particles,spr_melee_particle,0, 0, 0);
//part_type_shape(pt_flare_particles_trail, pt_shape_sphere);
part_type_size(pt_flare_particles_trail, 0.3, 0.3, 0, 0);
part_type_scale(pt_flare_particles_trail, 0.2, 1);
part_type_orientation(pt_flare_particles_trail, 0, 0, 0, 0, 0);
part_type_color3(pt_flare_particles_trail, 16777215, 16776960, 16776960);
part_type_alpha3(pt_flare_particles_trail, 0.8, 0.5, 0);
part_type_blend(pt_flare_particles_trail, 1);
part_type_life(pt_flare_particles_trail, 5, 5);
part_type_speed(pt_flare_particles_trail, 0, 0, 0, 0);
part_type_direction(pt_flare_particles_trail, 0, 0, 0, 0);
part_type_gravity(pt_flare_particles_trail, 0, 0);

pt_flare_particles = part_type_create();

part_type_sprite(pt_flare_particles,spr_melee_particle,0, 0, 0);
//part_type_shape(pt_flare_particles, pt_shape_sphere);
part_type_size(pt_flare_particles, 0.3, 0.3, 0, 0);
part_type_scale(pt_flare_particles, 6, 2);
part_type_orientation(pt_flare_particles, 0, 0, 0, 0, 0);
part_type_color3(pt_flare_particles, 16777215, 16776960, 16776960);
part_type_alpha3(pt_flare_particles, 1, 1, 0);
part_type_blend(pt_flare_particles, 1);
part_type_life(pt_flare_particles, 30, 30);
part_type_speed(pt_flare_particles, 0, 0, 0, 0);
part_type_direction(pt_flare_particles, 0, 0, 0, 0);
part_type_gravity(pt_flare_particles, 0, 0);
part_type_step(pt_flare_particles,1,pt_flare_particles_trail);

#endregion
#region
global.__flame_lifemin = 40;
	global.__flame_lifemax = 50;
	global.__smoke_lifemin = 50;
	global.__smoke_lifemax = 60;
	global.__fire = part_system_create();
	global.__flame = part_type_create();
	global.__smoke = part_type_create();
	
	global.__dirc = 0;

	global.__em = part_emitter_create(global.__fire);
	part_type_sprite(global.__flame,sphere2123,false,false,false);
	part_type_color3(global.__flame,c_white,c_orange,c_red);
	part_type_life(global.__flame,global.__flame_lifemin,global.__flame_lifemax);
	part_type_direction(global.__flame,direction-5,direction+5,0,0); 
	//part_type_shape(global.__flame,pt_shape_sphere);
	part_type_speed(global.__flame,10,12,0,0.25);
	part_type_size(global.__flame,0.15,0.3,0.014,0.003);
	part_type_alpha3(global.__flame,0.2,1,0);
	part_type_blend(global.__flame,1);	
	
	part_type_color2(global.__smoke,c_gray,c_black);
	part_type_life(global.__smoke,global.__smoke_lifemin,global.__smoke_lifemax);
	part_type_direction(global.__smoke,global.__dirc-1,global.__dirc+1,0,0); 
	//part_type_shape(global.__smoke,pt_shape_smoke);
	part_type_sprite(global.__smoke,smoke1,false,false,false);
	part_type_speed(global.__smoke,9,11,0,0.25);
	part_type_size(global.__smoke,0.15,0.2,0.016,0.003);
	part_type_alpha3(global.__smoke,1,0.8,0);
	part_type_blend(global.__smoke,0);	
#endregion
#region


em_sword = part_emitter_create(particle_below);
pt_flare_particles_testing = part_type_create();

part_type_sprite(pt_flare_particles_testing,wormhole_line,0, 0, 0);
//part_type_shape(pt_flare_particles_testing, pt_shape_sphere);
part_type_size(pt_flare_particles_testing, 0.3, 0.3, -0.01, 0);
part_type_scale(pt_flare_particles_testing, 1, 1);
part_type_orientation(pt_flare_particles_testing, 0, 0, 0, 0, 0);
part_type_color3(pt_flare_particles_testing, 16777215, 16776960, 16776960);
part_type_alpha3(pt_flare_particles_testing, 0.8, 0.8, 0);
part_type_blend(pt_flare_particles_testing, 1);
part_type_life(pt_flare_particles_testing, 30, 30);
part_type_speed(pt_flare_particles_testing,0,0,0,0);
part_type_direction(pt_flare_particles_testing, 0, 0, 0, 0);
part_type_gravity(pt_flare_particles_testing, 0, 0);
//part_type_step(pt_flare_particles_testing,1,pt_flare_particles_trail);
#endregion
#region
	wormhole_ps_upper = part_system_create_layer("Instances_below", false);
	//part_system_layer(wormhole_ps_upper,layer);
	part_system_automatic_draw(wormhole_ps_upper,false);

	wormhole_part = part_type_create();
	part_type_size(wormhole_part,1,1,0,0); // 0,0,0.0075,0
	part_type_scale(wormhole_part,0.6,0.3); // 1,1
	part_type_life(wormhole_part,20,20); // 60,60
	part_type_gravity(wormhole_part,0,0); // 0,0
	part_type_speed(wormhole_part,6,6,-0.2,0); // 4,4,-0.07,0
	part_type_direction(wormhole_part,0,360,0,0); // 0,359,4,0
	part_type_orientation(wormhole_part,0,0,0,0,0); // 0,0,0,0,0
	part_type_blend(wormhole_part,1); // 1
	part_type_alpha3(wormhole_part,1,1,0); // 1,1,0
	part_type_color3(wormhole_part,16777215, 16776960, 16776960); // make_color_rgb(255,0,102),make_color_rgb(0,204,255)
	//part_type_sprite(wormhole_part,part_bar_glow12,0,0,0); // part_wormhole_glow,0,0,0
	part_type_shape(wormhole_part, pt_shape_line);
	//part_type_step(wormhole_part, 1, wormhole_part_step);
#endregion
#region
	melee_upper = part_system_create_layer("Instances_below", false);
	//part_system_layer(wormhole_ps_upper,layer);
	//part_system_automatic_draw(melee_upper,false);

	melee_part = part_type_create();
	part_type_size(melee_part,1,1,0,0); // 0,0,0.0075,0
	part_type_scale(melee_part,1,1); // 1,1
	part_type_life(melee_part,16,16); // 60,60
	part_type_gravity(melee_part,0,0); // 0,0
	part_type_speed(melee_part,0,0,0,0); // 4,4,-0.07,0
	part_type_direction(melee_part,0,0,0,0); // 0,359,4,0
	part_type_orientation(melee_part,0,0,0,0,0); // 0,0,0,0,0
	part_type_blend(melee_part,1); // 1
	part_type_alpha3(melee_part,0.8,0.6,0.4); // 1,1,0
	//part_type_color3(melee_part,16777215, 16776960, 16776960); // make_color_rgb(255,0,102),make_color_rgb(0,204,255)
	part_type_sprite(melee_part,Classic_10_strip,1,1,0); // part_wormhole_glow,0,0,0
	//part_type_shape(wormhole_part, pt_shape_line);
	//part_type_step(wormhole_part, 1, wormhole_part_step);


#endregion
#region
	box_parts = part_system_create();
	part_system_automatic_draw(box_parts, false);
	
	box_part = part_type_create();
	part_type_size(box_part,1,1,0,0); // 0,0,0.0075,0
	part_type_scale(box_part,0.6,0.3); // 1,1
	part_type_life(box_part,20,20); // 60,60
	part_type_gravity(box_part,0,0); // 0,0
	part_type_speed(box_part,6,6,-0.2,0); // 4,4,-0.07,0
	part_type_direction(box_part,0,360,0,0); // 0,359,4,0
	part_type_orientation(box_part,0,0,0,0,0); // 0,0,0,0,0
	part_type_blend(box_part,1); // 1
	part_type_alpha3(box_part,1,1,0); // 1,1,0
	part_type_color3(box_part,16777215, 16776960, 16776960);
	part_type_shape(box_part, pt_shape_pixel);
#endregion
#region
	dust = part_system_create();
	part_system_automatic_draw(dust, false);
	
	dust_part = part_type_create();
	part_type_size(dust_part,1,1,-0.03,0);
	part_type_scale(dust_part,1,1);
	part_type_life(dust_part,40,40);
	part_type_speed(dust_part,1,6,-0.1,0);
	part_type_gravity(dust_part,0.2,270);
	part_type_direction(dust_part,60,120,0,0);
	part_type_blend(dust_part,1);
	part_type_alpha3(dust_part,1,1,0); // 1,1,0
	part_type_color3(dust_part,c_grey, c_grey, c_grey);
	part_type_shape(dust_part, pt_shape_cloud);

#endregion