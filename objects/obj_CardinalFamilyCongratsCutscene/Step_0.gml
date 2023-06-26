/// @description Stages of the Cutscene

switch(CardinalFamilyCongrats_Stage)
{
	//Enter Stage: Lavender will fly from above and land in front of Rose
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_ENTER:
		
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
		
		break;//end Enter Stage
		
	//Talk Stage: Lavender will congratulate Rose for becoming Cardinal
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_TALK:
		
		if (layer_sequence_exists(layer, CardinalFamilyCongrats_EnterSequenceElm))
		{
			layer_sequence_destroy(CardinalFamilyCongrats_EnterSequenceElm);
		}
		
		
		//Lavenders speech
		var _text = 
		[
			"Greetings, Rose-darling, it sure took you long enough to make it here.",
			"Although I suppose it is of no surprise, given the how difficult my trials were.",
			"So congratulations Rose-darling, you are now officially the Cardinal of Nox.",
			"As for what you do, I'll explain that right now.",
			"And for the record, you may not 'skip my dialogue' or however you word it, this is very important.",
			"The duty of a Cardinal, is to act as a guardian to the Noxians, protecting them, and guiding them.",
			"At least, that's what everyone outside of this shrine knows, but there is one more thing that a Cardinal is responsible for",
		]
		
		//If Lavender hasn't started talking, TALK
		if (!CardinalFamilyCongrats_TalkStarted)
		{
			CutsceneText(_text, "Lavender");
			CardinalFamilyCongrats_TalkLavenderSprite = layer_sprite_create(layer, x + 145, y - 16, spr_Lavender_Idle);
			CardinalFamilyCongrats_TalkStarted = true;
		}
		//If Lavender has finished talking
		else if (!instance_exists(obj_Text))
		{
			//Move on to the fly away stage
			CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_FLY_EXIT;
		}
		
		break;//end Talk Stage
		
	//Fly Exit Stage: Lavender flies in the direction of the basement
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_FLY_EXIT:
		
		
		
		//Create the exit sequence
		if (!CardinalFamilyCongrats_ExitSequenceCreated)
		{
			CardinalFamilyCongrats_ExitSequenceElm = layer_sequence_create(layer, x, y, seq_CardinalFamilyCongratsCutscene_FlyExit);
			TimeSourceCreateAndStart(5, function(){layer_sprite_alpha(CardinalFamilyCongrats_TalkLavenderSprite, 0)});
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
		
		break;//end Fly Exit Stage

	//Exit Talk Stage: Lavender beckons Rose to follow her
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_EXIT_TALK:
	
		if (layer_sequence_exists(layer, CardinalFamilyCongrats_ExitSequenceElm))
		{
			layer_sequence_destroy(CardinalFamilyCongrats_ExitSequenceElm);
		}
	
		//Lavenders speech
		var _text = 
		[
			"Follow me"
		]
		
		//If Lavender hasn't started talking, TALK
		if (!CardinalFamilyCongrats_ExitTalkStarted)
		{
			CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP);
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
		
		break;//end Exit Talk Stage
		
	//Walk Exit Stage: Lavender leaves the scene, 
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.LAVENDER_WALK_EXIT:
	
		
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
	
		break;//end Walk Exit Stage
		
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.END:
	
		//destroy the previous sequence
		if (layer_sequence_exists(layer, CardinalFamilyCongrats_WalkExitSequenceElm))
		{
			layer_sequence_destroy(CardinalFamilyCongrats_WalkExitSequenceElm);
		}
		
		with (obj_Player)
		{
			hascontrol = true;
		}
		
		global.CardinalCongratulation_Family = true;
		SaveGame();
	
		break;
		
		
		
}//end Stage machine
