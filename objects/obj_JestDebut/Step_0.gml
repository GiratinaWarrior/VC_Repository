/// @description The different stages for Jest


//Do things based on what stage the Jest Cutscene is at
switch(JestDebut_Stage)
{
	
	//While Jest is inactive
	case JESTDEBUTCUTSCENE_STAGE.OFFSCREEN:
	
		SetRoomAudio_Music(blanksound);
	
		var _text = 
		[
			"Huhuhuuu...."
		]
	
		var _voice = 
		[
			sound_Jest_Laugh_HAhaha
		]
		
		if !(JestDebut_StartedOffscreenTalk)
		{
			CutsceneText(_text, "???", TEXTBOX_POS.BOTTOM, ft_Jest);
			//obj_Text.TextBox_Voices = _voice;
			JestDebut_StartedOffscreenTalk = true;
		}
		
		else if (!instance_exists(obj_Text))
		{
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER;
		}
		
		break;//end while Jest is offscreen
	
	
	//When Jest is entering the scene
	case JESTDEBUTCUTSCENE_STAGE.ENTER:
		
		if !(JestDebut_EnterSequenceCreated)
		{
			JestDebut_EnterSequence = layer_sequence_create(layer, x, y, seq_JestDebut_Enter);
			//Turn off the room music
			JestDebut_EnterSequenceCreated = true;
		}
		else if (layer_sequence_is_finished(JestDebut_EnterSequence))
		{
			JestDebut_Sprite = layer_sprite_create(layer, 236, 231, spr_Jest_Idle);
			layer_sprite_speed(JestDebut_Sprite, 0);
			layer_sequence_destroy(JestDebut_EnterSequence);
			SetRoomAudio_Music_Default(music_JestEncounterTheme);
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;
		}
		
		break;//end Jest enter scene
		
	//When Jest is introduced and starts talking
	case JESTDEBUTCUTSCENE_STAGE.ENTER_TALK:
	
		var _text = 
		[
			"Huhuhello Rosey, it seems you've cleared the other trials with ease.",
			"Mother says it'll take blood and sweat to pass her tests, but look at you now!",
			"Don't worry Rosey, your brother has got a more exciting trial awaiting you!"
		]
		
		var _voice = 
		[
			sound_Jest_Laugh_HAhaha,
			sound_Jest_Talk_halezaDIZEna,
			sound_Jest_Talk_haleKIzena
		]
		
	
		//If Jest hasn't started talking
		if !(JestDebut_EnterTalkStarted)
		{
			CutsceneText(_text, "Jest", TEXTBOX_POS.BOTTOM, ft_Jest);
			obj_Text.TextBox_Voices = _voice;
			JestDebut_EnterTalkStarted = true;
		}
	
		//If jest is currently talking
		else if (instance_exists(obj_Text))
		{
			with (obj_Text)
			{
				if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
				{
					layer_sprite_speed(other.JestDebut_Sprite, 1);
				}
				else
				{
					layer_sprite_speed(other.JestDebut_Sprite, 0);
				}
			}
		}
		
		//If Jest has finished talking
		else
		{
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.DANCE;
		}
		
		break;//end Jest starts talking
		
	//When Jest starts dancing
	case JESTDEBUTCUTSCENE_STAGE.DANCE:
	
		if !(JestDebut_DanceSequenceCreated)
		{
			layer_sprite_alpha(JestDebut_Sprite, 0);
			JestDebut_DanceSequence = layer_sequence_create(layer, layer_sprite_get_x(JestDebut_Sprite), layer_sprite_get_y(JestDebut_Sprite), seq_JestDebut_Dance);
			JestDebut_DanceSequenceCreated = true;
		} 
		else if (layer_sequence_is_finished(JestDebut_DanceSequence))
		{
			layer_sprite_alpha(JestDebut_Sprite, 1);
			layer_sequence_destroy(JestDebut_DanceSequence);
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT_TALK;
		}
	
		break;
		
	//When Jest makes his last speech before leaving
	case JESTDEBUTCUTSCENE_STAGE.EXIT_TALK:
	
		//Create the words Jest says to Rosey
		var _text = 
		[
			"Buuut I'm not about to just tell you what it is, that would ruin the surprise wouldn't it?",
			"Little Rosey, you're going to have the time of your life, huhuhuhu",
			"Now then, I have to go make preparations, so I'll see you when you're Cardinal"
		]
	
		var _voice = 
		[
			sound_Jest_Talk_Volapachi_Halaka,
			sound_Jest_Talk_halezaDIZEna,
			sound_Jest_Talk_jaravajikaraZHAna,
		]
	
		//If Jest hasn't started talking
		if !(JestDebut_StartedExitTalk)
		{
			CutsceneText(_text, "Jest", TEXTBOX_POS.BOTTOM, ft_Jest);
			obj_Text.TextBox_Voices = _voice;
			JestDebut_StartedExitTalk = true;
		}
	
		//If jest is currently talking
		else if (instance_exists(obj_Text))
		{
			with (obj_Text)
			{
				if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
				{
					layer_sprite_speed(other.JestDebut_Sprite, 1);
				}
				else
				{
					layer_sprite_speed(other.JestDebut_Sprite, 0);
				}
			}
		}
		
		//If Jest has finished talking
		else
		{
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.EXIT;
		}
		
		
		break;//end Jest exit speech
	
	//When Jest starts leaving
	case JESTDEBUTCUTSCENE_STAGE.EXIT:
	
		//If the sequence hasn't started
		if !(JestDebut_ExitSequenceCreated)
		{
			layer_sprite_alpha(JestDebut_Sprite, 0);
			JestDebut_ExitSequence = layer_sequence_create(layer, layer_sprite_get_x(JestDebut_Sprite), layer_sprite_get_y(JestDebut_Sprite), seq_JestDebut_Exit);
			JestDebut_ExitSequenceCreated = true;
		} 
		//If the sequence is finished
		else if (layer_sequence_is_finished(JestDebut_ExitSequence))
		{
			layer_sequence_destroy(JestDebut_ExitSequence);

			with (obj_Player)
			{
				hascontrol = true;
			}
			
			global.JestDebut_Cutscene_Seen = true;
			
			SetRoomAudio_Music_Default(music_ShrinePeacefulTheme);
			
			PlayerFullHeal();
			
			SetSpawnpoint(obj_Player.x, obj_Player.y);
			
			SaveGame();
			
			instance_destroy();	
		}
		
		break;//end Jest exit
	
}//end Jest Cutscene Stage
