/// @description

var _MalvaliaX = 0;
var _MalvaliaY = 135;

switch (MalvaliaFirstFightCutscene_State)
{
	//Off Stage: Don't start the cutscene yet until the room transition is finished
	case MALVALIAFIRSTFIGHT.OFF:
	
		if !(global.MidTransition)
		{
			MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHT.MALVALIA_ENTER;
		}
		
		break;//end Off Stage
	
	//Malvalia Enter Stage: Malvalia appears in the shadow realm
	case MALVALIAFIRSTFIGHT.MALVALIA_ENTER:
		
		#region Malvalia Enter
		
			if !(MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated)
			{
				MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence = layer_sequence_create(layer, _MalvaliaX, _MalvaliaY, seq_MalvaliaFirstFight_MalvaliaEnter);
				MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated = true;
			} 
			else if (layer_sequence_is_finished(MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence))
			{
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHT.MALVALIA_ENTER_TALK;
			}
			
		#endregion
		
		break;//end Malvalia Enter Stage
		
	//Malvalia Enter Talk Stage
	case MALVALIAFIRSTFIGHT.MALVALIA_ENTER_TALK:
		
		#region Malvalia Enter Talk
		
			var _text = 
			[
				"Perfect. Let's get started my little doll.",
				"Do your best to not break for me."
			];
		
			if !(MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, ft_Malvalia);
				MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence = layer_sequence_create(layer, _MalvaliaX, _MalvaliaY, seq_MalvaliaFirstFight_MalvaliaIdle);
				layer_sequence_destroy(MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence);
				MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHT.BATTLE_START;
			}
		
		
		#endregion
		
		break;
		
	//Battle Start Stage
	case MALVALIAFIRSTFIGHT.BATTLE_START:
		
		#region Battle Start
		
			layer_sequence_destroy(MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence);
			
			obj_Player.hascontrol = true;
			
			if !(MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated)
			{
				instance_create_layer(_MalvaliaX + room_width/2, _MalvaliaY + room_height/2, layer, obj_Malvalia_FirstFight);
				MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated = true;
			}
			
			SetRoomAudio_Music_Default(music_NightfallKnightTheme);
		
		#endregion
		
		break;
	
}//end Malvalia First Fight State machine




