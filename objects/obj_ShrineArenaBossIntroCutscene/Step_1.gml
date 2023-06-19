/// @description

if (!global.MidTransition)
{
	layer_sequence_play(ShrineArenaBossCutsceneSequenceID);
	if (!ShrineArena_CameraSet)
	{
		with (obj_Camera)
		{
			x = 1280;
			follow = noone;
		}
		ShrineArena_CameraSet = true;
	}

	else
	{
		with (obj_Camera)
		{
			follow = noone;
			//x -= 2;
		}
	}
}
else
{
	layer_sequence_pause(ShrineArenaBossCutsceneSequenceID);
	with (obj_Camera)
	{
		x = 1280;
		follow = noone;
	}
}