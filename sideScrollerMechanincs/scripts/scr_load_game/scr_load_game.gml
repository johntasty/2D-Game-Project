
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