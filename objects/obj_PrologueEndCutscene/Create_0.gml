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

PrologueEndCutscene_VoizatiaIdle = noone;
PrologueEndCutscene_MalvaliaIdle = noone;
PrologueEndCutscene_LavenderIdle = noone;

PrologueEndCutscene_TimeSource = noone;

//--------------Voizatia Section------------------//

//Off Stage
var _func = function()
{
	PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_ENTER;
	time_source_destroy(PrologueEndCutscene_Off_TimeSource);
	PrologueEndCutscene_Off_TimeSource = noone;
}
PrologueEndCutscene_Off_TimeSource = TimeSourceCreate(60, _func); 

//Voizatia Enter Stage
PrologueEndCutscene_VoizatiaEnter_Sequence = noone;
PrologueEndCutscene_VoizatiaEnter_SequenceCreated = false;

//Voizatia Enter Talk Stage
PrologueEndCutscene_VoizatiaEnterTalk_TalkStarted = false;
PrologueEndCutscene_VoizatiaEnterTalk_Talk = noone;

PrologueEndCutscene_VoizatiaEnterTalk_TimeSource = TimeSourceCreate(60, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_NOTICE_MALVALIA; time_source_destroy(PrologueEndCutscene_VoizatiaEnterTalk_TimeSource); PrologueEndCutscene_VoizatiaEnterTalk_TimeSource = noone;});

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

//PrologueEndCutscene_MalvaliaEnterTalk_TimeSource = TimeSourceCreate(20, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_CALM_MALVALIA; time_source_destroy(PrologueEndCutscene_MalvaliaEnterTalk_TimeSource); PrologueEndCutscene_MalvaliaEnterTalk_TimeSource = noone;});

//Voizatia Calm Malvalia Stage
PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted = false;
PrologueEndCutscene_VoizatiaCalmMalvalia_Talk = noone;

//Malvalia Exit Talk Stage
PrologueEndCutscene_MalvaliaExitTalk_TalkStarted = false;
PrologueEndCutscene_MalvaliaExitTalk_Talk = noone;

//PrologueEndCutscene_MalvaliaExitTalk_TimeSource = TimeSourceCreate(100, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_QUESTION; time_source_destroy(PrologueEndCutscene_MalvaliaExitTalk_TimeSource); PrologueEndCutscene_MalvaliaExitTalk_TimeSource = noone;});

//Malvalia Question Stage
PrologueEndCutscene_MalvaliaQuestion_TalkStarted = false;
PrologueEndCutscene_MalvaliaQuestion_Talk = noone;

PrologueEndCutscene_MalvaliaQuestion_TimeSource = TimeSourceCreate(80, function() {PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_TALK_LAVENDER; time_source_destroy(PrologueEndCutscene_MalvaliaQuestion_TimeSource); PrologueEndCutscene_MalvaliaQuestion_TimeSource = noone;});

//--------------Lavender Section--------------------//

//Voizatia Talk Lavender Stage
PrologueEndCutscene_VoizatiaTalkLavender_TalkStarted = false;
PrologueEndCutscene_VoizatiaTalkLavender_Talk = noone;

//Lavender Enter Stage
PrologueEndCutscene_LavenderEnterSequence = noone;
PrologueEndCutscene_LavenderEnterSequenceCreated = false;

PrologueEndCutscene_LavenderEnter_TimeSource = TimeSourceCreate(120, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.CUTSCENE_END; time_source_destroy(PrologueEndCutscene_LavenderEnter_TimeSource); PrologueEndCutscene_LavenderEnter_TimeSource = noone;});

