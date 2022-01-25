/// @description Insert description here
// You can write your code in this editor
switch (state_gate)
{
	case gateStatesBoss.closed: mask_index = spr_Gate; sprite_index = spr_Gate  break;
	case gateStatesBoss.open: gate_state_open(spr_Gatedown,spr_Gatedown_boss); break;	
	case gateStatesBoss.locked: break;	
}
if (!engaged){
	if (distance_to_object(obj_player) < 20){
		state_gate = gateStatesBoss.open;
	}
}else{state_gate = gateStatesBoss.closed;}