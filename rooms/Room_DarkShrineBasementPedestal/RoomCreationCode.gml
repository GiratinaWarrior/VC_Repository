//If Voizatia has not debuted and Malvalia has not been defeated
if (global.VoizatiaDebuted == false || global.VoizatiaDebuted == 0) && (global.MalvaliaDefeated == false || global.MalvaliaDefeated == 0)
{
	SetRoomAudio_Music_Default(blanksound);
	SetSpawnpoint(1888, 1840, Room_DarkShrineBasementStairs);
	instance_create_layer(0, 0, "Voizatia", obj_VoizatiaDebutCutscene);
	layer_set_visible("ShadowPortal", false);
}
//If Voizatia has debuted and Malvalia has not been defeated
else if (global.VoizatiaDebuted  == true || global.VoizatiaDebuted == 1.0) && (global.MalvaliaDefeated == false || global.MalvaliaDefeated == 0)
{
	layer_set_visible("ShadowPortal", true);
	SetRoomAudio_Music_Default(music_DarkShrineBasementTheme);
	SetSpawnpoint(256 + 960, 190 + 270, Room_DarkShrineBasementPedestal);
	SaveGame();
}

//If Voizatia has debuted and Malvalia has been defeated
else
{
	SetRoomAudio_Music_Default();
	SetSpawnpoint();
	SaveGame();
}

if (global.VoizatiaDebuted)
{
	with (obj_CarvalinePedestal)
	{
		sprite_index = spr_CarvalinePedestal_Empty;
	}
}