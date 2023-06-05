/// @description The different stages for Jest

//Do things based on what stage the Jest Cutscene is at
switch(JestDebut_Stage)
{
	
	//While Jest is inactive
	case JESTDEBUTCUTSCENE_STAGE.OFFSCREEN:
	
		//If Jest hasn't laughed yet
		if (!JestDebut_StartedOffscreenTalk)
		{
			JestDebut_StartedOffscreenTalk = true;
			CutsceneText(["Huhuhuuu..."], "???");
		}//ed Jest hasn't laughed
		
		//If Jest has finished talking, enter the enter stage
		if (!instance_exists(obj_Text) && JestDebut_StartedOffscreenTalk)
		{
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER;
		}
		
		break;
	
	
	//When Jest is entering the scene
	case JESTDEBUTCUTSCENE_STAGE.ENTER:
		
		if (!layer_sequence_exists(layer, JestDebut_EnterSeq))
		{
			JestDebut_EnterSeq = layer_sequence_create(layer, 0, 0, seq_JestDebut_Enter);
		}//end create sequence
	
		//if the sequence has already been created
		else
		{
			//if the sequence is finished, destroy it
			if (layer_sequence_is_finished(JestDebut_EnterSeq))
			{
				layer_sequence_destroy(JestDebut_EnterSeq);
				JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.ENTER_TALK;
			}//end destroy sequence when finished
	
		}
		break;//end Jest enter scene
		
	//When Jest is introduced and starts talking
	case JESTDEBUTCUTSCENE_STAGE.ENTER_TALK:
		var _text = 
		[
			"Huhuhello Rosey, it seems you've cleared the other trials with ease.",
			"Mother says it'll take blood and sweat to pass her tests, but look at you now!",
			"Don't worry Rosey, your brother has got a more exciting trial awaiting you"
			
		]
		//If Jest hasn't started talking, start talking
		if (!JestDebut_StartedEnterTalk)
		{
			CutsceneText(_text, "Jest");
			JestDebut_StartedEnterTalk = true;
		}
		//If Jest has finished talking, starting dancing
		if (!instance_exists(obj_Text) && JestDebut_StartedEnterTalk == true)
		{
			JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.DANCE;
		}
		break;//end Jest starts talking
		
	//When Jest starts dancing
	case JESTDEBUTCUTSCENE_STAGE.DANCE:
	
		break;
	
}