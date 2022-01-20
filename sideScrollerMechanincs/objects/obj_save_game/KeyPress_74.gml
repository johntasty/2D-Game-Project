/// @description 
// create save array


//room save
if (file_exists("User.save")){file_delete("User.save");}
ini_open("User.save");
ini_write_real("Save1", "roomId", room);
ini_close();
//for every instance of player save struct
var _save_data = array_create(0);
//room save


//for every instance of player save struct
with(obj_player)
{	
	testing_list = ds_list_write(inventory);	
	var _save_entity = 
	{
		obj: object_get_name(object_index),
		y: y,
		x: x,
		hp: hp,
		spd: spd,
		r_elbow_x: r_elbow_x,
		r_elbow_y: r_elbow_y,
		image_index: image_index,
		image_blend: image_blend,
		weapon_dir: weapon_dir,
		inventory: testing_list,
		active_weapon: active_weapon,		
	}

	
	array_push(_save_data, _save_entity);
	
}


//turn into JSON and stringify
var _string = json_stringify(_save_data);
var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("saved "+ _string);