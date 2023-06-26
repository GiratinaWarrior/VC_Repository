/// @description Stages of the Cutscene

switch(CardinalFamilyCongrats_Stage)
{
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.ENTER:
		
		if (!CardinalFamilyCongrats_EnterSequenceCreated)
		{
			CardinalFamilyCongrats_EnterSequenceElm = layer_sequence_create(layer, x, y, seq_CardinalFamilyCongratsCutscene);
			CardinalFamilyCongrats_EnterSequenceCreated = true;
		}
		
		else
		{
			if (layer_sequence_is_finished(CardinalFamilyCongrats_EnterSequenceElm))
			{
				CardinalFamilyCongrats_LavenderSprite = layer_sprite_create(layer, x, y, spr_Lavender_Idle);
				CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.TALK;
			}
		}
		
		break;
		
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.TALK:
		
		var _text = 
		[
			"Greetings, Rose-darling, it sure took you long enough to make it here didn't it",
			""
		]
		
		if (!CardinalFamilyCongrats_TalkStarted)
		{
			CutsceneText(_text, "Lavender");
			CardinalFamilyCongrats_TalkStarted = true;
		}
		else if (!instance_exists(obj_Text))
		{
			CardinalFamilyCongrats_Stage = CARDINALFAMILYCONGRATSCUTSCENE_STAGE.EXIT;
		}
		
		
		break;
		
	case CARDINALFAMILYCONGRATSCUTSCENE_STAGE.EXIT:
	
		break;
}
