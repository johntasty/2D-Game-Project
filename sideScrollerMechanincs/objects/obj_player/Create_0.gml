/// @description foot variables
curveAsset = animPlayerMelee;
curvePosition = 0;
curveSpeed = 0.05;

vsp = 0;
grv = 0.3;
jumpspeed = 10;

//animation
time= 0;
timeSpeed = 0.1;
channel_test = animCurveTest;
anim = new animation();
anim.sprite_index = sprite_index;
anim.bind(true);
moving = false;
//weapon handler
weapon = -1;
weapon_dir = 0;

spd = 0;
set_limps(43,25,13,20,7,20,7);

dir = 0;
cooldown = 0;

//look direction

look_direction = 0;
look_direction_arm = 0;
__particle = 1;


state = playerStates.idle;
melee_cooldown = 0;