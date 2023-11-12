//SetRoomAudio_Music(blanksound, 0.5, 100);
SetRoomAudio_Music_Default(blanksound);
SetSpawnpoint();
SaveGame();	

if !(global.VoizatiaLavenderAftermath_Cutscene_Seen)
{
	instance_create_layer(0, 0, "VoizatiaBossIntroCutscene", obj_VoizatiaBossIntroCutscene);
}
