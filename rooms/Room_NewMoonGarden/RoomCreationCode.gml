SetRoomAudio_Music_Default(music_ShrineMemoryTheme);

if (global.Lavender_Defeated_Prologue == false)
{
	instance_create_layer(0, 0, "LavenderBossFight", obj_LavenderBossIntro_Prologue);
}

SetSpawnpoint();
SaveGame();