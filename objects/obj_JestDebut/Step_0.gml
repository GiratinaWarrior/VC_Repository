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
			
			with (obj_Camera)
			{
				follow = other.id;
			}
			
			
			
			if (!JestDebut_EnterSequenceCreated)
			{
				
				//Turn off the room music
				SetRoomAudio_Music(blanksound);
				
				//Create the sequence element and id
				 JestDebut_EnterSequenceElm = layer_sequence_create(layer, x, y, seq_JestDebut_Enter);
				 JestDebut_EnterSequenceId = layer_sequence_get_instance(JestDebut_EnterSequenceElm);
				 //Sequence overrides object
				sequence_instance_override_object(JestDebut_EnterSequenceId, object_index, instance_find(object_index, 0));
				JestDebut_EnterSequenceCreated = true;
			}

			else
			{
		
				//If the sequence has finished playing
				if (layer_sequence_is_finished(JestDebut_EnterSequenceElm))
				{

					layer_sequence_destroy(JestDebut_EnterSequenceElm);
					SetRoomAudio_Music(music_JestEncounterTheme, 0.3, 0);
					JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;
				}//end sequence finished
			}
			
			/*
			if (!JestDebut_EnterSequenceCreated)
			{
				TurnObjectToSequence(object_index, seq_JestDebut_Enter, x, y, layer, function(){JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;});
				JestDebut_EnterSequenceCreated = true
			}
			*/
			
			
		#endregion
		
		break;//end Jest enter scene
		
	//When Jest is introduced and starts talking
	case JESTDEBUTCUTSCENE_STAGE.ENTER_TALK:
	
		#region Enter Talk
			
			//show_debug_message("Enter talk scene");
			
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
			
			if (!JestDebut_DanceSequenceCreated)
			{
				//Create the sequence element and id
				 JestDebut_DanceSequenceElm = layer_sequence_create(layer, x, y, seq_JestDebut_Dance);
				 JestDebut_DanceSequenceId = layer_sequence_get_instance(JestDebut_DanceSequenceElm);
				 //Sequence overrides object
				sequence_instance_override_object(JestDebut_DanceSequenceId, object_index, instance_find(object_index, 0));
				JestDebut_DanceSequenceCreated = true;
			}

			else
			{
		
				//If the sequence has finished playing
				if (layer_sequence_is_finished(JestDebut_DanceSequenceElm))
				{

					layer_sequence_destroy(JestDebut_DanceSequenceElm);
					//sequence_destroy(JestDebut_EnterSequenceId);
					JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT_TALK;
				}//end sequence finished
			}
		
		#endregion
	
		break;
		
	//When Jest makes his last speech before leaving
	case JESTDEBUTCUTSCENE_STAGE.EXIT_TALK:
	
		#region Exit Talk
			
			//Create the words Jest says to Rosey
			var _text = 
			[
				"Buuut I'm not about to just tell you what it is, that would ruin the surprise wouldn't it?",
				"Little Rosey, you're going to have the time of your life, huhuhuhu",
				"Now then, I have to go make preparations, so I'll see you when you're Cardinal"
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
			if (!JestDebut_StartedExitTalk)
			{
				CutsceneText(_text, "Jest");
				JestDebut_StartedExitTalk = true;
			}//end Jest start talking
			
			//If Jest has finished talking, starting dancing
			if (!instance_exists(obj_Text) && JestDebut_StartedExitTalk == true)
			{
				JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT;
			}//end Jest finished talking
			
		#endregion
	
		break;//end Jest exit speech
	
	//When Jest starts leaving
	case JESTDEBUTCUTSCENE_STAGE.EXIT:
	
		#region Exit
		
			if (!JestDebut_ExitSequenceCreated)
				{
					//Create the sequence element and id
					 JestDebut_ExitSequenceElm = layer_sequence_create(layer, x, y, seq_JestDebut_Exit);
					 JestDebut_ExitSequenceId = layer_sequence_get_instance(JestDebut_ExitSequenceElm);
					 //Sequence overrides object
					sequence_instance_override_object(JestDebut_ExitSequenceId, object_index, instance_find(object_index, 0));
					JestDebut_ExitSequenceCreated = true;
				}
		
			else
				{
		
					//If the sequence has finished playing
					if (layer_sequence_is_finished(JestDebut_ExitSequenceElm))
					{

						layer_sequence_destroy(JestDebut_ExitSequenceElm);
						with (obj_Camera)
						{
							follow = obj_Player;
						}
						with (obj_Player)
						{
							hascontrol = true;
						}
						global.JestDebut_Cutscene_Seen = true;
						SetRoomAudio_Music(music_ShrinePeacefulTheme, 0.5);
						SaveGame();
						instance_destroy();	
					}//end sequence finished
				}
			
		#endregion
	
		break;//end Jest exit
	
}//end Jest Cutscene Stage