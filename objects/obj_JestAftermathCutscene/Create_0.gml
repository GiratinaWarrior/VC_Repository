/// @description



JestAftermathCutscene_State = 0;
JestAftermathCutscene_TimeSource = noone;

enum JESTAFTERMATHCUTSCENE
{
	JEST_TALK_SELF, //Jest talks to himself worrying about the situation
	JEST_TURN_ROSE, //Jest turns around an notices Rose
	JEST_TALK_FIRST, //Jest talks to Rose, asking what happened
	JEST_LISTEN, //Jest listens 
	JEST_DEPRESSED, //After Rose explains the situation, Jest acknowledges this fact
	JEST_BACK_UP,
	JEST_EXPLAIN_FOREST, //Jest explains that the Somnium Forest is up ahead
	JEST_GOOD_LUCK, //Jest wishes Rose good luck on her journey while he stays and keeps watch of the Noxians and Valnyx Shrine
	CUTSCENE_END, //The cutscene is over, and everything is reset
}

//---------------Jest Talk Self Stage--------------//
JestAftermathCutscene_JestTalkSelf_TalkStarted = false;

//---------------Jest Turn Rose Stage--------------//
JestAftermathCutscene_JestTurnRose_Sequence = noone;
JestAftermathCutscene_JestTurnRose_SequenceCreated = false;

//---------------Jest Talk First Stage
JestAftermathCutscene_JestTalkFirst_TalkStarted = false;

//---------------Jest Listen Stage-----------------//
JestAftermathCutscene_JestListen_Sequence = noone;
JestAftermathCutscene_JestListen_SequenceCreated = false;

//---------------Jest Understand Situation Stage---//
JestAftermathCutscene_JestUnderstandSituation_TalkStarted = false;

//---------------Jest Explain Forest Stage---------//
JestAftermathCutscene_JestExplainForest_TalkStarted = false;

//---------------Jest Good Luck Stage--------------//
JestAftermathCutscene_JestGoodLuck_TalkStarted = false;
