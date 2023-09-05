/// @description

MalvaliaFirstFightCutscene_State = 0;

enum MALVALIAFIRSTFIGHTCUTSCENE
{
	OFF, //Wait until the room has finished transitioning
	MALVALIA_ENTER, //Malvalia appears
	MALVALIA_ENTER_TALK, //Malvalia speaks
	BATTLE_START, //set up the battle
	IN_BATTLE, //while the battle is happening
	MALVALIA_DEFEATED_TALK, //Malvalia is shocked at her defeat
	MALVALIA_EXIT, //Malvalia fades away
	SHADOW_REALM_COLLAPSE, //The shadow realm collapses, Returning Rose to the Dark Shrine Pedestal
}

//------------Malvalia Enter Stage-------------//
MalvaliaFirstFightCutscene_MalvaliaEnter_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaEnter_SequenceCreated = false;

//------------Malvalia Enter Talk Stage--------//
MalvaliaFirstFightCutscene_MalvaliaIdle_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaEnterTalk_TalkStarted = false;

//------------Battle Start Stage---------------//
MalvaliaFirstFightCutscene_BattleStart_MalvaliaCreated = false;

//------------Malvalia Defeated Talk Stage-----//
MalvaliaFirstFightCutscene_MalvaliaDefeatedTalk_TalkStarted = false;

//------------Malvalia Exit Stage--------------//
MalvaliaFirstFightCutscene_MalvaliaExit_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaExit_SequenceCreated = false;

//------------



