/// @description Insert description here
// You can write your code in this editor
switch sequenceState {
	case seqState.playing:
		break;
	case seqState.finished: {
		//remove sequence
		if (layer_sequence_exists(curSeqLayer,curSeq)){
			layer_sequence_destroy(curSeq);
		}
		
		sequenceState = seqState.notPlaying;
		curSeq = noone;
	}; break;
}