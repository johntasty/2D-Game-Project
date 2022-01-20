/// @description Insert description here
// You can write your code in this editor
flash = false;

blink_counter ++;

if (blink_counter < blink_number) {
	alarm[3] = blink_duration;
}else {blink_counter = 0;}