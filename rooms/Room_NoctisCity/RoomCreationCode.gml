SetRoomAudio_Music_Default(music_NoctisCityTheme);
SetSpawnpoint();
SaveGame();

if (global.ValnyxShrineUnderAttack_Active)
{
	instance_destroy(obj_NPC);
}