/// @description Insert description here
// You can write your code in this editor
blink = false;

blink_counter ++;

if (blink_counter < blink_number) {
	alarm[4] = blink_duration;
}else {blink_counter = 0;}