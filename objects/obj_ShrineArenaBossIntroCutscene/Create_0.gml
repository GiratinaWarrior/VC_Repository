/// @description

if (global.ShrineGeneral_Defeated)
{
	instance_destroy();
}

else
{
	//show_debug_message("Shrine Cutscene Created");
	ShrineArenaBossCutsceneSequenceID = layer_sequence_create(layer, 0, 0, seq_ShrineArenaBossCutscene);
	
	with (obj_Camera)
	{
		follow = noone;
		xTo = -1280;
		x = -1280;
	}

	ShrineArena_DoorsCreated = false;
	
	ShrineArena_CamMoveCounter = 0;
	
	ShrineArena_AppearSoundCounter = 0;

	ShrineArena_FootstepCounter = 0;
	
	ShrineArena_FootstepRate = 0;

}