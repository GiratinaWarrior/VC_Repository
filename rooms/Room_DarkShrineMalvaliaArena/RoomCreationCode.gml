SetRoomAudio_Music_Default(blanksound);
SetSpawnpoint(256 + 480, 190 + 270, Room_DarkShrineBasementPedestal);
obj_Player.hascontrol = false;
instance_create_layer(0, 0, "Malvalia", obj_MalvaliaFirstFightCutscene);