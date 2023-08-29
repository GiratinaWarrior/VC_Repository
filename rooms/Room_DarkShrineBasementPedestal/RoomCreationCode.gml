if (!global.VoizatiaDebuted)
{
	SetRoomAudio_Music_Default(blanksound);
	SetSpawnpoint(1888, 1840, Room_DarkShrineBasementStairs);
	instance_create_layer(0, 0, "Voizatia", obj_VoizatiaDebutCutscene);
}
else if !(global.MalvaliaDefeated)
{
	layer_set_visible("ShadowPortal", true);
	SetRoomAudio_Music_Default(blanksound);
	SetSpawnpoint(1888, 1840, Room_DarkShrineBasementStairs);
}

else
{
	SetRoomAudio_Music_Default();
	SetSpawnpoint();
}