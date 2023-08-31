/// @description

MalvaliaFirstFightCutscene_State = 0;

enum MALVALIAFIRSTFIGHT
{
	OFF, //Wait until the room has finished transitioning
	MALVALIA_ENTER, //Malvalia appears
	MALVALIA_ENTER_TALK, //Malvalia speaks
	BATTLE_START //The battle starts
}

//------------Malvalia Enter Stage-------------//
MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated = false;

//-----------Malvalia Enter Talk Stage---------//
MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted = false;

//----------Battle Start Stage-----------------//
MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated = false;