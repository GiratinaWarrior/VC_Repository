/// @description Act Upon message recieving

if (event_data[? "event_type"] == "sequence event")
{
	switch(event_data[? "message"])
	{
		case "LavenderStartTalking":
			var LavenderFirstPrologueSpeech = 
			[
				"Where love becomes life and dread becomes death",
				"The new moon rises and draws its first breath",
				"The crown of the dark gazes the black night",
				"And the lunar gem becomes the worlds brightest light"
			]
			CutsceneText(LavenderFirstPrologueSpeech);
			break;
			
		case "LavenderNormalTalk":
			var LavenderNormalTalk = 
			[
				"If only the God's spoke my tongue, this would be so much easier"
			]
			CutsceneText(LavenderNormalTalk)
			break;
	}
} 
