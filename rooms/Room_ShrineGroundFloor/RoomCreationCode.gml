SetRoomAudio_Music(music_ShrinePeacefulTheme, 0.5);
SetSpawnpoint();
SaveGame();

if (global.CarvalineOrb_Cutscene_Seen)
{
	layer_set_visible(layer_get_id("Floor_MainDoorOpen"), true);
	layer_set_visible(layer_get_id("Floor_MainDoorClosed"), false);
}