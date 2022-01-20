/// @description Insert description here
// You can write your code in this editor
look_direction_draw = point_direction(x,y,mouse_x,mouse_y);
length_draw = distance_to_point(mouse_x,mouse_y);
point_x = x + lengthdir_x(length_draw,look_direction_draw);
point_y = y + lengthdir_y(length_draw,look_direction_draw);

if(global.__r_sht){
xprev = x;
yprev = y;
var p_dir = point_direction(x,y,xprev,yprev)
//part_type_direction(obj_particle_controller.pt_flare_particles_testing, 270+_value, 270+_value, 0, 0);
part_type_scale(obj_particle_controller.pt_flare_particles_testing, 1,3);
//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, look_direction_draw,look_direction_draw, 0, 0, 0);
part_type_orientation(obj_particle_controller.pt_flare_particles_testing, look_direction_draw, look_direction_draw,0, 0, 0);
part_type_direction(obj_particle_controller.pt_flare_particles_testing,0,0,0,0);
//part_type_direction(obj_particle_controller.pt_flare_particles_trail,look_direction_draw-90,look_direction_draw-90,0,0);
part_particles_create(obj_particle_controller.particle_below,point_x,point_y,obj_particle_controller.pt_flare_particles_testing,1);
//part_emitter_region(obj_particle_controller.particle_below,obj_particle_controller.em_sword,x,point_x,y,point_y,ps_shape_line,1);
//part_emitter_burst(obj_particle_controller.particle_below,obj_particle_controller.em_sword,obj_particle_controller.pt_flare_particles_testing,1);

}

if(global.__sht){



var direction_face = point_direction(x,y,mouse_x,mouse_y);

if(direction_face <91 || direction_face > 275 ){
	direction_face = 1;
}
else{direction_face = -1;
	}

var _curveStruct = animcurve_get(channel_test);
var _channel = animcurve_get_channel(_curveStruct, "x");
var _value = animcurve_channel_evaluate(_channel,time);
var _curve_chanel = animcurve_get_channel(_curveStruct, "x_curve");
var curve_value = animcurve_channel_evaluate(_curve_chanel,time);
var _channel_move = animcurve_get_channel(_curveStruct, "x_move");
var _value_move = animcurve_channel_evaluate(_channel_move,time);
xstart = x;
xmoving = x;
//point_x = xstart +lengthdir_x(curve_value,look_direction_draw+(180*direction_face)+(2*_value*direction_face));
point_x = xstart + curve_value*direction_face;
x = xmoving + _value_move/5 *direction_face;

//var _curveStruct = animcurve_get(channel_test);
var _channel = animcurve_get_channel(_curveStruct, "y");
var _value = animcurve_channel_evaluate(_channel,time);
var _channel_move = animcurve_get_channel(_curveStruct, "y_move");
var _value_move = animcurve_channel_evaluate(_channel_move,time);

ystart = y;
yjumping = y;
//point_y = ystart + lengthdir_y(curve_value,look_direction_draw+(180*direction_face)+(_value*direction_face));
point_y = ystart + _value*-1;
y = yjumping + _value_move;
show_debug_message(y);



xprev = point_x;
yprev = point_y;
var p_dir = point_direction(x,y,xprev,yprev)
part_type_scale(obj_particle_controller.pt_flare_particles_testing,0.5,2);
//part_type_orientation(obj_particle_controller.pt_flare_particles_testing,look_direction_draw+(180*direction_face)+(2*_value*direction_face), look_direction_draw+(180*direction_face)+(2*_value*direction_face),0, 0, 0);
part_type_orientation(obj_particle_controller.pt_flare_particles_testing,look_direction_draw+(_value*direction_face),look_direction_draw+(_value*direction_face),0, 0, 0);
//part_type_orientation(obj_particle_controller.pt_flare_particles_trail, _value,_value, 0, 0, 0);
part_type_direction(obj_particle_controller.pt_flare_particles_testing,look_direction_draw+(180*direction_face)+(2*_value*direction_face),look_direction_draw+(180*direction_face)+(2*_value*direction_face),0,0);
part_particles_create(obj_particle_controller.particle_below,point_x,point_y,obj_particle_controller.pt_flare_particles_testing,1);
time += timeSpeed;
time = time mod 1;
/*
ldx_test = x+ldx;
ldy_test = y+ldy;*/
}else{time = 0;
	image_angle = 0;}
