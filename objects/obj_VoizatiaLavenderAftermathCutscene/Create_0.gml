/// @description

VoizatiaLavenderAftermath_State = 0;

enum VOIZATIALAVENDERAFTERMATHCUTSCENE
{
	OFF, //Nothing happens
	CAMERA_PAN, //The Camera moves to where it should be
	VOIZATIA_TALK_LAVENDER, //Voizatia mocks Lavender for her weakness
	VOIZATIA_TELEPORT_ROSE, //Voizatia teleports behind Rose
	VOIZATIA_TALK_ROSE, //Voizatia shifts her attention to Rose
	VOIZATIA_PROPOSAL, //Voizatia proposes a deals for Rose
	VOIZATIA_HOSTAGE, //Voizatia moves over to Lavender to use as a hostage
	VOIZATIA_THREATEN_LAVENDER, //Voizatia explains that Lavender will be her hostage
	VOIZATIA_CHALLENGE_ROSE, //Voizatia provokes Rose to prove that resistance is futule
	PLAYER_FREE, //Rose is free to move, albeit momentarily
	VOIZATIA_STRIKE, //Voizatia attacks Rose the second she moves a muscle
	VOIZATIA_MOCK, //Voizatia mocks Rose for her weakness and foolishness
	VOIZATIA_FLY, //Voizatia flies up, ready to leave
	VOIZATIA_FLY_TALK, //Voizatia says goodbye to Rose
	VOIZATIA_EXIT, //Voizatia leaves the scene
	CUTSCENE_END, //The cutscene is over
}

VoizatiaLavenderAftermath_IdleCreated = false;
VoizatiaLavenderAftermath_VoizatiaIdle = noone;
VoizatiaLavenderAftermath_LavenderIdle = noone;

//------------Voizatia Talk Lavender Stage---------//
VoizatiaLavenderAftermath_VoizatiaTalkLavender_TalkStarted = false;

//------------Voizatia Teleport Rose Stage---------//
VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence = noone;
VoizatiaLavenderAftermath_VoizatiaTeleportRose_SequenceCreated = false;

//------------Voizatia Talk Rose Stage-------------//
VoizatiaLavenderAftermath_VoizatiaTalkRose_TalkStarted = false;

//------------Voizatia Proposal Stage--------------//
VoizatiaLavenderAftermath_VoizatiaProposal_TalkStarted = false

//------------Voizatia Hostage Stage---------------//
VoizatiaLavenderAftermath_VoizatiaHostage_Sequence = noone;
VoizatiaLavenderAftermath_VoizatiaHostage_SequenceCreated = false;

//------------Voizatia Threaten Lavender Stage-----//
VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted = false;

//------------Voizatia Challenge Rose Stage--------//
VoizatiaLavenderAftermath_VoizatiaChallengeRose_TalkStarted = false;

//------------Player Free Stage--------------------//
VoizatiaLavenderAftermath_PlayerFree_PlayerMoved = false;

//------------Voizatia Strike Stage----------------//
VoizatiaLavenderAftermath_VoizatiaStrike_Sequence = noone;
VoizatiaLavenderAftermath_VoizatiaStrike_SequenceCreated = false;

//------------Voizatia Mock Stage------------------//
VoizatiaLavenderAftermath_VoizatiaMock_TalkStarted = false;
VoizatiaLavenderAftermath_SpearsIdle = noone;

//------------Voizatia Fly Stage-------------------//
VoizatiaLavenderAftermath_VoizatiaFly_Sequence = noone;
VoizatiaLavenderAftermath_VoizatiaFly_SequenceCreated = false;

//------------Voizatia Fly Talk Stage--------------//
VoizatiaLavenderAftermath_VoizatiaFlyTalk_TalkStarted = false;

//------------Voizatia Exit Stage------------------//
VoizatiaLavenderAftermath_VoizatiaExit_Sequence = noone;
VoizatiaLavenderAftermath_VoizatiaExit_SequenceCreated = false;
