/// @description Insert description here
// You can write your code in this editor

LavenderBossIntroPrologue_State = 0;

enum LAVENDERBOSSINTROPROLOGUE_STATE
{
////Pre-Battle	

	OFF, //Nothing is happening, and Lavender is just waiting there
	CAMERA_PAN, //The camera pans over to the center
	LAVENDER_TALK_FIRST, //Lavender remarks on how beautiful the roses and moon are, and how thats where Roses's name comes from
	LAVENDER_TURN, //Lavender turns around to see Rose behind her
	LAVENDER_EXPLAIN, //Lavender that there is one more test that she has in store for Rose
	LAVENDER_CHARGE, //Lavender readies herself for battle
	LAVENDER_CHALLENGE, //Lavender tells Rose not to hold back, and that she won't either
	
/////Battle

	BATTLE_START, //Set up the boss fight
	IN_BATTLE, //The battle is ongoing until Lavender is defeated

////Post Battle
	BATTLE_END, //The battle is over and Lavender moves towards the center of the garden
	LAVENDER_DEFEATED_TALK, //Lavender explains that she is proud of Rose and what she has become
	LAVENDER_DESCEND, //Lavender descends to the ground
	LAVENDER_EXIT_TALK, //Lavender tells Rose to come over to Nox City for a celebration
	LAVENDER_EXIT, //Lavender leaves for Nox City
	CUTSCENE_END //The cutscene ends

}//end enum

LavenderBossIntroPrologue_LavenderBoss = noone;

LavenderBossIntroPrologue_LavenderIdle = noone;

LavenderBossIntroPrologue_LavenderTalkFirst_TalkStarted = false;
LavenderBossIntroPrologue_LavenderTalkFirst_Talk = noone;

LavenderBossIntroPrologue_LavenderTurn_SequenceCreated = noone;

LavenderBossIntroPrologue_LavenderExplain_TalkStarted = false;
LavenderBossIntroPrologue_LavenderExplain_Talk = noone;

LavenderBossIntroPrologue_LavenderCharge_SequenceCreated = false;
LavenderBossIntroPrologue_LavenderCharge_Sequence = noone;

LavenderBossIntroPrologue_LavenderChallenge_TalkStarted = false;
LavenderBossIntroPrologue_LavenderChallenge_Talk = noone;

LavenderBossIntroPrologue_BattleEnd_Lavender = noone;

LavenderBossIntroPrologue_LavenderDefeated_TalkStarted = false;
LavenderBossIntroPrologue_LavenderDefeated_Talk = noone;

LavenderBossIntroPrologue_LavenderExitTalk_TalkStarted = false;
LavenderBossIntroPrologue_LavenderExitTalk_Talk = noone;
