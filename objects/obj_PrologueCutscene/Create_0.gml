/// @description Prologue Cutscene Text

//PrologueCutsceneSequenceID = layer_sequence_create("Lavender", 495, 272, seq_PrologueCutsceneOld);

//------------Stages of the Cutscene------------------//
enum PROLOGUECUTSCENE
{
	ENTER,
	PROPHECY_TALK,
	PROPHECY_DECIPHER,
	STAR_NOTICE,
	STAR_APPROACH,
	END
}

PrologueCutscene_Stage = 0;

PrologueCutscene_LavenderSprite = noone;

//----------------Enter Stage------------------//
PrologueCutscene_EnterSequence = noone;
PrologueCutscene_EnterSequenceCreated = false;

//----------------Prophecy Talk Stage----------//
PrologueCutscene_ProphecyTalkStarted = false;

//----------------Prophecy Decipher Stage----------//
PrologueCutscene_ProphecyDecipherStarted = false;

//----------------Star Notice Stage----------//
PrologueCutscene_StarNoticeStarted = false;

//----------------Star Approach Stage-----------//
PrologueCutscene_StarApproachSequencesCreated = false;
PrologueCutscene_StarApproach_StarSequence = noone;
PrologueCutscene_StarApproach_WhiteSequence = noone;
