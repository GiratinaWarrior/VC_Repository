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
			"The crown of the dark is consumed by the black night",
			"And the lunar gem becomes the worlds brightest light"
		];
		
		/*
			Where love becomes life and dread becomes death: Where the roses grow (New Moon Garden), the circle of life
			The new moon rises and draws its first breath: Rose opens her eyes
			The crown of the dark gazes is consumed by the black night: Lavender is killed by Voizatia
			And the lunar gem becomes the worlds brightest light: Rose becomes the hero of Nox
		*/
		
		//If Lavender has started talking
		if !(PrologueCutscene_ProphecyTalkStarted)
		{
			//Destroy the previous sequence
			layer_sequence_destroy(PrologueCutscene_EnterSequence);
			
			//Cutscene Text
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Lavender, c_red);
			
			//Display Lavender's idle sprite
			PrologueCutscene_LavenderSprite = layer_sprite_create(layer, room_width/2 - 222, room_height/2 - 14, spr_Lavender_Idle);
			layer_sprite_blend(PrologueCutscene_LavenderSprite, c_black);
			layer_sprite_xscale(PrologueCutscene_LavenderSprite, -1);
			
			PrologueCutscene_ProphecyTalkStarted = true;
		}//end Lavender start talking
		
		//If Lavender has finished talking
		else if (!instance_exists(obj_Text))
		{	
			//Move on to the Star Approach Stage
			if (PrologueCutscene_TimeSource == noone) PrologueCutscene_TimeSource = TimeSourceCreateAndStart(90, function() {PrologueCutscene_Stage = PROLOGUECUTSCENE.PROPHECY_DECIPHER; time_source_destroy(PrologueCutscene_TimeSource); PrologueCutscene_TimeSource = noone;});
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
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Lavender);
			PrologueCutscene_ProphecyDecipherStarted = true;
		}
		//When lavender is finsihed talking
		else if (!instance_exists(obj_Text))
		{
			if (PrologueCutscene_TimeSource == noone) PrologueCutscene_TimeSource = TimeSourceCreateAndStart(30, function(){layer_sprite_xscale(PrologueCutscene_LavenderSprite, 1); time_source_destroy(PrologueCutscene_TimeSource); PrologueCutscene_TimeSource = noone})
			if (PrologueCutscene_TimeSource2 == noone) PrologueCutscene_TimeSource2 = TimeSourceCreateAndStart(90, function(){PrologueCutscene_Stage = PROLOGUECUTSCENE.STAR_NOTICE; time_source_destroy(PrologueCutscene_TimeSource2); PrologueCutscene_TimeSource2 = noone});
		}
		
		break;//end Prophecy Decipher Stage 
		
	//Star Notice Stage: Lavender notices the odd star in the sky
	case PROLOGUECUTSCENE.STAR_NOTICE:
		
		//SetRoomAudio_Music_Default();
		
		//Lavender's speech
		var _text = 
		[
			"Oh? That star is a strange one.", 
			"How do you do little star?"
		];
		
		//Start Lavenders deciphering of the prophecy
		if !(PrologueCutscene_StarNoticeStarted)
		{
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Lavender);
			PrologueCutscene_StarNoticeStarted = true;
		}
		//When Lavender is finished talking
		else if (!instance_exists(obj_Text))
		{
			audio_play_sound(sound_Starcrosser, 10, false);
			PrologueCutscene_Stage = PROLOGUECUTSCENE.STAR_APPROACH;
		}
		
		break;//end Star Notice Stage
		
	//Star Approach Stage: The wierd star rapidly gets closer as the screen fades to white
	case PROLOGUECUTSCENE.STAR_APPROACH:
		
		//Create the sequences
		if !(PrologueCutscene_StarApproachSequencesCreated)
		{
			
			PrologueCutscene_StarApproach_StarSequence = layer_sequence_create(layer_get_id("StarPod"), 480, room_height/2 - 14, seq_PrologueCutscene_Star);
			
			var _func = function()
			{
				PrologueCutscene_StarApproach_WhiteSequence = layer_sequence_create(layer_get_id("PrologueEnd"), 480, room_height/2 - 14, seq_PrologueCutscene_White);
				time_source_destroy(PrologueCutscene_TimeSource);
				PrologueCutscene_TimeSource = noone;
			}
			if (PrologueCutscene_TimeSource == noone) PrologueCutscene_TimeSource = TimeSourceCreateAndStart(70, _func);
			
			PrologueCutscene_StarApproachSequencesCreated = true;
		}
		
		else if (layer_sequence_is_finished(PrologueCutscene_StarApproach_WhiteSequence))
		{
			PrologueCutscene_Stage = PROLOGUECUTSCENE.END;
		}
		else
		{
			var _shake = 0.5;	
		
			layer_sequence_x(PrologueCutscene_StarApproach_StarSequence, layer_sequence_get_x(PrologueCutscene_StarApproach_StarSequence) + (irandom_range(1, -1) * _shake));
			layer_sequence_y(PrologueCutscene_StarApproach_StarSequence, layer_sequence_get_y(PrologueCutscene_StarApproach_StarSequence) + (irandom_range(1, -1) * _shake));
			
		}
		
		break;//end Star Approach Stage
	
	//End Stage: The room transitions to Roses's Room
	case PROLOGUECUTSCENE.END:
		
		SummonPlayer(128, 176);
		
		TransitionStart(Room_RoseRoom, seq_FadeOut, seq_FadeIn);
		
		instance_destroy();
		
		break;
		
}//end Stage machine

