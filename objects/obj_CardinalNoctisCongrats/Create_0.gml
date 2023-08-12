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
	LAVENDER_ORDERS, //Lavender orders the civillians to calm down, and to take refuge underground
	LAVENDER_DESCEND, //Lavenders descends from the podium
	LAVENDER_LAST_SPEECH, //Lavender says she will head to Valnyx Shrine, and orders Rose and Jest to follow her
	LAVENDER_LEAVE //Lavender and Jest leave with a headstart, leaving Rose to follow suit
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

