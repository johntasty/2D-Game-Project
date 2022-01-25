/// @description Insert description here
// You can write your code in this editor
switch (event_data[? "message"]){
	case "sequenceStart": {
		//set state
		sequenceState = seqState.playing;
		//find the sequence and broadcast message
		if (layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence){
			curSeq = event_data[? "element_id"];
			
		}
	}; break;
	case "sequenceEnd": {
		//set state
		sequenceState = seqState.finished;
		
	}; break;
}