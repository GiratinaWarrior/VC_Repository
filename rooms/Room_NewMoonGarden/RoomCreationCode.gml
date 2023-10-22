SetRoomAudio_Music(music_ShrineMemoryTheme, 0.5, 100);

//var e = CreateParticleSystem(ps_LavenderBossFightFlowers, "LavenderFlowers", 1920, 270);

if (global.Lavender_Defeated_Prologue == false)
{
	instance_create_layer(0, 0, "LavenderBossFight", obj_LavenderBossIntro_Prologue);
}

SetSpawnpoint();
SaveGame();