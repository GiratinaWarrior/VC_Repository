/// @description

enum LAVENDERDEATH_CUTSCENE
{
	INACTIVE, //This section is inactive
	LAVENDER_RISE, //Lavender stands up despite being injured
	LAVENDER_TALK_FIRST, //Lavender claims that she won't let Rose become Voizatia's toy
	VOIZATIA_REACT, //Voizatia congratulates Lavender for standing
	LAVENDER_TALK_VOIZATIA, //Lavender says that there is one last thing she can do
	LAVENDER_FINAL_ATTACK, //Lavender attacks Voizatia with her last attack
	LAVENDER_TURN_AROUND, //Lavender turns around to approach Rose
	LAVENDER_APPROACH_ROSE, //Lavender approaches Rose
	LAVENDER_TALK_SECOND, //Lavender attempts to speak but can bring out words
	LAVENDER_DESPAIR, //Lavenders eyes are shadowed out, and tears start forming
	LAVENDER_DESPAIR_TALK, //Lavender begins apologizing to Rose for raising her to be weak
	VOIZATIA_APPEAR, //Voizatia appears behind
	LAVENDER_FINAL_TALK, //Lavender tells Rose that she loves her, but will be interrupted
	VOIZATIA_STRIKE_LAVENDER, //Voizatia beheads Lavender, killing her entirely
	VOIZATIA_MOCK_LAVENDER, //Voizatia mocks Lavender for her weakness, and the weakness she gave Rose
	VOIZATIA_ANNIHILATE_LAVENDER, //Voizatia completely vaporizes Lavender's body
	CUTSCENE_END, //This section of the cutscene ends
}

LavenderDeathCutscene_State = 0;
LavenderDeathCutscene_TimeSource = noone;

//----------Lavender Talk First----------//
LavenderDeathCutscene_LavenderTalkFirst_TalkStarted = false;

//----------Voizatia React---------------//
LavenderDeathCutscene_VoizatiaReact_TalkStarted = false;

//----------Lavender Talk Voizatia-------//
LavenderDeathCutscene_LavenderTalkVoizatia_TalkStarted = false;

//----------Lavender Final Attack--------//
LavenderDeathCutscene_LavenderFinalAttack_AttackSprite = noone;
LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequence = noone;
LavenderDeathCutscene_LavenderFinalAttack_SurpriseSequenceCreated = false;

//----------Lavender Talk Second---------//
LavenderDeathCutscene_LavenderTalkSecond_TalkStarted = false;

//----------Lavender Despair Talk--------//
LavenderDeathCutscene_LavenderDespairTalk_TalkStarted = false;

//----------Lavender Final Talk----------//
LavenderDeathCutscene_LavenderFinalTalk_TalkStarted = false;

//----------Voizatia Strike Lavender-----// 
LavenderDeathCutscene_VoizatiaStrikeLavender_Sequence = noone;
LavenderDeathCutscene_VoizatiaStrikeLavender_SequenceCreated = false;

//----------Voizatia Mock Lavender-------//
LavenderDeathCutscene_VoizatiaMockLavender_TalkStarted = false;

//----------Voizatia Annihilate Lavender-//
LavenderDeathCutscene_VoizatiaAnnihilateLavender_SinEruption = noone;
