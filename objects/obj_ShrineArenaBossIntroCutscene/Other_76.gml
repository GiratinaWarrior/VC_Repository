/// @description

if (!global.ShrineGeneral_Defeated)
{
	//If the message came from a sequence
	if (event_data[? "event_type"] == "sequence event")
	{
		//Do something based on what message was recieved
		switch(event_data[? "message"])
		{
			//If the Shrine General has started moving
			case "ShrineGeneralActivate":
				//Set the music
				SetRoomAudio(music_ShrineGeneralTheme);
				
				//Bring in the player character
				with (obj_Player)
				{
					hascontrol = true;
					x = 224 + 640;
					y = 162 + 270;
				}
			
				if (!ShrineArena_DoorsCreated)
				{
					ShrineArena_EntranceWall = instance_create_layer(928, 416, "Platforms", obj_Wall);
					ShrineArena_ExitWall = instance_create_layer(32, 416, "Platforms", obj_Wall);
					ShrineArena_DoorsCreated = true;
				}
			
				//Create the ShrineGeneral
				if !(instance_exists(obj_ShrineGeneral_Main_PhaseOne))
				{
					instance_create_layer(240, 388, "ShrineGeneral", obj_ShrineGeneral_Main_PhaseOne);
				}
			
				//Destroy the sequence
				layer_sequence_destroy(ShrineArenaBossCutsceneSequenceID);
			
				//Set the camera still
				with (obj_Camera)
				{
					follow = noone;
				//	x = 0;
				//	y = 0;
				}
			
				//Close the arena
				layer_set_visible("Floortiles_Closed", true);
				layer_set_visible("Floortiles_PartialOpen", false);
			
				break;//end activate Shrine General
			
		}//end action from message
	
	}//end sequence message recieved
}