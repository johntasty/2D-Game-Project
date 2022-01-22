/// @description 

var width_right = obj_falling_rocks.bbox_right - obj_falling_rocks.bbox_left ;
var height = obj_falling_rocks.bbox_bottom - obj_falling_rocks.bbox_top;
var x_create = irandom(width_right);
if (falling_rock && delay_step < 1)
{	
	instance_create_layer(x+x_create, y, "Instances", obj_rock);
	delay_step = delay;
}
delay_step = lerp(delay_step,0,0.3);