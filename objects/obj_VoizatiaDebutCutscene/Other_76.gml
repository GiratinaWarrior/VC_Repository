/// @description

if (event_data[? "event_type"] == "sequence event")
{
	//Do something based on what message was recieved
	switch(event_data[? "message"])
	{
		case "VoizatiaDebut_FloatEnd":
		
			if (VoizatiaDebut_State == VOIZATIADEBUT.VOIZATIA_EXIT)
			{
				layer_sequence_pause(VoizatiaDebut_VoizatiaIdle_Sequence);
				VoizatiaDebut_VoizatiaExit_FloatEnd = true;
			}
			
			break;
		
		case "VoizatiaDebut_FloatEnd_Malvalia":
		
			if (VoizatiaDebut_State == VOIZATIADEBUT.MALVALIA_EXIT)
			{
				layer_sequence_pause(VoizatiaDebut_MalvaliaIdle_Sequence);
				VoizatiaDebut_MalvaliaExit_FloatEnd = true;
			}
		
			break;
		
	}
	
}




