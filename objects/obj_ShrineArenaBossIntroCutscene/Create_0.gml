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
		x = 1280;
	}

	ShrineArena_DoorsCreated = false;
	
	ShrineArena_CamMoveCounter = 0;

}