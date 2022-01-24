if (distance_to_object(obj_player)>175)
{
	global.inDialogue = false;
	instance_destroy();	
	obj_player.interacted = -1;
}