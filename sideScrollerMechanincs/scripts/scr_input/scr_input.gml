_hor = (keyboard_check(ord("D")) - keyboard_check(ord("A")) );
_ver = (keyboard_check(ord("S")) - keyboard_check(ord("W")) )
key_jump = keyboard_check_pressed(vk_space);
global.__dash_key = keyboard_check_pressed(vk_shift);
pickup = keyboard_check_pressed(ord("F"));
global.__sht = mouse_check_button(mb_left);
global.__shtrelease = mouse_check_button_released(mb_left);
global.__shtpress = mouse_check_button_pressed(mb_left);
global.__r_sht = mouse_check_button(mb_right);
global.__r_sht_rel = mouse_check_button_released(mb_right);