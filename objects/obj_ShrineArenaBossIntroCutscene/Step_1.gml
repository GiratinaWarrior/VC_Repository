/// @description

//show_debug_message("Camera Follow: {0}", object_get_name(obj_Camera.follow));
show_debug_message("Camera X: {0}", obj_Camera.x);

//If a room transition is not occuring
if (!global.MidTransition)
{
	//Play the cutscene
	layer_sequence_play(ShrineArenaBossCutsceneSequenceID);
	
	if (ShrineArena_CamMoveCounter++ > 7)
	{
		//Access camera object and set the cameras movement
		with (obj_Camera)
		{
			follow = noone;
			x -= (432/195);
		}//end access camera
	}
	
}//end room transition finished

//If a room transition is occuring
else
{
	//Pause the cutscene
	layer_sequence_pause(ShrineArenaBossCutsceneSequenceID);
	//Access camera object and freeze the camera
	with (obj_Camera)
	{
		x = room_width;
		follow = noone;
	}//end access camera
	
}//end room transition occuring