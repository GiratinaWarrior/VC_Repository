/// @description

var _font = ft_NPC;
var _pos = TEXTBOX_POS.TOP;

//Jest Aftermath Cutscene Stage machine
switch (JestAftermathCutscene_State)
{
	
	//Jest Talk Self Stage
	case JESTAFTERMATHCUTSCENE.JEST_TALK_SELF:
		
		#region Jest Talk Self
		
			var _text = 
			[
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
					JestAftermathCutscene_JestTurnRose_Sequence = layer_sequence_create(layer, Jest_NoctisCty.x, Jest_NoctisCty.y - 15, seq_ExclamationMark);
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
	
}






