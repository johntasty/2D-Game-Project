/// @description foot variables
vsp = 0;
grv = 0.3;
jumpspeed = 10;

//animation
anim = new animation();
anim.sprite_index = sprite_index;
anim.bind(true);
moving = false;
//weapon handler
weapon = -1;
weapon_dir = 0;

set_limps(94,64,35,30,35,30);

//look direction
look_direction = 0;
