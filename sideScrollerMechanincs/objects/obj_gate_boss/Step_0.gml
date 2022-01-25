/// @description Insert description here
// You can write your code in this editor
switch (state_gate)
{
	case gateStatesBoss.closed: mask_index = spr_Gate; sprite_index = spr_Gatedown; image_index = 1;  break;
	case gateStatesBoss.open: gate_state_open(spr_Gatedown,spr_Gatedown_boss); break;	
	case gateStatesBoss.locked: mask_index = spr_Gate; sprite_index = spr_Gatedown; image_index = 1 break;	
}
if (!engaged){

	if(distance_to_object(obj_player) < 75 && checked){
		checked = false;
		checking = true;
	}
	if(distance_to_object(obj_player) > 95 && !checked){
		checked = true;
		checking = false;
	}
	//show_debug_message(distance_to_object(obj_player));
	if (checking){
		state_gate = gateStatesBoss.open;
	}
	else{state_gate = gateStatesBoss.closed;}
}
