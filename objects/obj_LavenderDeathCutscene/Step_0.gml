/// @description

var p = TEXTBOX_POS.BOTTOM;
var f = ft_Lavender;
var n = "Lavender";

//The Lavender Death Sequence Events
switch(LavenderDeathCutscene_State)
{
	
	//Inactive Stage
	case LAVENDERDEATH_CUTSCENE.INACTIVE:
	
		#region Inactive
	
			sprite_index = spr_Lavender_Down;
			
		#endregion 
	
		break;//end Inactive Stage
	
	//Lavender Rise Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_RISE:
					
		#region Lavender Rise
				
			SetRoomAudio_Music_Default(music_LavenderDeathTheme);
				
			sprite_index = spr_Lavender_Rise;
			
			if (animation_end())
			{
				sprite_index = spr_Lavender_LastStand;
				LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_FIRST;
			}
			
		#endregion
					
		break;//end Lavender Rise Stage
		
	//Lavender Talk First Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_FIRST:
		
		#region Lavender Talk First
			
			
			var _text = 
			[
				"No...never...",
				"Voizatia...",
				"I won't...let you...",
				"Turn Rose...into...YOUR......puppet..."
			]
			
			if !(LavenderDeathCutscene_LavenderTalkFirst_TalkStarted)
			{
				CutsceneText(_text, n, p, f);
				obj_Text.TextBox_TextSkippable = false;
				obj_Text.TextBox_CharIncrease = 0.5;
				LavenderDeathCutscene_LavenderTalkFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.VOIZATIA_REACT;
			}
		
		#endregion
		
		break;//end Lavender Talk First Stage
		
	//Voizatia React Stage
	case LAVENDERDEATH_CUTSCENE.VOIZATIA_REACT:
		
		#region Voizatia React Stage
			
			var _text = 
			[
				"And what did you get up for?",
				"All you had to do was lie on the ground and you would both live.",
				"Or are you unsatisfied with what I have in store for your daughter?",
				"Not like YOU can do anything about it.",
			]
			
			if !(LavenderDeathCutscene_VoizatiaReact_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				LavenderDeathCutscene_VoizatiaReact_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_VOIZATIA;
			}
			
		#endregion
		
		break;//end Voizatia React Stage
		
	//Lavender Talk Voizatia Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_VOIZATIA:
		
		#region Lavender Talk Voizatia
			
			var _text = 
			[
				"I...can't...do...anything..?",
				"Let...me...tell...you...something...",
				"No...plot twist...",
				"Good...or...bad...",
				"Ever...fails...",
				"To catch you off guard!"
			]
				
			if !(LavenderDeathCutscene_LavenderTalkVoizatia_TalkStarted)
			{
				CutsceneText(_text, n, p, f);
				obj_Text.TextBox_TextSkippable = false;
				obj_Text.TextBox_CharIncrease = 0.5;
				LavenderDeathCutscene_LavenderTalkVoizatia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_FINAL_ATTACK;
			}
			else if (obj_Text.TextBox_Page >= array_length(_text) - 1)
			{
				obj_Text.TextBox_CharIncrease = 1;
			}
			
		#endregion
		
		break;//end Lavender Talk Voizatia Stage
		
	//Lavender Final Attack Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_FINAL_ATTACK:
			
		#region Lavender Final Attack
			
			if (LavenderDeathCutscene_LavenderFinalAttack_AttackSprite == noone)
			{
				LavenderDeathCutscene_LavenderFinalAttack_AttackSprite = layer_sprite_create("LavenderFinalAttack", obj_VoizatiaUndefeated.x, 352, spr_Lavender_FinalAttack);
				layer_sprite_yscale(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite, 0);
			}
			else
			{
		
				var _yscale = layer_sprite_get_yscale(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite);
				
				//Increase the yscale of the FINAL ATTACK
				layer_sprite_yscale(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite, layer_sprite_get_yscale(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite) 
				+ 0.2);
				
				//Check if the FINAL ATTACK is ready to end
				if (_yscale >= 30)
				{
					//Fade out the Final Attack
					layer_sprite_alpha(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite, layer_sprite_get_alpha(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite) - 0.1);
					
					if (layer_sprite_get_alpha(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite) <= -10)
					{
						
						layer_sprite_destroy(LavenderDeathCutscene_LavenderFinalAttack_AttackSprite);
							 
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_TURN_AROUND;
						
					}
					
				}

				//Check if the FINAL ATTACK is big enough to cover Voizatia
				else if (_yscale >= 9)
				{
					obj_VoizatiaUndefeated.image_alpha = 0;
				}
				
				if ( _yscale >= 2 && _yscale <= 3)
				{
					audio_play_sound(sound_LavenderFinalAttack, 100, false, 0.7);
				}
				
				
				
			}

		#endregion
		
		break;//end Lavender Final Attack Stage
		
	//Lavender Turn Around Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_TURN_AROUND:
		
		#region Lavender Turn Around
		
			if !(LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequenceCreated)
			{
				LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequence = layer_sequence_create(layer, x, y - 80, seq_ExclamationMark);
				LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequenceCreated = true;
			}
			else if (layer_sequence_is_finished(LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequence))
			{
				image_xscale = -1;
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_APPROACH_ROSE;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(80, _func);
				}
				layer_sequence_destroy(LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequence);
			}		
			
		#endregion
		
		break;//end Lavender Turn Around Stage
	
	//Lavender Approach Rose Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_APPROACH_ROSE:
		
		#region Lavender Approach Rose
		
			//show_debug_message("Lavender X: {0}", x);
		
			var _targetX = obj_PlayerDefeated.x + 50;
		
			x = max(_targetX, x - 1);
			
			if (x == _targetX)
			{
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					sprite_index = spr_Lavender_LastStand;
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_SECOND;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(60, _func);
				}
			}
		
			else
			{
				sprite_index = spr_Lavender_WalkFinal;
				image_xscale = -1;
				image_speed = 1;
			}
			
		
		#endregion
			
		break;//end Lavender Approach Rose
	
	//Lavender Talk Second Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_TALK_SECOND:
		
		#region Lavender Talk Second Stage
			
			var _text = 
			[
				"Rose...darling...I",
				"I...",
				"..."
			]
			
			if !(LavenderDeathCutscene_LavenderTalkSecond_TalkStarted)
			{
				//sprite_index = spr_Lavender_Cry;
				CutsceneText(_text, n, p, f);
				obj_Text.TextBox_TextSkippable = false;
				obj_Text.TextBox_CharIncrease = 0.5;
				LavenderDeathCutscene_LavenderTalkSecond_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_DESPAIR;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(50, _func);
				}
			}
			
		#endregion
		
		break;//end Lavender Talk Second Stage
	
	//Lavender Despair Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_DESPAIR:
		
		#region Lavender Despair
		
			if (LavenderDeathCutscene_TimeSource == noone)
			{
				sprite_index = spr_Lavender_Cry;
				var _func = function()
				{
					LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_DESPAIR_TALK;
					time_source_destroy(LavenderDeathCutscene_TimeSource);
					LavenderDeathCutscene_TimeSource = noone;
				}
				LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(60, _func);
			}
		
		#endregion
		
		break;//end Lavender Despair Stage
		
	//Lavender Despair Talk Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_DESPAIR_TALK:
		
		#region Lavender Despair Talk
		
			var _text = 
			[
				"I'm sorry! I'm sorry! I'm sorry! I'm sorry! I'm sorry!",
				"I'm so sorry!",
				"I'm sorry I'm so weak!",
				"I'm sorry I couldn't make you strong!",
				"I'm sorry I made you go through all this pain!",
				"But Rose-darling...",
				"No matter what happens...",
				"Don't ever forget..."
			]
			
			if !(LavenderDeathCutscene_LavenderDespairTalk_TalkStarted)
			{
				CutsceneText(_text, n, p, f);
				obj_Text.TextBox_TextSkippable = false;
				LavenderDeathCutscene_LavenderDespairTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				obj_Camera.sprite_index = spr_BlackScreen;
				//obj_VoizatiaUndefeated.sprite_index = spr_Voizatia_Stand_Attack;
				
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_FINAL_TALK;//LAVENDERDEATH_CUTSCENE.VOIZATIA_APPEAR;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(30, _func);
				}
				
			}
			else if (obj_Text.TextBox_Page >= array_length(_text) - 3)
			{
				obj_Text.TextBox_CharIncrease = 0.3;
			}
		
		#endregion
		
		break;//end Lavender Despair Talk Stage
	
	//Voizatia Appear Stage
	case LAVENDERDEATH_CUTSCENE.VOIZATIA_APPEAR:
	
		#region Voizatia Appear
			
			with (obj_VoizatiaUndefeated)
			{
				image_alpha = 1;
				x = other.x + 40;
				y = other.y - 25; //332;
				
				if (sprite_index == spr_Voizatia_Stand_Attack_Charge) && (image_index >= image_number - 1)
				{
					sprite_index = spr_Voizatia_Stand_Attack;
				}
				
			}
			
			if (LavenderDeathCutscene_TimeSource == noone)
			{
				obj_Camera.sprite_index = noone;
				var _func = function()
				{
					LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_FINAL_TALK;
					time_source_destroy(LavenderDeathCutscene_TimeSource);
					LavenderDeathCutscene_TimeSource = noone;
				}
				LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(60, _func);
			}
		
		#endregion
	
		break;//end Voizatia Appear
		
	//Lavender Final Attack Stage
	case LAVENDERDEATH_CUTSCENE.LAVENDER_FINAL_TALK:
		
		#region Lavender Final Talk
			
			var _text = 
			[
				"I...love...you..."
			]
			
			if !(LavenderDeathCutscene_LavenderFinalTalk_TalkStarted)
			{
				CutsceneText(_text, n, p, f, c_red);
				obj_Text.TextBox_TextSkippable = false;
				obj_Text.TextBox_CharIncrease = 0.4;
				LavenderDeathCutscene_LavenderFinalTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					audio_play_sound(sound_SwordStrike, 1000, false, 3);
					SetRoomAudio_Music_Default();
								
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.VOIZATIA_STRIKE_LAVENDER;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(120, _func);
				}
			}
			
		
			
		#endregion
		
		break;//end Lavender Final Talk Stage
		
	//Voizatia Strike Lavender Stage
	case LAVENDERDEATH_CUTSCENE.VOIZATIA_STRIKE_LAVENDER:
			
		#region Voizatia Strike Lavender
	
			if !(LavenderDeathCutscene_VoizatiaStrikeLavender_SequenceCreated)
			{
				LavenderDeathCutscene_VoizatiaStrikeLavender_Sequence = layer_sequence_create("VoizatiaBossIntroCutscene_Voizatia", x, y, seq_VoizatiaBossIntro_LavenderDeath_VoizatiaStrike);
				sprite_index = noone;
				obj_Camera.sprite_index = noone;
				LavenderDeathCutscene_VoizatiaStrikeLavender_SequenceCreated = true;
			}
			else
			{
				if (LavenderDeathCutscene_TimeSource == noone)
				{
					var _func = function()
					{
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.VOIZATIA_MOCK_LAVENDER;
						time_source_destroy(LavenderDeathCutscene_TimeSource);
						LavenderDeathCutscene_TimeSource = noone;
					}
					LavenderDeathCutscene_TimeSource = TimeSourceCreateAndStart(60, _func);
				}
			}
			
		#endregion
			
		break;//end Voizatia Strike Lavender Stage
	
	//Voizatia Mock Lavender Stage
	case LAVENDERDEATH_CUTSCENE.VOIZATIA_MOCK_LAVENDER:
		
		#region Voizatia Mock Lavender
			
			SetRoomAudio_Music_Default(music_VoizatiaEncounterThemeV2);
			
			var _text = 
			[
				"You really used your strongest attack to buy time in order to say your goodbyes",
				"What a worthless effort.",
				"Were you that scared of seeing the rest of your daughters life?",
				"That you'd rather die than be a witness?",
				"Very well. I'll grant your wish."
			];
			
			if !(LavenderDeathCutscene_VoizatiaMockLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				LavenderDeathCutscene_VoizatiaMockLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.VOIZATIA_ANNIHILATE_LAVENDER;
			}
		
		#endregion
		
		break;//end Voizatia Mock Lavender
		
	//Voizatia Annihilate Lavender Stage
	case LAVENDERDEATH_CUTSCENE.VOIZATIA_ANNIHILATE_LAVENDER:
		
		#region Voizatia Annihilate Lavender
			
			if (LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption == noone)
			{
				audio_play_sound(sound_SinEruption, 100, false);
				LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption = layer_sprite_create("LavenderFinalAttack", x + 12, y, spr_SinEruption);
				layer_sprite_yscale(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption, 0);
			}
			else
			{
				
				var _yscale = layer_sprite_get_yscale(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption)
				
				var _alpha = layer_sprite_get_alpha(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption);
				
				layer_sprite_yscale(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption, _yscale + 1);
				
				if (_yscale >= 120)
				{
					
					layer_sprite_alpha(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption, _alpha - 0.05);
					
					if (_alpha < -3)
					{
						layer_sprite_destroy(LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption);
						LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.CUTSCENE_END;
					}
					
					//LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.CUTSCENE_END;
				}
				else if (_yscale >= 30)
				{
					layer_sequence_destroy(LavenderDeathCutscene_VoizatiaStrikeLavender_Sequence);
					obj_VoizatiaUndefeated.image_alpha = 1;
					obj_VoizatiaUndefeated.x = x + 12;
					//obj_VoizatiaUndefeated.y = y - 16;
				}
				
			}
		
		#endregion
		
		break;//end Voizatia Annihilate Lavender Stage
		
	//Cutscene End Stage
	case LAVENDERDEATH_CUTSCENE.CUTSCENE_END:
		
		#region Cutscene End
		
			instance_destroy();
		
		#endregion
		
		break;//end Cutscene End Stage
		
}//end switch case










