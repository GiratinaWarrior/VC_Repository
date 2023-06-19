
//If the Shrine General hasn't been defeated
if (!global.ShrineGeneral_Defeated)
{
	instance_create_layer(0, 0, "Cutscene", obj_ShrineArenaBossIntroCutscene);
	SetRoomAudio();
	SetSpawnpoint(32, 160, Room_ShrineArenaEntrance);
	with (obj_Camera)
	{
		follow = noone;
	}
}

//If the Shrine General has been defeated
else
{

	if (instance_exists(obj_ShrineArenaBossIntroCutscene))
	{
		instance_destroy(obj_ShrineArenaBossIntroCutscene);
	}
	SetRoomAudio(music_ShrinePeacefulTheme);
	with (obj_Camera)
	{
		follow = obj_Player;
	}
	layer_set_visible("Floortiles_Closed", false);
	layer_set_visible("Floortiles_PartialOpen", false);
	layer_set_visible("Floortiles_FullOpen", true);
	
	with (obj_ShrineArenaBossIntroCutscene)
	{
		instance_destroy();	
	}
}