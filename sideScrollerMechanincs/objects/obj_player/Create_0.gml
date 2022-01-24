/// @description foot variables

curvePosition = 0;
exist = true;
hp = 100;
hp_max = 100;
health_bar_width = 100;
health_bar_height = 10;
global.__paused = 0;	
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
var _melee_id = obj_gun_melee.id;
weapon = _melee_id;
weapon_dir = 0;
//inventory
active_weapon = noone;
inventory = ds_list_create();

ds_list_add(inventory,_melee_id);
interacted = -1;

testing_list = noone;
set_limps(43,25,13,12,7,20,7);

dir = 0;
cooldown = 10;


global.__spdex = 0;
global.__vsdex = 0;

//look direction

look_direction = 0;
look_direction_arm = 0;
__particle = 1;


state = playerStates.idle;
melee_cooldown = 0;