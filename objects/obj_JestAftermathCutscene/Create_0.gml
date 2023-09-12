/// @description

JestAftermathCutscene_State = 0;

enum JESTAFTERMATHCUTSCENE
{
	JEST_TALK_SELF, //Jest talks to himself worrying about the situation
	JEST_TURN_ROSE, //Jest turns around an notices Rose
	JEST_TALK_FIRST, //Jest talks to Rose, asking what happened
	JEST_UNDERSTAND_SITUATION, //After Rose explains the situation, Jest acknowledges this fact
	JEST_TURN_EXIT, //Jest turns towards the exit to the right 
	JEST_EXPLAIN_FOREST, //Jest explains that the Somnium Forest is up ahead
	JEST_GOOD_LUCK, //Jest wishes Rose good luck on her journey while he stays and keeps watch of the Noxians and Valnyx Shrien
}

//---------------Jest Talk Self Stage--------------//
JestAftermathCutscene_JestTalkSelf_TalkStarted = false;

//---------------Jest Turn Rose Stage--------------//
JestAftermathCutscene_JestTurnRose_Sequence = noone;
JestAftermathCutscene_JestTurnRose_SequenceCreated = false;