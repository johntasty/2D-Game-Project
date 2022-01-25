/// @description Insert description here
// You can write your code in this editor
menu[0, 0] = "Main Menu";
menu[0, 1] = "Continue";
menu[0, 2] = "Save";
menu[0, 3] = "Exit";

menu[1, 0] = main_menu_option;
menu[1, 1] = spr_continue;
menu[1, 2] = save;
menu[1, 3] = spr_exit;

_index = 0;
submenu_index_game = 0; 
global.__paused = 0;
global._saved = 0;