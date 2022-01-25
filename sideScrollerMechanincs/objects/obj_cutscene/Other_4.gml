/// @description Insert description here
// You can write your code in this editor
if (layer_exists("Cutscenes")){
	curSeqLayer = "Cutscenes";
}
else{
	curSeqLayer = "Instances";
}
if(!global.played){
	var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*.5);
	var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*.5);

	//create sequence layer
	if !(layer_sequence_exists(curSeqLayer,game_intro)){
		if (layer_exists(curSeqLayer)){
			layer_sequence_create(curSeqLayer,_camX,_camY,game_intro);
			layer_depth(curSeqLayer,-10000);
		}
	}
}