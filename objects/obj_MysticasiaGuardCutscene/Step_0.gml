/// @description

var n = "Guard";

switch(MysticasianGuardCutscene_Stage)
{
		
	//Guard Halt Stage: The guard stops the player from moving forward
	case MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_HALT:
	
		#region Guard Halt
	
			var _text = 
			[
				"HALT!"
			]
		
			if !(MysticasianGuardCutscene_GuardHaltStarted)
			{
				CutsceneText(_text, n);
				MysticasianGuardCutscene_GuardHaltStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_DEFENSIVE;
			}
			
		#endregion
	
		break;//end Guard Halt Stage
		
	//Guard Defensive Stage: The guard takes up a defensive position
	case MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_DEFENSIVE:
		
		#region Guard Defensive
			
			var _targetY = y - 50;
			
			Guard.sprite_index = spr_NPC_VioletCultist_SuperGuard_Fly;
			
			Guard.Gravity = 0;
			Guard.y = max(_targetY, Guard.y - 1);
			
			if (Guard.y == _targetY)
			{
				Guard.NPC_CanFloat = true;
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_TALK_FIRST;
			}
			
		#endregion
		
		break;//end Guard Defensive Stage
		
	//Guard Talk First Stage: The guard explains that Mysticasia Town is not open to outsiders at the moment.
	case MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_TALK_FIRST:
		
		#region Guard Talk First
		
			var _text = 
			[
				"Up ahead is the humble Mysticasia Town!",
				"I cannot allow a stranger like you just enter it at this time!",
				"Identify yourself at once!",
				"State your business at once!"
			]
		
			if !(MysticasianGuardCutscene_GuardTalkStarted)
			{
				CutsceneText(_text, n);
				MysticasianGuardCutscene_GuardTalkStarted = true;
			}
			else
			{
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.PAUSE;
			}
			
		#endregion
		
		break;//end Guard Talk First Stage
	
	//Pause Stage: The characters talk silently, and the guard realizes who Rose is
	case MYSTICASIAGUARD_CUTSCENE_STAGE.PAUSE:
		
		#region Pause
			
			switch(MysticasianGuardCutscene_Pause_Stage)
			{
				case MYSTICASIAGUARD_CUTSCENE_PAUSE_STAGE.DOTS:
					
					if (MysticasianGuardCutscene_Pause_TripleDots == noone)
					{
						MysticasianGuardCutscene_Pause_TripleDots = layer_sequence_create(layer, obj_Player.x, obj_Player.y - 15, seq_DotDotDot);
					}
					else if (layer_sequence_is_finished(MysticasianGuardCutscene_Pause_TripleDots))
					{
						layer_sequence_destroy(MysticasianGuardCutscene_Pause_TripleDots);
						MysticasianGuardCutscene_Pause_Stage = MYSTICASIAGUARD_CUTSCENE_PAUSE_STAGE.EXCLAIM;
					}
					
					break;
					
				case MYSTICASIAGUARD_CUTSCENE_PAUSE_STAGE.EXCLAIM:
					
					if (MysticasianGuardCutscene_Pause_Exclaim == noone)
					{
						MysticasianGuardCutscene_Pause_Exclaim = layer_sequence_create(layer, Guard.x, Guard.y, seq_ExclamationMark);
					}
					else if (layer_sequence_is_finished(MysticasianGuardCutscene_Pause_Exclaim))
					{
						MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_RELAX;
					}
					
					break;
			}
			
		#endregion
		
		break;//end Pause Stage
		 
	//Guard Relax Stage: the guard descends to the ground
	case MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_RELAX:
	
		#region Guard Relax
			
			Guard.y = min(y, Guard.y + 2);
			
			if (Guard.y == y)
			{
				Guard.NPC_CanFloat = false;
				Guard.Gravity = 0.3;
				Guard.sprite_index = spr_NPC_VioletCultist_SuperGuard;
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_PERMIT_ENTRY;
			}
		
		#endregion
		
		break;//end Guard Relax Stage
		
	//Guard Permit Entry Stage: Upon realizing who Rose is, the guard allows her entry, and explains the situation in Mysticasia
	case MYSTICASIAGUARD_CUTSCENE_STAGE.GUARD_PERMIT_ENTRY:
		
		#region Guard Permit Entry
			
			var _text = 
			[
				"Rose you say!",
				"(Isn't that Lavender's...)",
				"...",
				"*Ahem*",
				"So you are now Cardinal Rose I see.",
				"Very well, you may enter Mysticasia Town, though under one condition.",
				"A few hours ago, a monster attacked our humble town.",
				"The majority of the town was wiped out, and the only survivers began to worship it.",
				"It is detestable, but please understand their position, and do what you must.",
				"Kill that thing before our people destroy themselves.",
				"It is my only request."
			]
			
			if !(MysticasianGuardCutscene_GuardPermitEntryStarted)
			{
				
				MysticasianGuardCutscene_GuardPermitEntryStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.OPEN_GATE;
			}
			
		#endregion
		
		break;//end Guard Permit Entry Stage
	
	//Open Gate Stage: The Guard opens the gate, allowing Rose to pass through
	case MYSTICASIAGUARD_CUTSCENE_STAGE.OPEN_GATE:
	
		#region Open Gate 
			
			if (MysticasianGuardCutscene_OpenGate_TimeSource == noone)
			{
				var _func = function()
				{
					layer_set_visible("HouseTiles_Closed", false);
					global.MysticasiaGuard_Cutscene_Seen = true;	
					time_source_destroy(MysticasianGuardCutscene_OpenGate_TimeSource);
				}
				MysticasianGuardCutscene_OpenGate_TimeSource = TimeSourceCreateAndStart(50, _func);
			}
			else if (global.MysticasiaGuard_Cutscene_Seen)
			{
				MysticasianGuardCutscene_Stage = MYSTICASIAGUARD_CUTSCENE_STAGE.CUTSCENE_END;
			}
			
			
		#endregion
	
		break;//end Open Gate Stage

	//Cutscene End Stage: The cutscene ends and Rose goes on her way
	case MYSTICASIAGUARD_CUTSCENE_STAGE.CUTSCENE_END:
		
		#region Cutscene End
			
			obj_Player.hascontrol = true;
			obj_Camera.follow = obj_Player;
			SaveGame();
			SetSpawnAtPlayer();
			
			instance_destroy();
			
		#endregion
		
		break;//end Cutscene End Stage
	
}//end stage machine cutscene













