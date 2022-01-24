function scr_screenshake(_time,_magnitude, _fade){
	
	with(obj_camerashake)
	{
		shake = true;
	    shake_time = _time;
	    shake_magnitude = _magnitude;
	    shake_fade = _fade;
		
	}
}

function scr_boxshake (_time,_magnitude, _fade,_object){
	
	with(_object)
	{
		shake_box = true;
	    shake_time_box = _time;
	    shake_magnitude_box = _magnitude;
	    shake_fade_box = _fade;
		
	}
}