/// @description Set variables

//--------------Variables for the Stages of Jest's Debut----------------//

//x -= 300;

//The the different stages
enum JESTDEBUTCUTSCENE_STAGE
{
	INACTIVE,
	OFFSCREEN,
	ENTER,
	ENTER_TALK,
	DANCE,
	EXIT_TALK,
	EXIT
}

//The Stage that the cutscene is currently on
JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.OFFSCREEN;

JestDebut_Sprite = noone;

//------------Variables for the Offscreen Stage-------------------//
JestDebut_StartedOffscreenTalk = false;

//------------Variables for the Enter Stage-------------------//
JestDebut_EnterSequenceCreated = false;
JestDebut_EnterSequence = noone

//------------Variables for the Enter Talk Stage-------------------//
JestDebut_EnterTalkStarted = false;

//------------Variables for the Dance Stage-------------------//
JestDebut_DanceSequenceCreated = false;
JestDebut_DanceSequence = noone;

//------------Variables for the Exit Talk Stage-------------------//
JestDebut_StartedExitTalk = false;

//------------Variables for the Exit Stage-------------------//
JestDebut_ExitSequenceCreated = false;
JestDebut_ExitSequence = noone;



