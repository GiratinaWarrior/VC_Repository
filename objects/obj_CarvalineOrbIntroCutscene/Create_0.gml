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

enum CARVALINEORBINTROCUTSCENE_STORY 
{
	START,
	GOD_APPEAR,
	POWER_APPEAR,
	POWER_RADIATE,
	CROWNED
}

enum CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH
{
	INTRO,
	APPROACH_PEDESTAL,
	EXPLAIN_CARDINAL,
	EXPLAIN_CARDINAL_MORE,
	APPROACH_EXIT,
	EXIT_TALK
}

CarvalineOrbIntroCutscene_TimeSource = noone;

CarvalineOrbIntroCutscene_Stage = 0;
CarvalineOrbIntroCutscene_LavenderSpeech_Stage = 0;
CarvalineOrbIntroCutscene_LavenderSpeech = noone;

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

CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinal_StartedTalk = false;

CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinalMore_StartedTalk = false;

CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_Sequence = noone;
CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_SequenceCreated = false;

CarvalineOrbIntroCutscene_LavenderTalk_ExitTalk_TalkStarted = false;

//---------------------Lavender Exit Stage-----------------//
CarvalineOrbIntroCutscene_LavenderExit_Sequence = noone;
CarvalineOrbIntroCutscene_LavenderExit_SequenceCreated = false;

