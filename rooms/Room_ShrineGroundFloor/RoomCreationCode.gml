SetRoomAudio_Music_Default(music_ShrinePeacefulTheme);
SetSpawnpoint();
SaveGame();

if (global.CarvalineOrb_Cutscene_Seen)
{
	layer_set_visible(layer_get_id("Floor_MainDoorOpen"), true);
	layer_set_visible(layer_get_id("Floor_MainDoorClosed"), false);
}