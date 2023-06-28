/// @description Insert description here
// You can write your code in this editor

//The different stages of this cutscene
switch(CarvalineOrbIntroCutscene_Stage)
{
	//Start Speak Stage: Rose interacts with the Carvaline Pedestal, initiating the story cutscene
	case CARVALINEORBINTROCUTSCENE.START_TALK:
		
		//The text the Carvaline Pedestal
		var _text = 
		[
			"A strange light emerged from the structure"
		]
		
		//Create the text
		if !(CarvalineOrbIntroCutscene_Start_TextCreated)
		{
			CutsceneText(_text);
			CarvalineOrbIntroCutscene_Start_TextCreated = true;
		}
		//If the text has beeen read, move on
		else if (!instance_exists(obj_Text))
		{
			CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.START_STORY;
		}
		
		break;//end Start Speak Stage
		
	//Start Story Stage: A flash of light emerges, enveloping the screen
	case CARVALINEORBINTROCUTSCENE.START_STORY:
		
		break;//end Start Story Stage
	

}