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

//------------Voizatia Threaten Lavender-----------//
VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted = false;



