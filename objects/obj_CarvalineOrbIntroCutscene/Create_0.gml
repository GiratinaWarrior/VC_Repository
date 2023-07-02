/// @description Variables

//-----------------------------Stages of the Cutscene------------------//
enum CARVALINEORBINTROCUTSCENE
{
	START_TALK,
	START_STORY,
	STORY,
	STORY_END,
	LAVENDER_TALK,
	LAVENDER_EXIT
}

enum CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH
{
	INTRO,
	APPROACH_PEDESTAL,
	EXPLAIN_CARDINAL,
	APPROACH_EXIT,
	EXIT_TALK
}

CarvalineOrbIntroCutscene_Stage = 0;
CarvalineOrbIntroCutscene_LavenderSpeech_Stage = 0;

//------------------------Start Talk Stage-----------------//
CarvalineOrbIntroCutscene_Start_TextCreated = false;

//------------------------Start Story Stage----------------//
CarvalineorbIntroCutscene_StartStory_Sequence = noone;
CarvalineorbIntroCutscene_StartStory_SequenceCreated = false;

//------------------------Story Stage----------------------//
CarvalineOrbIntroCutscene_Story_Sequence = noone;
CarvalineOrbIntroCutscene_Story_SequenceCreated = false;

//-----------------------Story End Stage-------------------//
CarvalineOrbIntroCutscene_StoryEnd_Sequence = noone;
CarvalineOrbIntroCutscene_StoryEnd_SequenceCreated = false;

//-----------------------Lavender Talk Stage---------------//
CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite = noone;

CarvalineOrbIntroCutscene_LavenderTalk_Intro_TalkStarted = false;

CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_Sequence = noone;
CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_SequenceCreated = false;









