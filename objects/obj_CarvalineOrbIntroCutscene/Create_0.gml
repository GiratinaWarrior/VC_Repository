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

//------------------------Initiation Stage-----------------//
CarvalineOrbIntroCutscene_Start_TextCreated = false;