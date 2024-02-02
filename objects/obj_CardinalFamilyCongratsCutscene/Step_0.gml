/// @description Stages of the Cutscene

CardinalFamilyCongrats_skipButton = global.Key_Skip;

if (CardinalFamilyCongrats_skippable) && (CardinalFamilyCongrats_skipButton)
{
	CardinalFamilyCongrats_skipFunc();
}

obj_Player.hascontrol = false;

switch(CardinalFamilyCongrats_Stage)
{
	//Enter Stage: Lavender will fly from above and land in front of Rose
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_ENTER:
		
		#region Lavender Enter
		
			SetRoomAudio_Music();
		
			//If an entrance sequence hasnt been created, create it
			if (!CardinalFamilyCongrats_EnterSequenceCreated)
			{
				CardinalFamilyCongrats_EnterSequenceElm = layer_sequence_create(layer, x, y, seq_CardinalFamilyCongratsCutscene_Enter);
				CardinalFamilyCongrats_EnterSequenceCreated = true;
			}//end entrance sequence not created
		
			//If the entrance sequence has been created
			else
			{
				//If the sequence is finished, move on to the next stage
				if (layer_sequence_is_finished(CardinalFamilyCongrats_EnterSequenceElm))
				{
					CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_TALK;
				}//end sequence finished
			
			}//end entrance sequence created
		
		#endregion
		
		break;//end Enter Stage
		
	//Talk Stage: Lavender will congratulate Rose for becoming Cardinal
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_TALK:
		
		#region Lavender Talk
		
			SetRoomAudio_Music_Default(music_LavenderEncounterTheme);
		
			if (layer_sequence_exists(layer, CardinalFamilyCongrats_EnterSequenceElm))
			{
				layer_sequence_destroy(CardinalFamilyCongrats_EnterSequenceElm);
			}
		
			//Lavenders speech
			var _text = 
			[
				"Greetings, Rose-darling, it sure took you long enough to make it here.",
				"Although I suppose it is of no surprise, given the how difficult my trials were.",
				"So congratulations Rose-darling, you have completed the first of my difficult trials, and are ready for the final test.",
				"But before you undergo the test, you must understand what it means to be the Cardinal of Nox.",
				"And for the record, you may not 'skip my dialogue' or however you word it, this is very important.",
				"Do not.",
				"I will be taking away your skip dialogue priviledges temporarily.",
				"Rose-darling. Listen.",
				"The duty of a Cardinal, is to act as a guardian to the Noxians, protecting them, and guiding them.",
				"At least, that's what everyone outside of this shrine knows, but there is one more thing that a Cardinal is responsible for.",
			];
			
			var _voice = 
			[
				sound_Lavender_Talk_Aleevah, //greetings
				sound_Lavender_Talk_AloBAwaKIneru,  //although
				sound_Lavender_Excited_GurumeNEEtoom, //congrats
				sound_Lavender_Talk_Gonnamenah, //but before
				sound_Lavender_Talk_RinuLefoom, //skip dialogue
				sound_Lavender_Excited_AREEsheneLEEN, //do not
				sound_Lavender_Talk_AnaSOOnaREEM, //taking away
				sound_Lavender_Talk_RinuLefoom, //listen
				sound_Lavender_Excited_Avinasoom, //the duty
				sound_Lavender_Talk_AloBAwaKIneru //at least
			]
		
			//If Lavender hasn't started talking, TALK
			if (!CardinalFamilyCongrats_TalkStarted)
			{
				CardinalFamilyCongrats_Speech = CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				CardinalFamilyCongrats_Speech.TextBox_Voices = _voice;
				CardinalFamilyCongrats_TalkLavenderSprite = layer_sprite_create(layer, x + 145, y - 16, spr_Lavender_Idle);
				CardinalFamilyCongrats_TalkStarted = true;
			}
			//If Lavender has finished talking
			else if (!instance_exists(obj_Text))
			{
				//Move on to the fly away stage
				CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_FLY_EXIT;
			}
			//If its time to take away your skip dialogue priviledges
			else if (CardinalFamilyCongrats_Speech.TextBox_Page >= 4)
			{
				CardinalFamilyCongrats_Speech.TextBox_TextSkippable = false;
				CardinalFamilyCongrats_Speech.TextBox_CharIncrease = 0.5;
			}
			
		#endregion
		
		break;//end Talk Stage
		
	//Fly Exit Stage: Lavender flies in the direction of the basement
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_FLY_EXIT:
		
		#region Fly Exit
		
			//Create the exit sequence
			if (!CardinalFamilyCongrats_ExitSequenceCreated)
			{
				CardinalFamilyCongrats_ExitSequenceElm = layer_sequence_create(layer, x, y, seq_CardinalFamilyCongratsCutscene_FlyExit);
				CardinalFamilyCongrats_TimeSource = TimeSourceCreateAndStart(5, function(){layer_sprite_alpha(CardinalFamilyCongrats_TalkLavenderSprite, 0); time_source_destroy(CardinalFamilyCongrats_TimeSource); CardinalFamilyCongrats_TimeSource = noone;});
				CardinalFamilyCongrats_ExitSequenceCreated = true;
			}
		
			//After the sequence is created
			else
			{
				//if the sequence is finished
				if (layer_sequence_is_finished(CardinalFamilyCongrats_ExitSequenceElm))
				{
					CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_EXIT_TALK;
				}
			}
			
		#endregion
		
		break;//end Fly Exit Stage

	//Exit Talk Stage: Lavender beckons Rose to follow her
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_EXIT_TALK:
	
		#region Lavender Exit Talk
	
			if (layer_sequence_exists(layer, CardinalFamilyCongrats_ExitSequenceElm))
			{
				layer_sequence_destroy(CardinalFamilyCongrats_ExitSequenceElm);
			}
	
			//Lavenders speech
			var _text = 
			[
				"Follow me"
			]
			
			var _voice = 
			[
				sound_Lavender_Talk_Aleevah
			]
		
			//If Lavender hasn't started talking, TALK
			if (!CardinalFamilyCongrats_ExitTalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				layer_sprite_x(CardinalFamilyCongrats_TalkLavenderSprite, x);
				layer_sprite_y(CardinalFamilyCongrats_TalkLavenderSprite, y + 176);
				layer_sprite_xscale(CardinalFamilyCongrats_TalkLavenderSprite, -1);
				layer_sprite_alpha(CardinalFamilyCongrats_TalkLavenderSprite, 1);
				CardinalFamilyCongrats_ExitTalkStarted = true;
			}
			//If Lavender has finished talking
			else if (!instance_exists(obj_Text))
			{
				//Move on to the fly away stage
				CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_WALK_EXIT;
		}
		
		#endregion
		
		break;//end Exit Talk Stage
		
	//Walk Exit Stage: Lavender leaves the scene, 
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_WALK_EXIT:
	
		#region Walk Exit
	
			//Create the exit sequence
			if (!CardinalFamilyCongrats_WalkExitSequenceCreated)
			{
				CardinalFamilyCongrats_WalkExitSequenceElm = layer_sequence_create(layer, x, y, seq_CardinalFamilyCongratsCutscene_WalkExit);
				layer_sprite_destroy(CardinalFamilyCongrats_TalkLavenderSprite);
				CardinalFamilyCongrats_WalkExitSequenceCreated = true;
			}
		
			//After the sequence is created
			else
			{
				//if the sequence is finished
				if (layer_sequence_is_finished(CardinalFamilyCongrats_WalkExitSequenceElm))
				{
					CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.END;
				}
			}
			
		#endregion
	
		break;//end Walk Exit Stage
	
	//End Stage: The cutscene is over, reset everything
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.END:
	
		#region End
	
			SetRoomAudio_Music_Default(music_ShrinePeacefulTheme);
	
			//destroy the previous sequence
			if (layer_sequence_exists(layer, CardinalFamilyCongrats_WalkExitSequenceElm))
			{
				layer_sequence_destroy(CardinalFamilyCongrats_WalkExitSequenceElm);
			}
		
			with (obj_Player)
			{
				hascontrol = true;
			}
		
			global.CardinalCongratulation_Family = true
			
			PlayerFullHeal();
			
			SetSpawnpoint(obj_Player.x, obj_Player.y);
			
			SaveGame();
			
			instance_destroy();
		
		#endregion
	
		break;//end End Stage
		
		
		
}//end Stage machine
