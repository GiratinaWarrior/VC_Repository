/// @description

var _font = ft_Jest;
var _pos = TEXTBOX_POS.TOP;

//Jest Aftermath Cutscene Stage machine
switch (JestAftermathCutscene_State)
{
	
	//Jest Talk Self Stage
	case JESTAFTERMATHCUTSCENE.JEST_TALK_SELF:
		
		#region Jest Talk Self
		
		//	SetRoomAudio_Music_Default(blanksound);
		
			var _text = 
			[
				"...",
				"Jest what is going on at our house..?"
			];
		
			if !(JestAftermathCutscene_JestTalkSelf_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				JestAftermathCutscene_JestTalkSelf_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_TURN_ROSE;
					Jest_NoctisCty.image_xscale = -1;
				}
				TimeSourceCreateAndStart(50, _func);
			}
		
		#endregion
		
		break;//end Jest Talk Self Stage
	
	//Jest Turn Rose Stage
	case JESTAFTERMATHCUTSCENE.JEST_TURN_ROSE:
		
		#region Jest Turn Rose
			
			var _func = function()
			{
				if !(JestAftermathCutscene_JestTurnRose_SequenceCreated)
				{
					JestAftermathCutscene_JestTurnRose_Sequence = layer_sequence_create(layer, Jest_NoctisCty.x, Jest_NoctisCty.y - sprite_yoffset - 30, seq_ExclamationMark);
					JestAftermathCutscene_JestTurnRose_SequenceCreated = true;
				}
			
			}
			
			TimeSourceCreateAndStart(20, _func);
			
			if (JestAftermathCutscene_JestTurnRose_SequenceCreated)
			{
				if (layer_sequence_is_finished(JestAftermathCutscene_JestTurnRose_Sequence))
				{
					JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_TALK_FIRST;
				}
			}
			
		
		#endregion
		
		break;//end Jest Turn Rose Stage

	//Jest Talk First Stage
	case JESTAFTERMATHCUTSCENE.JEST_TALK_FIRST:
			
		#region Jest Talk First
		
		//	SetRoomAudio_Music_Default(music_TitleTheme_Peaceful);
		
			var _text = 
			[	
				"Huhuhello Rosey-darling, fancy seeing you here!",
				"I would say that you being huhuhere means that everything is alright, but that thing I saw flying away from our house says otherwise...",
				"Rosey-darling. I'm prepared, so tell me", 
				"What happened? and why is Mother not with you?",
			];
		
			if !(JestAftermathCutscene_JestTalkFirst_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				audio_play_sound(sound_JestHuhuhu, 300, false);
				JestAftermathCutscene_JestTalkFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_LISTEN;
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
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_UNDERSTAND_SITUATION;
			}
		
		#endregion	
			
		break;//end Jest Surprised Stage
		
	//Jest Understand Situation Stage
	case JESTAFTERMATHCUTSCENE.JEST_UNDERSTAND_SITUATION:
		
		#region Jest Understand Situation
			
	//		SetRoomAudio_Music_Default(blanksound);
			
			var _text = 
			[	
				"I see...",
				"Say, Rosey-darling",
				"Do you think that if we both attacked this Voizatia man, we could win?",
				"...",
				"I guess not huh",
				"Then we truly have no choice but to go along with his stage play",
				"Don't worry Rosey-darling, you're the protagonist of this play, and the heroic protagonist always defeats the villain in the end",
				"Now as for how this play will play out"
			];
		
			if !(JestAftermathCutscene_JestUnderstandSituation_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				JestAftermathCutscene_JestUnderstandSituation_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				
				var _func = function()
				{
					Jest_NoctisCty.image_xscale = 1;	
					var _anotherfunc = function()
					{
						JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_EXPLAIN_FOREST;
					}
					TimeSourceCreateAndStart(50, _anotherfunc);
				}
				
				TimeSourceCreateAndStart(50, _func);
				
			}
			
		#endregion
		
		break;//end Jest Understand Situation Stage
		
	//Jest Explain Forest Stage
	case JESTAFTERMATHCUTSCENE.JEST_EXPLAIN_FOREST:
	
		#region Jest Explain Forest
			
			var _text = 
			[
				"Through this tunnel is the way to the Somnium Forest.",
				"I saw something fly in that direction from our house, prolly one of our 'villains' comrades if I were to guess...",
				"Mother never let us go there since that place is huhuhaunted",
				"And if mother says its haunted, its haunted. She only ever scared us with slightly exaggerated truths"
			];
			
			if !(JestAftermathCutscene_JestExplainForest_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				JestAftermathCutscene_JestExplainForest_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					Jest_NoctisCty.image_xscale = -1;	
					var _anotherfunc = function()
					{
						JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.JEST_GOOD_LUCK;
					}
					TimeSourceCreateAndStart(120, _anotherfunc);
				}
				
				TimeSourceCreateAndStart(120, _func);
			}
		
		#endregion
			
		break;//end Jest Explain Forest Stage
		
	//Jest Good Luck Stage
	case JESTAFTERMATHCUTSCENE.JEST_GOOD_LUCK:
		
		#region Jest Good Luck
			
		//	SetRoomAudio_Music_Default(music_JestEncounterTheme);
			
			var _text = 
			[
				"I would love to have myself an amazing adventure with you",
				"BUUUUUUT, these Noxians need someone to keep their spirits and sanity up, and who else but huhuhilarious me?",
				"Besides, it was the last order that Lavender gave me, so I'm entitled to follow it through.",
				"Rosey-darling...",
				"Mother taught us that the world is harsh and cruel, and it does not show mercy to its inhabitants, ",
				"But no matter what, you're stronger than anything this world can throw at you",
				"Ghosts, sea monsters, endless winters, unforgiving heat, and even the darkness of Nox itself",
				"Rosey-darling, overcome it all, and become the Star of Nox",
				"I know you can do it, so get going, the play does not wait for its actors does it?"
			];
			
			if !(JestAftermathCutscene_JestGoodLuck_TalkStarted)
			{
				CutsceneText(_text, "Jest", _pos, _font);
				audio_play_sound(sound_JestHuhuhu, 300, false);
				JestAftermathCutscene_JestGoodLuck_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				JestAftermathCutscene_State = JESTAFTERMATHCUTSCENE.CUTSCENE_END;
			}
			
		#endregion
		
		break;//end Jest Good Luck Stage
	
	//Cutscene End Stage
	case JESTAFTERMATHCUTSCENE.CUTSCENE_END:
	
		#region Cutscene End
		
			obj_Player.hascontrol = true;
			
			global.JestTalkedTo_PrologueChapterAftermath = true;
			
			SetRoomAudio_Music_Default(music_NoctisCityTheme);
			
			SetSpawnpoint(1776, 1728);
			
			SaveGame();
			
			instance_destroy();
		
		#endregion
	
		break;//end Cutscene End Stage
	
}//end Stage machine






