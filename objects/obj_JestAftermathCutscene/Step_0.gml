/// @description

var _font = ft_Jest;
var _pos = TEXTBOX_POS.TOP;

//Jest Aftermath Cutscene Stage machine
switch (JestAftermathCutscene_State)
{
	
	//Jest Talk Self Stage
	case JESTAFTERMATHCUTSCENE.JEST_TALK_SELF:
		
		#region Jest Talk Self
		
			with (obj_Camera)
			{
				follow = noone;
				xTo = (obj_Player.x + Jest_NoctisCty.x)/2;
				yTo = obj_Player.y;
			}
			
			SetRoomAudio_Music_Default(blanksound);
		
			var _text = 
			[
				"...",
				"Hope Rose and Lavender are doing alright..."
			];
			
			var _voice = 
			[
				blanksound,
				sound_Jest_Serious_Shabarura
			]
		
			if !(JestAftermathCutscene_JestTalkSelf_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestTalkSelf_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_TURN_ROSE;
					Jest_NoctisCty.image_xscale = -1;
					time_source_destroy(JestAftermathCutscene_TimeSource);
					JestAftermathCutscene_TimeSource = noone;
				}
				if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _func);
			}
			else
			{
				//SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
		
		#endregion
		
		break;//end Jest Talk Self Stage
	
	//Jest Turn Rose Stage
	case JESTAFTERMATHCUTSCENE.JEST_TURN_ROSE:
		
		#region Jest Turn Rose
			
			if !(JestAftermathCutscene_JestTurnRose_SequenceCreated)
			{
				JestAftermathCutscene_JestTurnRose_Sequence = layer_sequence_create(layer, Jest_NoctisCty.x, Jest_NoctisCty.y - sprite_yoffset - 30, seq_ExclamationMark);
				JestAftermathCutscene_JestTurnRose_SequenceCreated = true;
			}
			
			else if (layer_sequence_is_finished(JestAftermathCutscene_JestTurnRose_Sequence))
			{
				var _func = function()
				{
					JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_TALK_FIRST;
					time_source_destroy(JestAftermathCutscene_TimeSource);
					JestAftermathCutscene_TimeSource = noone;
				}
				if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _func);
				
			}
		
		#endregion
		
		break;//end Jest Turn Rose Stage

	//Jest Talk First Stage
	case JESTAFTERMATHCUTSCENE.JEST_TALK_FIRST:
			
		#region Jest Talk First
		
			var _text = 
			[	
				"Huhuhello Rosey-darling, fancy seeing you here!",
				"I'd love to say that you being here means that everything is A-OK...",
				"But you look the opposite.",
				"...",
				"Rosey-darling. I'm prepared, so tell me.", 
				"What happened? Why is Mother not with you?",
			];
			
			var _voice = 
			[
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Dark_Vishkana,
				blanksound,
				sound_Jest_Dark_Harakivabaja,
				sound_Jest_Dark_Rilakanazhi
			]
		
			if !(JestAftermathCutscene_JestTalkFirst_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestTalkFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_LISTEN;
			}
			else
			{
				with (obj_Text)
				{
					
					if (TextBox_Page >= 3)
					{
						Jest_NoctisCty.sprite_index = spr_Jest_Idle_Sad;
					}
					
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
			
		#endregion
			
		break;//end Jest Talk First Stage
		
	//Jest Surprised Stage
	case JESTAFTERMATHCUTSCENE.JEST_LISTEN:
		
		#region Jest Surprised
		
			if !(JestAftermathCutscene_JestListen_SequenceCreated)
			{
				JestAftermathCutscene_JestListen_Sequence = layer_sequence_create(layer, Jest_NoctisCty.x, Jest_NoctisCty.y - sprite_yoffset - 30, seq_DotDotDot_To_Exclamation);
				JestAftermathCutscene_JestListen_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(JestAftermathCutscene_JestListen_Sequence))
			{
				layer_sequence_destroy(JestAftermathCutscene_JestListen_Sequence);	
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_DEPRESSED;
			}
		
		#endregion	
			
		break;//end Jest Surprised Stage
		
	//Jest Depressed Stage
	case JESTAFTERMATHCUTSCENE.JEST_DEPRESSED:
		
		#region Jest Depressed
			
			SetRoomAudio_Music_Default(music_LavenderDeathTheme);
			
			var _text = 
			[	
				"No...",
				"(Lavender...)",
				"...",
				"Mother's really gone...?",
				"...",
				"Rosey...darling...",
				"Do you really have no choice but to be a puppet?",
				"...",
				"No huh...",
				"..."
			]
			
			var _voice = 
			[
				sound_Jest_Serious_Shabarura,
				blanksound,
				blanksound,
				sound_Jest_Dark_Rilakanazhi,
				blanksound,
				sound_Jest_Serious_Varazhanovezhibidi,
				sound_Jest_Serious_Harakenizuburana,
				blanksound,
				sound_Jest_Dark_Vishkana,
				blanksound
			]
		
			if !(JestAftermathCutscene_JestUnderstandSituation_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestUnderstandSituation_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _jestUS = function()
				{
					time_source_destroy(JestAftermathCutscene_TimeSource);
					JestAftermathCutscene_TimeSource = noone;
					
					var _jestUS2 = function()
					{
						Jest_NoctisCty.sprite_index = spr_Jest_Idle;
						JestAftermathCutscene_JestUnderstandSituation_TalkStarted = false;
						JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_BACK_UP;
						time_source_destroy(JestAftermathCutscene_TimeSource);
						JestAftermathCutscene_TimeSource = noone;
					}
					
					if (JestAftermathCutscene_TimeSource == noone)JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _jestUS2);
					
				}
				if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _jestUS);
			}
			else
			{
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
			
		#endregion
		
		break;//end Jest Depressed Stage
	
	//Jest Back Up Stage
	case JESTAFTERMATHCUTSCENE.JEST_BACK_UP:
		
		#region Jest Back Up 
		
			var _text = 
			[	
				"WAIT!",
				"I'M THE JESTER! I SHOULD BE PLAYING WITH PUPPETS!",
				"Rosey-darling Rosey-darling. I just got a great idea!",
				"You should become MY puppet!",
				"Follow my script! Not that mans!",
				"Yes..that's it!",
				"...",
				"...(yeah)...",
				"...",
				"*ahem*",
				"Now then Rosey-darling!",
				"According to my script, your first destination..."
			]
			
			var _voice = 
			[
				sound_Jest_Laugh_Hah,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Dark_Vishkana,
				blanksound,
				blanksound,
				blanksound,
				blanksound,
				sound_Jest_Dark_Rilakanazhi,
				sound_Jest_Serious_Varazhanovezhibidi,
			]
		
			if !(JestAftermathCutscene_JestUnderstandSituation_TalkStarted)
			{
				Jest_NoctisCty.sprite_index = spr_Jest_Idle;
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestUnderstandSituation_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _jestUS = function()
				{
					Jest_NoctisCty.image_xscale = 1;	
					time_source_destroy(JestAftermathCutscene_TimeSource);
					JestAftermathCutscene_TimeSource = noone;
					
					var _jestUS2 = function()
					{
						//JestAftermathCutscene_JestUnderstandSituation_TalkStarted = false;
						JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_EXPLAIN_FOREST;
						time_source_destroy(JestAftermathCutscene_TimeSource);
						JestAftermathCutscene_TimeSource = noone;
					}
					
					if (JestAftermathCutscene_TimeSource == noone)JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _jestUS2);
					
				}
				if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(50, _jestUS);
			}
			else
			{
				
				with (obj_Text)
				{
					
					if (TextBox_Page >= 6 && TextBox_Page <= 9)
					{
						Jest_NoctisCty.sprite_index = spr_Jest_Idle_Sad;
					}
					else
					{
						Jest_NoctisCty.sprite_index = spr_Jest_Idle;
					}
					
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
			
		
		#endregion
		
		break;//end Jest Back Up Stage
	
	//Jest Explain Forest Stage
	case JESTAFTERMATHCUTSCENE.JEST_EXPLAIN_FOREST:
	
		#region Jest Explain Forest
			
			var _text = 
			[
				"Will be through this way, to the Somnium Forest.",
				"I saw something fly in that direction from our house, prolly one of that mans comrades if I were to guess...",
				"Mother never let us go there since that place is huhuhaunted",
				"And if mother said its haunted, its haunted. She only ever scared us with slightly exaggerated truths"
			];
			
			var _voice = 
			[
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Serious_Shabarura,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Talk_Volapachi_Halaka
			]
			
			if !(JestAftermathCutscene_JestExplainForest_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestExplainForest_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					Jest_NoctisCty.image_xscale = -1;	
					Jest_NoctisCty.sprite_index = spr_Jest_Idle_Sad;
					time_source_destroy(JestAftermathCutscene_TimeSource);
					JestAftermathCutscene_TimeSource = noone;
					var _anotherfunc = function()
					{
						JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_GOOD_LUCK;
						time_source_destroy(JestAftermathCutscene_TimeSource);
						JestAftermathCutscene_TimeSource = noone;
					}
					if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(120, _anotherfunc);
				}
				
				if (JestAftermathCutscene_TimeSource == noone) JestAftermathCutscene_TimeSource = TimeSourceCreateAndStart(120, _func);
			}
			else
			{
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
		
		#endregion
			
		break;//end Jest Explain Forest Stage
		
	//Jest Good Luck Stage
	case JESTAFTERMATHCUTSCENE.JEST_GOOD_LUCK:
		
		#region Jest Good Luck
			
			//SetRoomAudio_Music_Default(music_StoryCutsceneTheme);
			
			var _text = 
			[
				"I wish I was there to help you fight Voizatia.",
				"I also wish I could've spoken to Mother one last time.",
				"I also wish that you didn't have to do this alone, I would've wanted to travel with you.",
				"But these people need me.",
				"They need someone to protect them and keep their spirits up.",
				"And who else but huhuhilarious me to handle that!",
				"It was the last order that Mother gave me, so I'm entitled to follow through...",
				"That's why I have to stay happy and lively, it's what she would have wanted...",
				"So once you're done making clowns of the side acts, We'll fight Voizatia together!",
				"Rosey-darling...",
				"Mother taught us that the world is a harsh and cruel place, and refuses to show mercy to it's inhabitants.",
				"But Rosey-darling, I know that you're stronger than anything this world can throw at you.",
				"Whether it be ghosts, sea monsters, endless winters, relentless heat, or even the very darkness of Nox itself.",
				"I know that you can overcome it all. You can do it.",
				"You can become the Star of Nox.",
				"So get going already! It's time for the first act to start!"
			];
			
			var _voice = 
			[
				sound_Jest_Serious_Shabarura,
				sound_Jest_Serious_Harakenizuburana,
				sound_Jest_Serious_Varazhanovezhibidi,
				sound_Jest_Dark_Vishkana,
				sound_Jest_Dark_Rilakanazhi,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Dark_Harakivabaja,
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Dark_Vishkana, //Rosey-darling
				sound_Jest_Dark_Harakivabaja,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Dark_Rilakanazhi,
				sound_Jest_Talk_jaravajikaraZHAna
			];
			
			if !(JestAftermathCutscene_JestGoodLuck_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				obj_Text.TextBox_Voices = _voice;
				JestAftermathCutscene_JestGoodLuck_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.CUTSCENE_END;
			}
			else
			{
				with (obj_Text)
				{
					
					if (TextBox_Page >= 7)
					{
						Jest_NoctisCty.sprite_index = spr_Jest_Idle;
					}
					
					
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						Jest_NoctisCty.image_speed = 1;
					}
					else
					{
						Jest_NoctisCty.image_speed = 0;
					}
				}
			}
			
		#endregion
		
		break;//end Jest Good Luck Stage
	
	//Cutscene End Stage
	case JESTAFTERMATHCUTSCENE.CUTSCENE_END:
	
		#region Cutscene End
		
			obj_Player.hascontrol = true;
			
			obj_Camera.follow = noone;
			
			global.JestTalkedTo_PrologueChapterAftermath = true;
			
			Jest_NoctisCty.image_speed = 1;
			
			SetSpawnpoint(1776, 1728);
			
			SaveGame();
			
			instance_destroy();
		
		#endregion
	
		break;//end Cutscene End Stage
	
}//end Stage machine






