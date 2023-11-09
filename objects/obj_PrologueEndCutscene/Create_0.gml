/// @description Insert description here
// You can write your code in this editor

//--------------Stage of the Cutscene-------------//

enum PROLOGUE_END_CUTSCENE
{
	OFF, //The cutscene has not started yey
	VOIZATIA_ENTER, //Voizatia appears on top of Valnyx Shrine Peak
	VOIZATIA_ENTER_TALK, //Voizatia talks to himself, considering his current options
	VOIZATIA_NOTICE_MALVALIA, //Voizatia notices Malvalia and beckons her to come forth
	
	MALVALIA_ENTER, //Malvalia appears behind Voizatia
	MALVALIA_ENTER_TALK, //Malvalia vents her frustrations
	VOIZATIA_CALM_MALVALIA, //Voizatia tells Malvalia that there's always a next time
	MALVALIA_EXIT_TALK, //Malvalia decides that she will get even stronger to defeat Rose
	MALVALIA_QUESTION, //Malvalia asks Voizatia how he knew where the Carvaline Orbs were
	
	VOIZATIA_TALK_LAVENDER, //Voizatia answers by beckoning his accomplice to come out
	LAVENDER_ENTER, //Lavender enters the scene
	
	CUTSCENE_END //The cutscene is over
}

PrologueEndCutscene_Stage = 0

PrologueEndCutscene_TimeSource = noone;

PrologueEndCutscene_VoizatiaIdle = noone;
PrologueEndCutscene_MalvaliaIdle = noone;
PrologueEndCutscene_LavenderIdle = noone;

//--------------Voizatia Section------------------//

//Voizatia Enter Stage
PrologueEndCutscene_VoizatiaEnter_Sequence = noone;
PrologueEndCutscene_VoizatiaEnter_SequenceCreated = false;

//Voizatia Enter Talk Stage
PrologueEndCutscene_VoizatiaEnterTalk_TalkStarted = false;
PrologueEndCutscene_VoizatiaEnterTalk_Talk = noone;

//Voizatia Notice Malvalia Stage
PrologueEndCutscene_VoizatiaNoticeMalvalia_TalkStarted = false;
PrologueEndCutscene_VoizatiaNoticeMalvalia_Talk = noone;

//---------------Malvalia Section-----------------//

//Malvalia Enter Stage
PrologueEndCutscene_MalvaliaEnter_Sequence = noone;
PrologueEndCutscene_MalvaliaEnter_SequenceCreated = false;

//Malvalia Enter Talk Stage
PrologueEndCutscene_MalvaliaEnterTalk_TalkStarted = false;
PrologueEndCutscene_MalvaliaEnterTalk_Talk = noone;

//Voizatia Calm Malvalia Stage
PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted = false;
PrologueEndCutscene_VoizatiaCalmMalvalia_Talk = noone;

//Malvalia Exit Talk Stage
PrologueEndCutscene_MalvaliaExitTalk_TalkStarted = false;
PrologueEndCutscene_MalvaliaExitTalk_Talk = noone;

//Malvalia Question Stage
PrologueEndCutscene_MalvaliaQuestion_TalkStarted = false;
PrologueEndCutscene_MalvaliaQuestion_Talk = noone;

//--------------Lavender Section--------------------//

//Voizatia Talk Lavender Stage
PrologueEndCutscene_VoizatiaTalkLavender_TalkStarted = false;
PrologueEndCutscene_VoizatiaTalkLavender_Talk = noone;

//Lavender Enter Stage
PrologueEndCutscene_LavenderEnterSequence = noone;
PrologueEndCutscene_LavenderEnterSequenceCreated = false;

