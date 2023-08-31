/// @description


enum MALVALIA_FIRSTFIGHT_STATE
{
	IDLE, //Malvalia is idly standing around
	TELEPORT, //Malvalia teleports
	BLACK_GEYSER, //Malvalia summons black geysers from the ground
}

xSpeed = 0;
ySpeed = 0;

Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
Malvalia_FirstFight_NextState = MALVALIA_FIRSTFIGHT_STATE.BLACK_GEYSER;

//---------------------------Idle State----------------------------------//
Malvalia_FirstFight_Idle_StateChangeTimer = 0;
Malvalia_FirstFight_Idle_StateChangeTimerLimit = 150;

//---------------------------Teleport State------------------------------//
Malvalia_FirstFight_Teleport_Timer = 0;
Malvalia_FirstFight_Teleport_TimerLimit = 100;
Malvalia_FirstFight_Teleport_SequenceCreated = false;
Malvalia_FirstFight_Teleport_Sequence = noone;
Malvalia_FirstFight_Teleport_SequenceInstance = noone;

//----------------------------Black Geyser State-------------------------//

//The variables for how long the Black Geysers will be conjured
Malvalia_FirstFight_BlackGeyser_StateTimer = 0;
Malvalia_FirstFight_BlackGeyser_StateTimerLimit = 1000;

//Variable the holds the geyser warning particles
Malvalia_FirstFight_BlackGeyser_ConjureParticle = noone;



//Timer for the interval between when the Black Geysers are summoned
Malvalia_FirstFight_BlackGeyser_CreateTimerLimit = 100;
Malvalia_FirstFight_BlackGeyser_CreateTimer = Malvalia_FirstFight_BlackGeyser_CreateTimerLimit;

