/// @description Stage Machine

switch (PrologueCutscene_Stage)
{
	//Enter Stage: Lavender walks in to observe the moon
	case PROLOGUECUTSCENE.ENTER:
		
		//Create the sequence of Lavender entering the scene
		if !(PrologueCutscene_EnterSequenceCreated)
		{
			PrologueCutscene_EnterSequence = layer_sequence_create(layer, room_width/2, room_height/2 + 2, seq_PrologueCutscene_Enter);
			PrologueCutscene_EnterSequenceCreated = true;
		}
		
		//After the sequence is finished, move to the next stage
		else if (layer_sequence_is_finished(PrologueCutscene_EnterSequence))
		{
			PrologueCutscene_Stage = PROLOGUECUTSCENE.PROPHECY_TALK;
		}
		
		break;//end Enter Stage
	
	//Prophecy Talk Stage: Lavender recites the prophecy, and attempts to decipher it
	case PROLOGUECUTSCENE.PROPHECY_TALK:
		
		//Lavender's speech
		var _text = 
		[
			"Where love becomes life and dread becomes death",
			"The new moon rises and draws its first breath",
			"The crown of the dark gazes the black night",
			"And the lunar gem becomes the worlds brightest light"
		];
		
		//If Lavender has started talking
		if !(PrologueCutscene_ProphecyTalkStarted)
		{
			//Destroy the previous sequence
			layer_sequence_destroy(PrologueCutscene_EnterSequence);
			
			//Cutscene Text
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Silver, c_red);
			
			//Display Lavender's idle sprite
			PrologueCutscene_LavenderSprite = layer_sprite_create(layer, room_width/2 - 222, room_height/2 - 14, spr_Lavender_Idle);
			layer_sprite_blend(PrologueCutscene_LavenderSprite, c_black);
			layer_sprite_xscale(PrologueCutscene_LavenderSprite, -1);
			
			PrologueCutscene_ProphecyTalkStarted = true;
		}//end Lavender start talking
		
		//If Lavender has finished talking
		else if (!instance_exists(obj_Text))
		{	
			//In 50 frames, move on to the Star Approach Stage
			TimeSourceCreateAndStart(90, function() {PrologueCutscene_Stage = PROLOGUECUTSCENE.PROPHECY_DECIPHER});
		}
		
		break;//end Prophecy Talk Stage
	
	//Prophecy Decipher Stage: Lavender attempts to decipher the poem, but fails
	case PROLOGUECUTSCENE.PROPHECY_DECIPHER:
		
		//Lavender's speech
		var _text = 
		[
			"If God spoke my tongue, everything would be so much easier, but alas, I have been left with cryptics.",
			"Let's see, 'love becomes life' probably means I need to hurry up and get a family started.",
			"........",
			"I guess not, huh",
			".........",
			"Prophecies are real annoying, if only the ans-,"
		];
		
		//Start Lavenders deciphering of the prophecy
		if !(PrologueCutscene_ProphecyDecipherStarted)
		{
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Silver);
			PrologueCutscene_ProphecyDecipherStarted = true;
		}
		//When lavender is finsihed talking
		else if (!instance_exists(obj_Text))
		{
			TimeSourceCreateAndStart(30, function(){layer_sprite_xscale(PrologueCutscene_LavenderSprite, 1)})
			TimeSourceCreateAndStart(90, function(){PrologueCutscene_Stage = PROLOGUECUTSCENE.STAR_NOTICE});
		}
		
		break;//end Prophecy Decipher Stage 
		
	//Star Notice Stage: Lavender notices the odd star in the sky
	case PROLOGUECUTSCENE.STAR_NOTICE:
	
		//Lavender's speech
		var _text = 
		[
			"Oh? That star is a strange one.", 
			"How do you do little star?"
		];
		
		//Start Lavenders deciphering of the prophecy
		if !(PrologueCutscene_StarNoticeStarted)
		{
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Silver);
			PrologueCutscene_StarNoticeStarted = true;
		}
		//When Lavender is finished talking
		else if (!instance_exists(obj_Text))
		{
			PrologueCutscene_Stage = PROLOGUECUTSCENE.STAR_APPROACH;
		}
		
		break;//end Star Notice Stage
		
	//Star Approach Stage: The wierd star rapidly gets closer as the screen fades to white
	case PROLOGUECUTSCENE.STAR_APPROACH:
		
		PrologueCutscene_Function_StopMusic = function()
		{
			SetRoomAudio_Music(blanksound, 0, 0);
		}
		
		//Create the sequences
		if !(PrologueCutscene_StarApproachSequencesCreated)
		{
			
			PrologueCutscene_StarApproach_StarSequence = layer_sequence_create(layer_get_id("StarPod"), 480, room_height/2 - 14, seq_PrologueCutscene_Star);
			PrologueCutscene_StarApproach_WhiteSequence = layer_sequence_create(layer_get_id("PrologueEnd"), 480, room_height/2 - 14, seq_PrologueCutscene_White);
			
			PrologueCutscene_StarApproachSequencesCreated = true;
		}
		
		else
		{
			if (layer_sequence_is_finished(PrologueCutscene_StarApproach_WhiteSequence))
			{
				PrologueCutscene_Stage = PROLOGUECUTSCENE.END;
			}
		}
		
		break;//end Star Approach Stage
	
	//End Stage: The room transitions to Roses's Room
	case PROLOGUECUTSCENE.END:
	
		TransitionStart(Room_RoseRoom, seq_FadeOut, seq_FadeIn);
		
		break;
		
}//end Stage machine

