/// @description Insert description here
// You can write your code in this editor
audio_play_sound(slash_hit,1,0);
if (!hit){
	hit = true;
	alarm[5] = room_speed/3;
	blink = true;
	max_health -= 1;
}