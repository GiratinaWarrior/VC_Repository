/// @description Act Upon message recieving

//Check if the message came from a sequence
if (event_data[? "event_type"] == "sequence event")
{
	//Do something based on what message was recieved
	switch(event_data[? "message"])
	{
		//If Lavender is to start talking, recite the prophecy
		case "LavenderStartTalking":
			var LavenderFirstPrologueSpeech = 
			[
				"Where love becomes life and dread becomes death",
				"The new moon rises and draws its first breath",
				"The crown of the dark gazes the black night",
				"And the lunar gem becomes the worlds brightest light"
			]
			CutsceneText(LavenderFirstPrologueSpeech, "Lavender");
			break; //end Lavender Starts talking
			
		//If Lavender should be decipering it
		case "LavenderNormalTalk":
			var LavenderNormalTalk = 
			[
				"If only that thing in my dream spoke my tongue, this would be so much easier, but alas, cryptics I'm stuck with",
				"Let's see, 'love becomes life' probably means I need to get a husband already and get a kid",
				"........",
				"I guess not, huh",
				".........",
				"Prophecies are real annoying, if only the mira-,"
			]
			CutsceneText(LavenderNormalTalk, "Lavender");
			break;//end Lavender Decipher
			
		//If Lavender notices the wierd star
		case "LavenderSeesStar":
			var LavenderStarTalk = 
			[
				"Oh? That star is a strange one, how do you do little star?"
			]
			CutsceneText(LavenderStarTalk, "Lavender");
			break;//end Lavender Sees Wierd Star
			
		//If it's time for Rose to wake up
		case "WakeUpRose":
			TransitionStart(Room_RoseRoom, seq_FadeOut, seq_FadeIn);
			break;//end Wake Up Rose
			
	}//end what message
	
}//end if message came from sequence
