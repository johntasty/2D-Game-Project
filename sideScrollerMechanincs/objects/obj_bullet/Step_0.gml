//Make image angle follow direction we are moving
image_angle = direction;

//increment/decrement scale by scale speed
image_xscale += scale_speed_x;
image_yscale += scale_speed_y;

//clamp scaling so it doesnt go negative
if(image_xscale < 0) image_xscale = 0;
if (image_yscale < 0) image_yscale = 0;

life--;
if(floor(life) == 0){
	instance_destroy();
}
 if (collision_point(x,y,obj_wall, false, true) ||collision_point(x,y,obj_ground, false, true))
 {
	instance_destroy();
 }
