SetRoomAudio_Music_Default(music_NoctisCityTheme);
SetSpawnpoint();
SaveGame();

if (global.CardinalNoctisCongrats_Cutscene_Seen)
{
	instance_destroy(obj_NPC);
}