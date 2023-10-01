/// @description Setting the variables

y += 4;

//--------------------Stages of the Cutscene----------------//
enum CARDINALFAMILYCONGRATSCUTSCENE_STAGE
{
	LAVENDER_ENTER,
	LAVENDER_TALK,
	LAVENDER_FLY_EXIT,
	LAVENDER_EXIT_TALK,
	LAVENDER_WALK_EXIT,
	END
}

CardinalFamilyCongrats_Stage = 0;

//------------------Enter Stage VARIABLES-----------------//
CardinalFamilyCongrats_EnterSequenceCreated = false;
CardinalFamilyCongrats_EnterSequenceElm = noone;

//------------------Talk Stage VARIABLES------------------//
CardinalFamilyCongrats_TalkStarted = false;
CardinalFamilyCongrats_TalkLavenderSprite = noone;
CardinalFamilyCongrats_Speech = noone;

//------------------Fly Exit Stage VARIABLES--------------//
CardinalFamilyCongrats_ExitSequenceCreated = false;
CardinalFamilyCongrats_ExitSequenceElm = noone;

//------------------Exit Talk Stage VARIABLES-------------//
CardinalFamilyCongrats_ExitTalkStarted = false;

//------------------Walk Exit Stage VARIABLES--------------//
CardinalFamilyCongrats_WalkExitSequenceCreated = false;
CardinalFamilyCongrats_WalkExitSequenceElm = noone;