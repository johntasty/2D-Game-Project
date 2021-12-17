//gml_pragma("global", "init()");

var _p = part_type_create();

	part_type_color3(_p, 16777215, 16776960, 16776960);
	part_type_life(_p,30,30);
	
	part_type_shape(_p,pt_shape_sphere);
	part_type_speed(_p,0,0,0,0);
	part_type_size(_p,0.30,0.30,-0.01,0);
	part_type_scale(_p, 2, 1);
	
	part_type_alpha3(_p,0.2,1,0);
	part_type_blend(_p,1);	

	
global.__shine = _p;
/*
//trail
var _p = part_type_create();
part_type_shape(_p,pt_shape_sphere);
part_type_life(_p,20,20);
part_type_size(_p,0.20,0.20,-0.01,0);

global.ptTrail = _p;

//set as step
part_type_step(global.__shine,1,global.ptTrail);