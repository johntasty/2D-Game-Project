/// @description 
audio_stop_sound(Into_the_Light);

if (!audio_is_playing(Down_Town_V2)){
	audio_play_sound(Down_Town_V2,1,1);
}
scr_load_game();
