/// @description The different stages for Jest

//Do things based on what stage the Jest Cutscene is at
switch(JestDebut_Stage)
{
	//When Jest is entering the scene
	case JESTDEBUTCUTSCENE_STAGE.ENTER:
		if (!layer_sequence_exists(layer, JestDebut_EnterSeq))
		{
			JestDebut_EnterSeq = layer_sequence_create(layer, 0, 0, seq_JestDebut_Enter);
		}
		else
		{
			if (layer_sequence_is_finished(JestDebut_EnterSeq))
			{
				layer_sequence_destroy(JestDebut_EnterSeq);
				JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;
			}
		}
		break;//end Jest enter scene
		
	
}