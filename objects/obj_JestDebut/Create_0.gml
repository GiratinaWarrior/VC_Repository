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
JestDebut_EnterSeqId = noone;
JestDebut_EnterSeqElm = noone;
JestDebut_EnterSequenceCreated = false;

//------------Variables for the Enter Talk Stage-------------------//
JestDebut_StartedEnterTalk = false;

//------------Variables for the Dance Stage-------------------//
JestDebut_DanceSeqId = noone;
JestDebut_DanceSeqElm = noone;
JestDebut_DanceSequenceCreated = false;