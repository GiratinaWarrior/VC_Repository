/// @description Set variables

//--------------Variables for the Stages of Jest's Debut----------------//

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
JestDebut_Stage = JESTDEBUTCUTSCENE_STAGE.INACTIVE;

//------------Variables for the Offscreen Stage-------------------//
JestDebut_StartedOffscreenTalk = false;
JestDebut_FinishedOffscreenTalk = false;

//------------Variables for the Enter Stage-------------------//
JestDebut_EnterSequenceCreated = false;
JestDebut_EnterSequenceElm = noone;
JestDebut_EnterSequenceId = noone;

//------------Variables for the Enter Talk Stage-------------------//
JestDebut_StartedEnterTalk = false;

//------------Variables for the Dance Stage-------------------//
JestDebut_DanceSequenceCreated = false;
JestDebut_DanceSequenceElm = noone;
JestDebut_DanceSequenceId = noone;

//------------Variables for the Exit Talk Stage-------------------//
JestDebut_StartedExitTalk = false;

//------------Variables for the Exit Stage-------------------//
JestDebut_ExitSequenceCreated = false;
JestDebut_ExitSequenceElm = noone;
JestDebut_ExitSequenceId = noone;



