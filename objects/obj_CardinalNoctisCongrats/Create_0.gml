/// @description Variables

//State variables

enum CARDINALNOCTISCONGRATS 
{
	LAVENDER_GREETING, //Lavender greets Rose, and hastily begins the ceremony
	LAVENDER_ASCEND, //Lavender flies up to a higher elevation
	LAVENDER_CALL_ASSEMBLY, //Lavender calls the citizens to assemble
	AUDIENCE_ASSEMBLE, //The Noxians assemble for the ceremony
	LAVENDER_SPEECH, //Lavender begins her important speech
	AUDIENCE_CHEER, //The audience cheers for Rose as the new Cardinal
	LAVENDER_END_SPEECH, //Lavender calls for a party to start, and is cut off
	SHRINE_EXPLOSION, //Valnyx Shrine is attacked, and the shockwave is felt in Noctis City
	AUDIENCE_PANIC, //The Noxians panic
	LAVENDER_ORDERS, //Lavender orders the civilians to calm down, and has Jest protect them and take refuge underground
	JEST_CONFIRM, //Jest accepts his task
	AUDIENCE_RETREAT, //Jest and the Noxians retreat underground
	LAVENDER_DESCEND, //Lavender descends from the top
	LAVENDER_ORDERS_FAMILY, //Lavender orders Rose to follow her to Valnyx Shrine 
	LAVENDER_EXIT, //Lavender leaves for Valnyx Shrine
	CUTSCENE_END //The cutscene is over and everything is reset
}

CardinalNoctisCongrats_State = 0;

//-----------------Lavender Greeting Stage------------------//
CardinalNoctisCongrats_LavenderGreeting_TalkStarted = false;

//-----------------Lavender Ascend Stage--------------------//
CardinalNoctisCongrats_LavenderAscend_Sequence = noone;
CardinalNoctisCongrats_LavenderAscend_SequenceCreated = false;

//----------------Lavender Call Assembly Stage--------------//
CardinalNoctisCongrats_LavenderCallAssembly_TalkStarted = false;

//----------------Audience Assemble Stage-------------------//
CardinalNoctisCongrats_AudienceAssemble_Sequence = noone;
CardinalNoctisCongrats_AudienceAssemble_SequenceCreated = false;

//----------------Lavender Speech Stage---------------------//
CardinalNoctisCongrats_LavenderSpeech_TalkStarted = false;
CardinalNoctisCongrats_AudienceIdleSequence = noone;

//----------------Audience Cheer Stage----------------------//
CardinalNoctisCongrats_AudienceCheer_TalkStarted = false;

//----------------Lavender End Speech Stage-----------------//
CardinalNoctisCongrats_LavenderEndSpeech_TalkStarted = false;

//----------------Shrine Explosion Stage--------------------//
CardinalNoctisCongrats_ShrineExplosion_Shaken = false;

//---------------Audience Panic Stage-----------------------//
CardinalNoctisCongrats_AudiencePanic_TalkStarted = false;

//---------------Lavender Orders Stage----------------------//
CardinalNoctisCongrats_LavenderOrders_TalkStarted = false;

//---------------Jest Confirm Stage-------------------------//
CardinalNoctisCongrats_JestConfirm_TalkStarted = false;

//---------------Audience Retreat Stage--------------------//
CardinalNoctisCongrats_AudienceRetreat_Sequence = noone;
CardinalNoctisCongrats_AudienceRetreat_SequenceCreated = false;

//-----------------Lavender Descend Stage--------------------//
CardinalNoctisCongrats_LavenderDescend_Sequence = noone;
CardinalNoctisCongrats_LavenderDescend_SequenceCreated = false;

//----------------Lavender Orders Family Stage---------------//
CardinalNoctisCongrats_LavenderOrdersFamily_TalkStarted = false;

//----------------Lavender Exit Stage------------------------//
CardinalNoctisCongrats_LavenderExit_Sequence = noone;
CardinalNoctisCongrats_LavenderExit_SequenceCreated = false;