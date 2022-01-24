/// @description foot variables

curvePosition = 0;
exist = true;
hp = 100;
flash = false;
col = image_blend;
parent = -1;
blink_number = 10;
blink_counter = 0;
blink_duration = 3;

vsp = 0;
grav = 0.5;
jumpspeed = 10;
spd = 0;
//graple
active = false;
weapon_hook = false;
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
//inventory
inventory = ds_list_create();
<<<<<<< Updated upstream
active_weapon = noone;
=======

ds_list_add(inventory,_melee_id);
interacted = -1;

>>>>>>> Stashed changes
testing_list = noone;
set_limps(43,25,13,20,7,20,7);

dir = 0;
cooldown = 0;

global.__spdex = 0;
global.__vsdex = 0;

//look direction

look_direction = 0;
look_direction_arm = 0;
__particle = 1;


state = playerStates.idle;
melee_cooldown = 0;