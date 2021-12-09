gun_init();


guntype = choose(gun_set_pistol, gun_set_laser, gun_set_shotgun);
guntype();

ui_show = false;
ui_alpha = 0;