/// @description Pause the sequence to display text

//Access the messages for the Carvaline Orb Cutscene
if (event_data [? "event_type"] == "sequence event")
{
	
	var _textCol = c_white;
	var _textFont = ft_Silver;
	
	//Do things based on the message
	switch(event_data [? "message"])
	{
		//Introduce the sisters and the world they live in
		case "CarvalineOrbCutscene_LongAgo":
			
			var _text = 
			[
				"Moons ago in a forgotten past, two sisters, Cardinia and Valiana, lived in small planet called Nox",
				"Nox existed in complete darkness, unknowing of the light of a star",
				"Despite this darkness, the sisters were kind, and did good deeds for the planets inhabitants"
			]
			
			CutsceneText(_text, "", TEXTBOX_POS.BOTTOM, _textFont, _textCol, blanksprite, false);
			
			break;//end sisters intro
			
		//The sisters meet god and talk to them
		case "CarvalineOrbCutscene_MeetGod":
		
			layer_sequence_destroy(CarvalineorbIntroCutscene_StartStory_Sequence);
		
			var _text = 
			[
				"One night, the sisters shared a strange dream. A red figure appeared before them",
				"The sisters were startled, but the red figure spoke to them",
				"''Children...my children...fear not...come in peace...for you niceness...gift to you''"
			]
			
			CutsceneText(_text, "", 800, _textFont, _textCol, blanksprite, false);
		
			break;//end meet god
			
		//The sisters attained a new power from God
		case "CarvalineOrbCutscene_GotPower":
			
			var _text = 
			[
				"The sisters woke up from the dream feeling strange, and discussed it with each other",
				"They realized that a special power awakened within them, and decided to call it 'vallen'",
			]
			
			CutsceneText(_text, "", 700, _textFont, _textCol, blanksprite, false);
			
			break;//end gained power
			
		//The sisters use their power for good
		case "CarvalineOrbCutscene_UsePower":
		
			var _text = 
			[
				"Cardinia and Valiana decided to use their new powers to make the world a better place",
				"The eternal dark world of Nox had found itself two new stars" 
			]
			CutsceneText(_text, "", 800, _textFont, _textCol, blanksprite, false);
		
			break;//end use power
			
		//The sisters are crowned
		case "CarvalineOrbCutscene_Crowned":
		
			var _text = 
			[
				"The Noxians witnessed their fantastical acts, turning Nox into a utopia",
				"Eventually, the sisters had the respect of the Noxians, who viewed them as angels",
				"Cardinia and Valiana were crowned as the Queens of Nox, and lived their lives luxuriously and happily"
			]
			CutsceneText(_text, "", 800, _textFont, _textCol, blanksprite, false);
			
			break;//end crowned
			
		//Lavender passes by Rose while talking
		case "CarvalineOrbIntro_LavenderPassesRose":
		
			with (obj_Player)
			{
				image_xscale = 1;
			}
		
			break;//end Lavender passes by
			
		//Lavender passes by Rose while leaving
		case "CarvalineOrbIntro_LavenderPassesRose_Again":
		
			with (obj_Player)
			{
				image_xscale = -1;
			}
		
			break;//end Lavender passes by
			
	}//end do thing based on message
	
}//end access messages