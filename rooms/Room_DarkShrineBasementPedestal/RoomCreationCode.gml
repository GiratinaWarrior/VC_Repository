if (!global.DefeatedByVoizatia)
{
	SetRoomAudio_Music_Default(music_ShrineBasementTheme);
	SetSpawnpoint(1888, 1840, Room_DarkShrineBasementFloor3);
	instance_create_layer(0, 0, "Voizatia", obj_VoizatiaDebutCutscene);
}
else
{
	SetRoomAudio_Music_Default();
	SetSpawnpoint();
}