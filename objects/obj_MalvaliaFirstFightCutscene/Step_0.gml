/// @description


switch (MalvaliaFirstFightCutscene_State)
{
	//Off Stage: Don't start the cutscene yet until the room transition is finished
	case MALVALIAFIRSTFIGHTCUTSCENE.OFF:
	
		if !(global.MidTransition)
		{
			MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_ENTER;
		}
		
		break;//end Off Stage
	
	//Malvalia Enter Stage: Malvalia appears in the shadow realm
	case MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_ENTER:
		
		#region Malvalia Enter
		
			if !(MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated)
			{
				MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence = layer_sequence_create(layer, 0, 135, seq_MalvaliaFirstFight_MalvaliaEnter);
				MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated = true;
			} 
			else if (layer_sequence_is_finished(MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence))
			{
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_ENTER_TALK;
			}
			
		#endregion
		
		break;//end Malvalia Enter Stage
		
	//Malvalia Enter Talk Stage
	case MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_ENTER_TALK:
		
		#region Malvalia Enter Talk
		
			var _text = 
			[
				"Perfect. Let's get started my little doll.",
				"Do your best to not break for me."
			];
		
			if !(MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, ft_Malvalia);
				MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence = layer_sequence_create(layer, 0, 135, seq_MalvaliaFirstFight_MalvaliaIdle);
				layer_sequence_destroy(MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence);
				MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.BATTLE_START;
			}
		
		
		#endregion
		
		break;//end Malvalia Enter Talk Stage
		
	//Battle Start Stage
	case MALVALIAFIRSTFIGHTCUTSCENE.BATTLE_START:
		
		#region Battle Start
		
			layer_sequence_destroy(MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence);
			
			obj_Player.hascontrol = true;
			
			if !(MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated)
			{
				instance_create_layer(0 + room_width/2, 135 + room_height/2, layer, obj_Malvalia_FirstFight);
				MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated = true;
			}
			
			SetRoomAudio_Music_Default(music_NightfallKnightTheme);
		
			MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.IN_BATTLE;
		
		#endregion
		
		break;//end Battle Start Stage
		
	//Malvalia Defeated Talk Stage
	case MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_DEFEATED_TALK:
		
		#region Malvalia Defeated Talk
			
			obj_Player.hascontrol = false;
			
			var _text = 
			[
				"*pant*...*pant*...damn...it...",
				"no...fair...no...fair...at all...",
				"you're...just...a...doll...",
				"...no...",
				"we're not done........",
				"one day...I'll...drag...you...down...to.......HELL!"
			];
			
			if !(MalvaliaFirstFightCutscene_MalvaliaDefeatedTalk_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, ft_Malvalia);	
				MalvaliaFirstFightCutscene_MalvaliaDefeatedTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
			//	show_debug_message("NEXT STAGE");
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_EXIT;
			//	show_debug_message("NEXT STAGE");
			}
			
		#endregion
		
		break;//end Malvalia Defeated Talk Stage
	
	//Malvalia Exit Stage
	case MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_EXIT:
	
		#region Malvalia Exit
			
			//show_debug_message("NEXT STAGE");
			
			if !(MalvaliaFirstFightCutscene_MalvaliaExit_SequenceCreated)
			{
				MalvaliaFirstFightCutscene_MalvaliaExit_Sequence = layer_sequence_create("Malvalia", obj_Malvalia_FirstFight_Defeated.x, obj_Malvalia_FirstFight_Defeated.y, seq_MalvaliaFirstFight_MalvaliaExit);
				instance_destroy(obj_Malvalia_FirstFight_Defeated);
				MalvaliaFirstFightCutscene_MalvaliaExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(MalvaliaFirstFightCutscene_MalvaliaExit_Sequence))
			{
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.SHADOW_REALM_COLLAPSE;
				layer_sequence_destroy(MalvaliaFirstFightCutscene_MalvaliaExit_Sequence);
			}
			
		#endregion
		
		break;//end Malvalia Exit Stage
		
	//Shadow Realm Collapse Stage
	case MALVALIAFIRSTFIGHTCUTSCENE.SHADOW_REALM_COLLAPSE:
	
		#region Shadow Realm Collapse
		
			global.MalvaliaDefeated = true;
		
			with (instance_create_layer(obj_Player.x, obj_Player.y, "Player", obj_RoomWarp))
			{
				target = Room_DarkShrineBasementPedestal;
				WarpX = 1216;
				WarpY = 448;
				ExitSequence = seq_MalvaliaBattleOut;
				EnterSequence = seq_MalvaliaBattleIn;
			}
			
			SetSpawnpoint(1216, 448, Room_DarkShrineBasementPedestal);
			
			SaveGame();
		
		#endregion
		
		break;//end Shadow Realm Collapse Stage

}//end Malvalia First Fight State machine




