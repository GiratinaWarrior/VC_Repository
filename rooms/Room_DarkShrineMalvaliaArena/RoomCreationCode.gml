SetRoomAudio_Music_Default(blanksound);
obj_Player.hascontrol = false;

if !(global.MalvaliaDefeated)
{
	instance_create_layer(0, 0, "Malvalia", obj_MalvaliaFirstFightCutscene);
	SetSpawnpoint(256 + 480, 190 + 270, Room_DarkShrineBasementPedestal);
}
else
{
	layer_set_visible("ShadowGate", true);
	SetSpawnpoint(room_width/2, 460);	
	SaveGame();
}