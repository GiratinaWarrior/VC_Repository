
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
			}
			
			with (obj_Player)
			{
				hascontrol = false;
			}
			
			TimeSourceCreateAndStart(110, _func, [], 1);
			
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
				}
				
				TimeSourceCreateAndStart(60, _func);
				
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
				"I am not the greatest at getting to the point, so before I let you have your lovely Cardinal party",
				"I have one last test for you."
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
					
				var _func = function()
				{
					LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_CHALLENGE;
				}
				
				TimeSourceCreateAndStart(1, _func);
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
				"There is one last tradition that comes with naming a new Cardinal.",
				"It is to defeat their predecessor in battle.",
				"Rose!",
				"Do not hold back. Go all out. I will do the same. ",
				"Show me how my little flower has bloomed!",
			
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
		
		#endregion
		
		break;//end In Battle Stage
	
	//Battle End Stage: The fight is over, and lavender descends
	case LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_END:
		
		#region Battle End
		
			SetRoomAudio_Music_Default();
		
			with (obj_Player)
			{
				hascontrol = false;
				image_xscale = -sign(x - LavenderBossIntroPrologue_BattleEnd_Lavender.x);
			}
			
			with(LavenderBossIntroPrologue_BattleEnd_Lavender)
			{
								
				y = min(204, y + 2);
				
				image_xscale = sign(x - obj_Player.x);
				
				if (x < 960)
				{
					x = min(960, x + map(x, x, 960, 5, 0));
				}
				else if (x > 960)
				{
					x = max(960, x - map(x, 960, x, 0, 5));
				}
				else if (x == 960 && y == 204)
				{
					other.LavenderBossIntroPrologue_BattleEnd_Lavender = LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DEFEATED_TALK;
				}
				
			}
			
		
		#endregion
		
		break;//end Battle End Stage
		
	//Lavender Defeated Talk Stage: Lavender congratulates Rose for her victory
	case LAVENDERBOSSINTROPROLOGUE_STATE.LAVENDER_DEFEATED_TALK:
	
		#region Lavender Defeated Talk 
		
			
		
		#endregion
	
		break;//end Lavender Defeated Talk Stage
		
}//end Stage machine





