/// @description The different stages for Jest

//Do things based on what stage the Jest Cutscene is at
switch(JestDebut_Stage)
{
	
	//While Jest is inactive
	case JESTDEBUTCUTSCENE_STAGE.OFFSCREEN:
	
		#region Offscreen 
	
			//If Jest hasn't laughed yet
			if (!JestDebut_StartedOffscreenTalk)
			{
				CutsceneText(["Huhuhuuu..."], "???");
				JestDebut_StartedOffscreenTalk = true;
			}//ed Jest hasn't laughed
		
			/*
			If Jest has started their talk, and the textbox is gone,
			then Jest has finished talking
			*/
			else if (JestDebut_StartedOffscreenTalk && !instance_exists(obj_Text))
			{
				JestDebut_FinishedOffscreenTalk = true;
			}//end something idk
			
			//If Jest has finished talking, begin the enter stage
			if (JestDebut_FinishedOffscreenTalk)
			{
				JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER;
			}//end if finished, enter stage
			
		#endregion
		
		break;//end while Jest is offscreen
	
	
	//When Jest is entering the scene
	case JESTDEBUTCUTSCENE_STAGE.ENTER:
		
		#region Enter
			
			//If the sequence hasn't been created yet, create it
			if (!JestDebut_EnterSequenceCreated)
			{
				JestDebut_EnterSeqElm = layer_sequence_create(layer, x, y, seq_JestDebut_Enter);
				JestDebut_EnterSeqId = layer_sequence_get_instance(JestDebut_EnterSeqElm);
				JestDebut_EnterSequenceCreated = true;
			}//end sequence not created
			
			//If the sequence has been created
			else
			{
				//Sequence overrides object
				sequence_instance_override_object(JestDebut_EnterSeqId, obj_JestDebut, instance_find(obj_JestDebut, 0))
				
				//If the sequence has finished playing
				if (layer_sequence_is_finished(JestDebut_EnterSeqElm))
				{
					JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;
				}//end sequence finished
				
			}//end sequence created
			
		#endregion
		
		break;//end Jest enter scene
		
	//When Jest is introduced and starts talking
	case JESTDEBUTCUTSCENE_STAGE.ENTER_TALK:
	
		#region Enter Talk
			
			//Create the words Jest says to Rosey
			var _text = 
			[
				"Huhuhello Rosey, it seems you've cleared the other trials with ease.",
				"Mother says it'll take blood and sweat to pass her tests, but look at you now!",
				"Don't worry Rosey, your brother has got a more exciting trial awaiting you!"
			]
			
			with (obj_Text)
			{
				if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
				{
					other.image_speed = 1;
				}
				else
				{
					other.image_speed = 0;
					other.image_index = 0;
				}
			}
			
			//If Jest hasn't started talking, start talking
			if (!JestDebut_StartedEnterTalk)
			{
				CutsceneText(_text, "Jest");
				JestDebut_StartedEnterTalk = true;
			}//end Jest start talking
			
			//If Jest has finished talking, starting dancing
			if (!instance_exists(obj_Text) && JestDebut_StartedEnterTalk == true)
			{
				JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.DANCE;
			}//end Jest finished talking
			
		#endregion
		
		break;//end Jest starts talking
		
	//When Jest starts dancing
	case JESTDEBUTCUTSCENE_STAGE.DANCE:
	
		#region Dance
			
			//If the sequence hasn't been created yet, create it
			if (!JestDebut_DanceSequenceCreated)
			{
				JestDebut_DanceSeqElm = layer_sequence_create(layer, x, y, seq_JestDebut_Dance);
				JestDebut_DanceSeqId = layer_sequence_get_instance(JestDebut_DanceSeqElm);
				JestDebut_EnterSequenceCreated = true;
			}//end sequence not created
			
			//If the sequence has been created
			else
			{
				//Sequence overrides object
				sequence_instance_override_object(JestDebut_DanceSeqId, obj_JestDebut, instance_find(obj_JestDebut, 0))
				
				//If the sequence has finished playing
				if (layer_sequence_is_finished(JestDebut_DanceSeqElm))
				{
					JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT_TALK;
				}//end sequence finished
				
			}//end sequence created
			
		#endregion
	
		break;
	
}