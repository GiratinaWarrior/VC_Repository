/// @description The different stages for Jest

y = clamp(y, 0, room_height);

show_debug_message("speed: {0}", speed);

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
				TurnObjectToSequence(object_index, seq_JestDebut_Enter, x, y, layer, function(){JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;});
				JestDebut_EnterSequenceCreated = true
			}
			
			
			
		#endregion
		
		break;//end Jest enter scene
		
	//When Jest is introduced and starts talking
	case JESTDEBUTCUTSCENE_STAGE.ENTER_TALK:
	
		#region Enter Talk
			
			show_debug_message("Enter talk scene");
			
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
				TurnObjectToSequence(object_index, seq_JestDebut_Dance, x, y, layer, function(){JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT_TALK;});
				JestDebut_DanceSequenceCreated = true;
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
	
		var _exitfunc = function()
		{
			with (obj_Camera)
			{
				follow = obj_Player;
			}
			with (obj_Player)
			{
				hascontrol = true;
			}
			instance_destroy();	
		}
	
		if (!JestDebut_ExitSequenceCreated)
		{
			TurnObjectToSequence(object_index, seq_JestDebut_Exit, x, y, layer, _exitfunc);
			
			JestDebut_ExitSequenceCreated = true;
		}
	
		break;//end Jest exit
	
}//end Jest Cutscene Stage