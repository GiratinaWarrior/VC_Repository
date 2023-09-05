SetRoomAudio_Music(music_ShrineMemoryTheme, 0.5, 100);
SetSpawnpoint();
SaveGame();	

if !(global.VoizatiaLavenderAftermath_Cutscene_Seen)
{
	instance_create_layer(0, 0, "VoizatiaLavenderCutscene", obj_VoizatiaLavenderAftermathCutscene);
}
