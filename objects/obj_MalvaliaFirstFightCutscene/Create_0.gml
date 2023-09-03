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
	SHADOW_REALM_GATE, //Malvalia summons a gate to the normal world
	MALVALIA_DISMISS, //Malvalia tells Rose to hurry up and get lost already
	MALVALIA_EXIT, //Malvalia fades into the Shadow realm
	CUTSCENE_END //Rose leaves through the exit
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

//------------Shadow Realm Gate Stage----------//
MalvaliaFirstFightCutscene_ShadowRealmGate_Gate = noone;
MalvaliaFirstFightCutscene_ShadowRealmGate_GateAlpha = 0;
MalvaliaFirstFightCutscene_ShadowRealmGate_GateCreated = false;

//------------Malvalia Exit Stage--------------//
MalvaliaFirstFightCutscene_MalvaliaExit_Sequence = noone;
MalvaliaFirstFightCutscene_MalvaliaExit_SequenceCreated = false;

//------------Malvalia Dismiss Stage-----------//
MalvaliaFirstFightCutscene_MalvaliaDismiss_TalkStarted = false;




