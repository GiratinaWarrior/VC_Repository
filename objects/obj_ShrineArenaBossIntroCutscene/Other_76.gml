/// @description

//If the message came from a sequence
if (event_data[? "event_type"] == "sequence event")
{
	//Do something based on what message was recieved
	switch(event_data[? "message"])
	{
		//If the Shrine General has started moving
		case "ShrineGeneralActivate":
			SetRoomAudio(music_ShrineGeneralTheme);
			with (obj_Player)
			{
				hascontrol = true;
				x = 224 + 640;
				y = 162 + 270;
			}
			instance_create_layer(928, 416, "Platforms", obj_WallPlatform);
			if !(instance_exists(obj_ShrineGeneral_Main_PhaseOne))
			{
				instance_create_layer(240, 388, "ShrineGeneral", obj_ShrineGeneral_Main_PhaseOne);
			}
			layer_sequence_destroy(ShrineArenaBossCutsceneSequenceID);
			with (obj_Camera)
			{
				follow = noone;
				x = 0;
				y = 0;
			}
			break;//end activate Shrine General
			
	}//end action from message
	
}//end sequence message recieved