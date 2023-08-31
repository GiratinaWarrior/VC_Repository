// Auto-generated stubs for each available event.

function MalvaliaBossBattle_Teleport()
{
	with (obj_Malvalia_FirstFight)
	{
		x = irandom_range(128, 832);
		y = irandom_range(270, 405);
	}
}

function MalvaliaBossBattle_BlackGeyser(_x, _y)
{
	
	instance_create_layer(_x, room_height, "Black_Geyser", obj_BlackGeyser);
	
	//show_debug_message("GEYSER");
}