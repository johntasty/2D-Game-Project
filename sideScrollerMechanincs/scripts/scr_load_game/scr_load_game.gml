
function scr_load_game(){	

		if (file_exists("savedgame.save") && global.__load)
		{
			
			
			//erase current game data
			with(obj_player) instance_destroy();	
			var _buffer = buffer_load("savedgame.save");
			var _string = buffer_read(_buffer, buffer_string);
			buffer_delete(_buffer);
		
			var _loadData = json_parse(_string);
		
			while(array_length(_loadData) > 0)
			{
				var _loadEntity = array_pop(_loadData);
			
					with(instance_create_layer(0,0,layer,asset_get_index(_loadEntity.obj)))
					{	
					
						x = _loadEntity.x;
						y = _loadEntity.y;					
						image_blend = _loadEntity.image_blend;
						image_index = _loadEntity.image_index;
							var temp_list = _loadEntity.inventory;						
							spd = _loadEntity.spd;
							hp = _loadEntity.hp;		
							r_elbow_x = _loadEntity.r_elbow_x;
							r_elbow_y = _loadEntity.r_elbow_y;
							inventory = ds_list_create();
							weapon_dir = _loadEntity.weapon_dir;
							//weapon = _loadEntity.weapon;
							ds_list_read(inventory, temp_list);
							active_weapon = _loadEntity.active_weapon;	
												
									
					}		
			}
		
		}	
	}
function scr_load_room()
{
	if(file_exists("User.save"))
	{
		ini_open("User.save");
		var roomId;
		roomId = ini_read_real("Save1", "roomId", 0);
		room_goto(roomId);	
		ini_close();
	}
}

function scr_save_game()
{
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

	if (_string == "[ null ]" || _string == "null" ){
		show_debug_message("not saved ");
		global._saved = false;
	}else {
		global._saved = true;
		show_debug_message("saved "+ _string);
	}
}
function scr_load_game_dead(){	

		if (file_exists("savedgame.save"))
		{
			show_debug_message("loaded");
			//erase current game data
			with(obj_player) instance_destroy();	
			var _buffer = buffer_load("savedgame.save");
			var _string = buffer_read(_buffer, buffer_string);
			buffer_delete(_buffer);
		
			var _loadData = json_parse(_string);
		
			while(array_length(_loadData) > 0)
			{
				var _loadEntity = array_pop(_loadData);
			
					with(instance_create_layer(0,0,layer,asset_get_index(_loadEntity.obj)))
					{	
					
						x = _loadEntity.x;
						y = _loadEntity.y;					
						image_blend = _loadEntity.image_blend;
						image_index = _loadEntity.image_index;
							var temp_list = _loadEntity.inventory;						
							spd = _loadEntity.spd;
							hp = _loadEntity.hp;		
							r_elbow_x = _loadEntity.r_elbow_x;
							r_elbow_y = _loadEntity.r_elbow_y;
							inventory = ds_list_create();
							weapon_dir = _loadEntity.weapon_dir;
							//weapon = _loadEntity.weapon;
							ds_list_read(inventory, temp_list);
							active_weapon = _loadEntity.active_weapon;	
												
									
					}		
			}
		
		}	
	}