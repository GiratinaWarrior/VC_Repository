/// @description Insert description here
// You can write your code in this editor

VoizatiaBossIntro_State = 0;

enum VOIZATIABOSSINTRO
{
	
///Pre-Battle
	
	OFF, //Nothing happens
	CAMERA_PAN, //The Camera moves to where it should be
	VOIZATIA_TALK_LAVENDER, //Voizatia mocks Lavender for her weakness
	VOIZATIA_TELEPORT_ROSE, //Voizatia teleports behind Rose
	VOIZATIA_TALK_ROSE, //Voizatia shifts her attention to Rose
	VOIZATIA_PROPOSAL, //Voizatia proposes a deals for Rose
	VOIZATIA_HOSTAGE, //Voizatia moves over to Lavender to use as a hostage
	VOIZATIA_THREATEN_LAVENDER, //Voizatia explains that Lavender will be her hostage
	VOIZATIA_CHALLENGE_ROSE, //Voizatia provokes Rose to prove that resistance is futule
	VOIZATIA_ASCEND, //Voizatia flies up
	VOIZATIA_PROVOKE, //Voizatia tells Rose to come at him

///Battle

	BATTLE_START, //Set up for the Voizatia Boss Battle
	IN_BATTLE, //While the battle is ongoing
	BATTLE_END, //The battle is over

//Post-Battle

	VOIZATIA_MOCK, //Voizatia mocks Rose for her weakness and foolishness
	VOIZATIA_ORDERS, //Voizatia repeats your orders
	VOIZATIA_FLY, //Voizatia flies up, ready to leave
	VOIZATIA_FLY_TALK, //Voizatia says goodbye to Rose
	VOIZATIA_EXIT, //Voizatia leaves the scene
	PLAYER_AWAKEN, //Rose reawakens
	CUTSCENE_END, //The cutscene is over
	
}//end enum

VoizatiaBossIntro_IdleCreated = false;
VoizatiaBossIntro_VoizatiaIdle = noone;
VoizatiaBossIntro_LavenderIdle = noone;

//------------Voizatia Talk Lavender Stage---------//
VoizatiaBossIntro_VoizatiaTalkLavender_TalkStarted = false;

//------------Voizatia Teleport Rose Stage---------//
VoizatiaBossIntro_VoizatiaTeleportRose_Sequence = noone;
VoizatiaBossIntro_VoizatiaTeleportRose_SequenceCreated = false;

//------------Voizatia Talk Rose Stage-------------//
VoizatiaBossIntro_VoizatiaTalkRose_TalkStarted = false;

//------------Voizatia Proposal Stage--------------//
VoizatiaBossIntro_VoizatiaProposal_TalkStarted = false

//------------Voizatia Hostage Stage---------------//
VoizatiaBossIntro_VoizatiaHostage_Sequence = noone;
VoizatiaBossIntro_VoizatiaHostage_SequenceCreated = false;

//------------Voizatia Threaten Lavender Stage-----//
VoizatiaBossIntro_VoizatiaThreatenLavender_TalkStarted = false;

//------------Voizatia Challenge Rose Stage--------//
VoizatiaBossIntro_VoizatiaChallengeRose_TalkStarted = false;

//------------Voizatia Ascend Stage----------------//
VoizatiaBossIntro_VoizatiaAscend_Sequence = noone;
VoizatiaBossIntro_VoizatiaAscend_SequenceCreated = false;

//-----------Voizatia Provoke Stage----------------//
VoizatiaBossIntro_VoizatiaProvoke_TalkStarted = false;

//------------Battle Start Stage-------------------//
VoizatiaBossIntro_VoizatiaBoss = noone;

//------------Voizatia Mock Stage------------------//
VoizatiaBossIntro_VoizatiaMock_TalkStarted = false;

//------------Voizatia Orders Stage----------------//
VoizatiaBossIntro_VoizatiaOrders_TalkStarted = false;

//------------Voizatia Fly Talk Stage--------------//
VoizatiaBossIntro_VoizatiaFlyTalk_TalkStarted = false;

//------------Player Awaken Stage------------------//
VoizatiaBossIntro_PlayerAwaken_Timer = 0;
VoizatiaBossIntro_PlayerAwaken_TimerLimit = 150;
