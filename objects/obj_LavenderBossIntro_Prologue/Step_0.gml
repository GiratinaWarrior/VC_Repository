
var n = "Lavender",
var p = TEXTBOX_POS.BOTTOM;
var f = ft_Lavender;

//Stage machine for this cutscene
switch(LavenderBossIntroPrologue_State)
{
	//Off Stage: where the cutscene hasn't started and Lavender is waiting, watching
	case LAVENDERBOSSINTROPROLOGUE_STATE.OFF:
	
		if (LavenderBossIntroPrologue_LavenderIdle == noone)
		{
			LavenderBossIntroPrologue_LavenderIdle = layer_sequence_create(layer, 0, 0, seq_LavenderBossIntro_LavenderSilhouette);
		}
		
		break;//end Off Stage
	
	//Camera Pan Stage: The camera moves to where Lavender and Rose are
	case LAVENDERBOSSINTROPROLOGUE_STATE.CAMERA_PAN:
		
		#region Camera Pan
		
			SetRoomAudio_Music_Default(blanksound);
		
			var _cameraTargetX = 960;
			
			with (obj_Camera)
			{
				follow = noone;
				xTo = _cameraTargetX;
				yTo = 270;
			}
			
			var _func = function()
			{
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_TALK_FIRST;
				time_source_destroy(LavenderBossIntroPrologue_TimeSource);
				LavenderBossIntroPrologue_TimeSource = noone;
			}
			
			with (obj_Player)
			{
				hascontrol = false;
			}
			
			if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource =  TimeSourceCreateAndStart(110, _func);
			
		#endregion
		
		break;//end Camera Pan Stage
		
	//Lavender Talk First Stage: Lavender admires the flowers and the moon
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_TALK_FIRST:
		
		#region Lavender Talk First
		
			var _text = 
			[
				"The sky sure is beautiful tonight, is it not?",
				"Not a single cloud obscuring the stars nor blotting out the moon",
				"But clouds are necessary for the moon to be so beautiful, eitherwise such a beautiful sight would become stale.",
				"Same with these flowers.",
				"If flowers did not wither away, we could never appreciate their beauty.",
				"Life is only beautiful because death exists."
			];
			
			if !(LavenderBossIntroPrologue_LavenderTalkFirst_TalkStarted)
			{
				LavenderBossIntroPrologue_LavenderTalkFirst_Talk = CutsceneText(_text, n, p, f, c_red);				
				LavenderBossIntroPrologue_LavenderTalkFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_TURN;
					time_source_destroy(LavenderBossIntroPrologue_TimeSource);
					LavenderBossIntroPrologue_TimeSource = noone;
				}
				
				if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(60, _func);
				
			}
		
		#endregion
		
		break;//end Lavender Talk First Stage
	
	//Lavender Turn Stage: Lavender turns around to face Rose
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_TURN:
		
		#region Lavender Turn
		
			if !(LavenderBossIntroPrologue_LavenderTurn_SequenceCreated)
			{
				layer_sequence_destroy(LavenderBossIntroPrologue_LavenderIdle);
				LavenderBossIntroPrologue_LavenderIdle = layer_sequence_create(layer, 0, 0, seq_LavenderBossIntro_LavenderAppear);
				LavenderBossIntroPrologue_LavenderTurn_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(LavenderBossIntroPrologue_LavenderIdle))
			{
				layer_sequence_destroy(LavenderBossIntroPrologue_LavenderIdle);
				LavenderBossIntroPrologue_LavenderIdle = layer_sequence_create(layer, 0, 0, seq_LavenderBossIntro_LavenderIdle);
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXPLAIN;
			}
		
		#endregion
		
		break;//end Lavender Turn Stage
		
	//Lavender Explain Stage: Lavender
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXPLAIN:
		
		#region Lavender Explain 
		
			var _text = 
			[
				"Hahaha, did you like my little poem, Rose-darling?",
				"I think it is quite beautiful, if I do say so myself.",
				"I am not the greatest at getting to the point, so I will be doing so 'show do not tell'"
			];
			
			if !(LavenderBossIntroPrologue_LavenderExplain_TalkStarted)
			{
				LavenderBossIntroPrologue_LavenderExplain_Talk = CutsceneText(_text, n, p, f);
				LavenderBossIntroPrologue_LavenderExplain_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_CHARGE;
			}
		
		#endregion
		
		break;//end Lavender Explain Stage
		
	//Lavender Charge Stage
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_CHARGE:
	
		#region Lavender Charge
			
			//Set the music
