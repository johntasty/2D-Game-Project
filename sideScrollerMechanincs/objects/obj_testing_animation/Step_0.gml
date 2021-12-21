/// @description Insert description here
// You can write your code in this editor
look_direction_draw = point_direction(x,y,mouse_x,mouse_y);
point_x = x + lengthdir_x(60,look_direction_draw);
point_y = y + lengthdir_y(60,look_direction_draw);

if(global.__r_sht){


//part_type_direction(obj_particle_controller.pt_flare_particles_testing, 270+_value, 270+_value, 0, 0);
part_type_scale(obj_particle_controller.pt_flare_particles_testing, 1,2);
//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, look_direction_draw,look_direction_draw, 0, 0, 0);
part_type_orientation(obj_particle_controller.pt_flare_particles_testing, look_direction_draw, look_direction_draw,0, 0, 0);
part_type_direction(obj_particle_controller.pt_flare_particles_testing,look_direction_draw-90,look_direction_draw-90,0,0);
//part_type_direction(obj_particle_controller.pt_flare_particles_trail,look_direction_draw-90,look_direction_draw-90,0,0);
part_particles_create(obj_particle_controller.particle_below,point_x,point_y,obj_particle_controller.pt_flare_particles_testing,1);
//part_emitter_region(obj_particle_controller.particle_below,obj_particle_controller.em_sword,x,point_x,y,point_y,ps_shape_line,1);
//part_emitter_burst(obj_particle_controller.particle_below,obj_particle_controller.em_sword,obj_particle_controller.pt_flare_particles_testing,1);

}

if(global.__sht){

time += timeSpeed;
//time = time mod 1;
var direction_face = point_direction(x,y,mouse_x,mouse_y);
if(direction_face <91 || direction_face > 275 ){
	direction_face = 1;
}
else{direction_face = -1;}

var _curveStruct = animcurve_get(channel_test);
var _channel = animcurve_get_channel(_curveStruct, "x");
var _value = animcurve_channel_evaluate(_channel,time);

xstart = x;

point_x = xstart +lengthdir_x(60,look_direction_draw+(_value*direction_face));


var _curveStruct = animcurve_get(channel_test);
var _channel = animcurve_get_channel(_curveStruct, "y");
var _value = animcurve_channel_evaluate(_channel,time);
ystart = y;
point_y = ystart + lengthdir_y(60,look_direction_draw+(_value*direction_face));


image_angle = look_direction_draw + (_value*direction_face) ;
show_debug_message(_value*direction_face);

xprev = point_x;
yprev = point_y;

part_type_scale(obj_particle_controller.pt_flare_particles_testing, 1,2);
part_type_orientation(obj_particle_controller.pt_flare_particles_testing, look_direction_draw+(_value*direction_face), look_direction_draw+(_value*direction_face),0, 0, 0);
//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, _value,_value, 0, 0, 0);
part_type_direction(obj_particle_controller.pt_flare_particles_testing,_value,_value,0,0);
part_particles_create(obj_particle_controller.particle_below,xprev,yprev,obj_particle_controller.pt_flare_particles_testing,1);

/*
ldx_test = x+ldx;
ldy_test = y+ldy;*/
}else{time = 0;
	image_angle = 0;}
