/// @description

enum SHRINEARENABOSSINTRO 
{
	SET_UP, //Setting up the stage
	CAMERA_PAN, //Rose enters the arena
	JEST_OFF_TALK, //Jest speaks while not visible
	LIGHTS_ON, //The lights come on to reveal the audience and Jest
	JEST_ENTER_TALK, //Jest starts the show off
	AUDIENCE_CHEER_JEST, //The audience cheers for Jest
	
	
	JEST_INTRODUCE_ROSE, //Jest introduces the first competitor Rose
	AUDIENCE_CHEER_ROSE, //The audience cheers for Rose
	JEST_INTRODUCE_GENERAL, //Jest introduces the second competitor Shrine General
	LIGHTS_OFF, //The lights go out
	GENERAL_ENTER, //The Shrine General Enters the scene
	GENERAL_ENTER_TALK, //The Shrine General speaks his first words,
	LIGHTS_BACK_ON, //the lights go back on
	GENERAL_CHALLENGE, //SG beckons Rose to go all out
	
	ARENA_ENCLOSE, //The doors close
	JEST_COUNTDOWN, //Jest does a countdown to start the battle
	BATTLE_START, //Set up the battle
	IN_BATTLE, //While the battle
	BATTLE_END, //When the battle is over
	GENERAL_DEFEAT_TALK, //The general is defeated, and speaks of it
	GENERAL_EXIT, //The general takes his leave
	
	JEST_ANNOUNCE_WINNER, //Jest announces that the winner is Rose
	AUDIENCE_APPLAUD, //The audience cheers for Rose's victory
	JEST_DISMISS, //Jest tells the audience to come back next
	AUDIENCE_EXIT, //The audience leaves
	JEST_EXIT_TALK, //Jest leaves some last words for Rose
	JEST_EXIT, //Jest makes his leave
	CUTSCENE_END, //The cutscene ends
}

ShrineArenaBossIntro_State = 0;
ShrineArenaBossIntro_TimeSource = noone;

obj_Camera.sprite_index = spr_BlackScreen;
obj_Camera.image_alpha = 0.95;

//-----------Off----------------------//
ShrineArenaBossIntro_IdleCreated = false;
ShrineArenaBossIntro_AudienceIdle1 = noone;
ShrineArenaBossIntro_AudienceIdle2 = noone;
ShrineArenaBossIntro_JestIdle = noone;
ShrineArenaBossIntro_GeneralIdle = noone;

//-----------Jest Off Talk------------//
ShrineArenaBossIntro_JestOffTalk_TalkStarted = false;

//-----------Jest Enter Talk----------//
ShrineArenaBossIntro_JestEnterTalk_TalkStarted = false;

//-----------Audience Cheer Jest------//
ShrineArenaBossIntro_AudienceCheerJest_TalkStarted = false;

//-----------Jest Introduce Rose------//
ShrineArenaBossIntro_JestIntroduceRose_TalkStarted = false;

//-----------Audience Cheer Rose------//
ShrineArenaBossIntro_AudienceCheerRose_TalkStarted = false;

//-----------Jest Introduce General---//
ShrineArenaBossIntro_JestIntroduceGeneral_TalkStarted = false;

//-----------General Enter------------//
ShrineArenaBossIntro_GeneralEnter_Sequence = noone;
ShrineArenaBossIntro_GeneralEnter_SequenceCreated = false;

//-----------General Enter Talk-------//
ShrineArenaBossIntro_GeneralEnterTalk_TalkStarted = false;

//-----------General Challenge--------//
ShrineArenaBossIntro_GeneralChallenge_TalkStarted = false;

//-----------Arena Close--------------// 
ShrineArenaBossIntro_DoorsCreated = false;
ShrineArenaBossIntro_EntranceWall = noone;
ShrineArenaBossIntro_ExitWall = noone;

//-----------Jest Countdown-----------//
ShrineArenaBossIntro_JestCountdown_TalkStarted = false;

//-----------General Defeat Talk------//
ShrineArenaBossIntro_GeneralDefeatTalk_TalkStarted = false;

//-----------Jest Announce Winner-----//
ShrineArenaBossIntro_JestAnnounceWinner_TalkStarted = false;

//-----------Audience Applaud---------//
ShrineArenaBossIntro_AudienceApplaud_TalkStarted = false;

//-----------Jest Dismiss-------------//
ShrineArenaBossIntro_JestDismiss_TalkStarted = false;

//-----------Jest Exit Talk-----------//
ShrineArenaBossIntro_JestExitTalk_TalkStarted = false;

//-----------Jest Exit----------------//
ShrineArenaBossIntro_JestExit_Sequence = noone;
ShrineArenaBossIntro_JestExit_SequenceCreated = false;