//			SetRoomAudio_Music_Default(music_LavenderBattleTheme);
			
			if (!LavenderBossIntroPrologue_LavenderCharge_SequenceCreated)
			{
				
				//Create the new charge movement
				layer_sequence_destroy(LavenderBossIntroPrologue_LavenderIdle);
				LavenderBossIntroPrologue_LavenderCharge_Sequence = layer_sequence_create(layer, 0, 0, seq_LavenderBossIntro_LavenderCharge);
			
				//end this section of code
				LavenderBossIntroPrologue_LavenderCharge_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(LavenderBossIntroPrologue_LavenderCharge_Sequence))
			{
				
				layer_sequence_destroy(LavenderBossIntroPrologue_LavenderCharge_Sequence);
				LavenderBossIntroPrologue_LavenderIdle = layer_sequence_create(layer, 0, 0, seq_LavenderBossIntro_LavenderFly);
					
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_CHALLENGE;
				
			}
			
			
		#endregion
	
		break;//end Lavender Charge State
		
	//Lavender Challenge Stage: Lavender explains that she will fight Rose
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_CHALLENGE:
		
		#region Lavender Challenge
		
			//Set the music
			SetRoomAudio_Music_Default(music_LavenderBattleTheme);	
		
			var _text = 
			[
				"Rose!",
				"The final test to become Cardinal is to surpass the previous Cardinal to justify your title",
				"If you can defeat me in battle, you will be ready for anything the world throws at you",
				"Do not hold back. Go all out. Show me all of your strength, as I will show you the power of the Former Cardinal.",
				"Come forth! Show me how my little flower has bloomed!",
			];
			
			if !(LavenderBossIntroPrologue_LavenderChallenge_TalkStarted)
			{
				LavenderBossIntroPrologue_LavenderChallenge_Talk = CutsceneText(_text, n, p, f);
				LavenderBossIntroPrologue_LavenderChallenge_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				layer_sequence_destroy(LavenderBossIntroPrologue_LavenderIdle);
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_START;
			}
			
		#endregion
		
		break;//end Lavender Challenge Stage
	
	//Battle Start Stage: The set up for the battle
	case LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_START:
		
		#region Battle Start
			
			if (LavenderBossIntroPrologue_LavenderBoss == noone)
			{	
				LavenderBossIntroPrologue_LavenderBoss 
				= instance_create_layer(756, 204, layer, obj_LavenderBossBattle_Prologue);
			}
			
			obj_Player.hascontrol = true;
			
			LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.IN_BATTLE;
			
			
		
		#endregion
		
		break;//end Battle Start Stage
		
	//In Battle Stage: The battle is currently ongoing
	case LAVENDERBOSSINTROPROLOGUE_STATE.IN_BATTLE:
		
		#region In Battle
		
			with (obj_Player) 
			{
				LockEntityInSight(id, 32, 32, 16, 16);
			}
		
			obj_Camera.x = 960;
			obj_Camera.y = 270;
		
			if !(instance_exists(obj_LavenderBossBattle_Prologue))
			{
				LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_END;
			}
			
		#endregion
		
		break;//end In Battle Stage
	
	//Battle End Stage: The fight is over, and lavender descends
	case LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_END:
		
		#region Battle End
		
			SetRoomAudio_Music_Default(blanksound);
		
			with (obj_Player)
			{
				hascontrol = false;
				
				image_xscale = -sign(x - other.LavenderBossIntroPrologue_BattleEnd_Lavender.x);
					
			}
			
			with(LavenderBossIntroPrologue_BattleEnd_Lavender)
			{
								
				y = min(204, y + 2);
				
				image_xscale = -sign(x - obj_Player.x);
				
			//	show_debug_message("X: {0}", x);
			//	show_debug_message("Y: {0}", y);
				
				var _xSpe = 2;
				
				if (x < 960)
				{
					x = min(960, x + _xSpe);
				}
				else if (x > 960)
				{
					x = max(960, x - _xSpe);
				}
				else if (x == 960 && y == 204)
				{
					var _func = function()
					{
						with(obj_LavenderBossIntro_Prologue)
						{
							LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DEFEATED_TALK;
						}
					}
					
					if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(100, _func);
					//other.LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DEFEATED_TALK;
				}
				
			}
			
		
		#endregion
		
		break;//end Battle End Stage
		
	//Lavender Defeated Talk Stage: Lavender congratulates Rose for her victory
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DEFEATED_TALK:
	
		#region Lavender Defeated Talk 
		
			var _text = 
			[
				"Rose...",
				"Rose-darling, you really have become strong, stronger than I ever could have predicted",
				"I am truly proud to be able to call you my own daughter.",
				"You are undoubtedly worthy of the title 'Cardinal of Nox'."
			];
			
			if !(LavenderBossIntroPrologue_LavenderDefeated_TalkStarted)
			{
				LavenderBossIntroPrologue_LavenderDefeated_Talk = CutsceneText(_text, n, p, f);
				LavenderBossIntroPrologue_LavenderDefeated_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DESCEND;
					time_source_destroy(LavenderBossIntroPrologue_TimeSource);
					LavenderBossIntroPrologue_TimeSource = noone;
				}
				
				if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(50, _func);
			}
			
		#endregion
	
		break;//end Lavender Defeated Talk Stage
	
	//Lavender Descend Stage: Lavender descends to the ground
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DESCEND:
	
		#region Lavender Descend Stage
			
			//show_debug_message("DESCEND");	
			
			with (LavenderBossIntroPrologue_BattleEnd_Lavender)
			{
				y = min(320, y + 2);
				
				if (y == 320) && (sprite_index != spr_Lavender_Idle)
				{
					sprite_index = spr_Lavender_Charge;
				}
				
				if (sprite_index == spr_Lavender_Charge)
				{
					var _func = function()
					{
						sprite_index = spr_Lavender_Idle;
						time_source_destroy(LavenderBossIntroPrologue_TimeSource);
						LavenderBossIntroPrologue_TimeSource = noone;
					}
					if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(30, _func);
				}
				
				else if (sprite_index == spr_Lavender_Idle)
				{
					var _func = function()
					{
						with (obj_LavenderBossIntro_Prologue)
						{
							LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXIT_TALK;	
						}
						time_source_destroy(LavenderBossIntroPrologue_TimeSource);
						LavenderBossIntroPrologue_TimeSource = noone;
					}
					if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(60, _func);
				}
				
			}
			
		#endregion
		
		break;//end Lavender Descend Stage
		
	//Lavender Exit Talk Stage: Lavender tells her that its now time to go for the festival
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXIT_TALK:
	
		#region Lavender Exit Talk
		
			var _text = 
			[
				"Now that you gone up and taken my precious title, I believe it is about time everyone hears about this.",
				"I have invited everyone in Noctis City to have ourselves a little ceremony for you.",
				"Do not dawdle, Rose-darling, you can not be late to your own ceremony can you?",
				"We are going to have one heaven of a time!"
			];
			
			if !(LavenderBossIntroPrologue_LavenderExitTalk_TalkStarted)
			{
				LavenderBossIntroPrologue_LavenderExitTalk_Talk = CutsceneText(_text, n, p, f);
				LavenderBossIntroPrologue_LavenderExitTalk_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXIT;
					time_source_destroy(LavenderBossIntroPrologue_TimeSource);
					LavenderBossIntroPrologue_TimeSource = noone;
				}
				if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(20, _func);
			}
		
		#endregion
	
		break;//end Lavender Exit Talk Stage
	
	//Lavender Exit Stage: Lavender leaves for Noctis City
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_EXIT:
	
		#region Lavender Exit
		
			with (LavenderBossIntroPrologue_BattleEnd_Lavender)
			{
				if (image_xscale == 1)
				{
					var _func = function()
					{
						image_xscale = -1;	
					}
					TimeSourceCreateAndStart(25, _func);
				}
				
				else
				{
					
					var _func = function()
					{
						sprite_index = spr_Lavender_Walk;
						time_source_destroy(LavenderBossIntroPrologue_TimeSource);
						LavenderBossIntroPrologue_TimeSource = noone;
					}
					if (LavenderBossIntroPrologue_TimeSource == noone) LavenderBossIntroPrologue_TimeSource = TimeSourceCreateAndStart(30, _func);
					
					if (sprite_index == spr_Lavender_Walk)
					{
						x -= 3;
					}
					
					if (x <= 400)
					{
						other.LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.CUTSCENE_END;
					}
					
				}
			}
		
		#endregion
		
		break;//end Lavender Exit Stage
		
	//Cutscene End Stage: the cutscene is over and Rose regains control
	case LAVENDERBOSSINTROPROLOGUE_STATE.CUTSCENE_END:
	
		#region Cutscene End Stage
		
			SetRoomAudio_Music_Default(music_ShrineMemoryTheme);
		
			instance_destroy(LavenderBossIntroPrologue_BattleEnd_Lavender);
			
			obj_Player.hascontrol = true;
			
			obj_Camera.follow = obj_Player;
			
			global.Lavender_Defeated_Prologue = true;
			
			SetSpawnpoint(obj_Player.x, obj_Player.y);
			
			PlayerFullHeal();
			
			SaveGame();
			
			instance_destroy();
		
		#endregion
	
		break;//end Cutscene End Stage
		
}//end Stage machine





