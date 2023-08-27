/// @description

enum VOIZATIADEBUT 
{
	ROSE_ENTER, //Rose enters the scene
	VOIZATIA_TALK_FIRST, //Voizatia speaks for the first time
	LAVENDER_RESPOND_FIRST, //Lavender retorts to Voizatias statement
	VOIZATIA_RESPOND_SECOND, //Voizatia retorts 
	VOIZATIA_FLY, //Voizatia rises to fly
	VOIZATIA_SUMMON_MALVALIA, //Voizatia calls Malvalia to fight with him
	MALVALIA_ENTER, //Malvalia enters the scene
	MALVALIA_TALK_FIRST, //Malvalia speaks
	VOIZATIA_RESPOND_THIRD, //Voizatia responds to Malvalia
	VOIZATIA_EXIT, //Voizatia leaves,
	LAVENDER_EXIT_TALK, //Lavender tells Rose to take Malvalia seriously before leaving
	LAVENDER_EXIT //Lavender leaves to fight Voizatia
}

VoizatiaDebut_State = 0;

VoizatiaDebut_LavenderIdle_Sequence = noone;
VoizatiaDebut_VoizatiaIdle_Sequence = noone;
VoizatiaDebut_MalvaliaIdle_Sequence = noone;

//-----------Rose Enter Stage-------------------//
VoizatiaDebut_RoseEnter_Sequence = noone;
VoizatiaDebut_RoseEnter_SequenceCreated = false;

//-----------Voizatia Talk First Stage----------//
VoizatiaDebut_VoizatiaTalkFirst_TalkStarted = false;

//-----------Lavender Respond First Stage-------//
VoizatiaDebut_LavenderRespondFirst_TalkStarted = false;

//-----------Voizatia Respond Second Stage------//
VoizatiaDebut_VoizatiaRespondSecond_TalkStarted = false;

//-----------Voizatia Fly Stage-----------------//
VoizatiaDebut_VoizatiaFly_Sequence = noone;
VoizatiaDebut_VoizatiaFly_SequenceCreated = false;

//-----------Voizatia Summon Malvalia Stage-----//
VoizatiaDebut_VoizatiaSummonMalvalia_TalkStarted = false;

//-----------Malvalia Enter Stage---------------//
VoizatiaDebut_MalvaliaEnter_Sequence = noone;
VoizatiaDebut_MalvaliaEnter_SequenceCreated = false;

//-----------Malvalia Talk First----------------//
VoizatiaDebut_MalvaliaTalkFirst_TalkStarted = false;

//-----------Voizatia Respond Third Stage------//
VoizatiaDebut_VoizatiaRespondThird_TalkStarted = false;
