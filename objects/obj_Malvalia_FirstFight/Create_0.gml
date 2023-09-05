/// @description


enum MALVALIA_FIRSTFIGHT_STATE
{
	IDLE, //Malvalia is idly standing around
	TELEPORT, //Malvalia teleports
	BLACK_GEYSER, //Malvalia summons black geysers from the ground
	RED_NEEDLES, //Malvalia shoots out red needles from her hair
	DEFEATED //Malvalia is defeated
}

xSpeed = 0;
ySpeed = 0;
Gravity = 0;

Malvalia_FirstFight_CurrentState = MALVALIA_FIRSTFIGHT_STATE.IDLE;
Malvalia_FirstFight_NextState = MALVALIA_FIRSTFIGHT_STATE.BLACK_GEYSER;

//---------------------------Idle State----------------------------------//
Malvalia_FirstFight_Idle_StateChangeTimer = 0;
Malvalia_FirstFight_Idle_StateChangeTimerLimit = 150;

//---------------------------Teleport State------------------------------//

//The timer for how long it takes before Malvalia will teleprot
Malvalia_FirstFight_Teleport_Timer = 0;
Malvalia_FirstFight_Teleport_TimerLimit = 100;

//Sequence variables for the teleporting sequence
Malvalia_FirstFight_Teleport_SequenceCreated = false;
Malvalia_FirstFight_Teleport_Sequence = noone;
Malvalia_FirstFight_Teleport_SequenceInstance = noone;

//Teleportation coordinates
Malvalia_FirstFight_Teleport_TargetX = 0;
Malvalia_FirstFight_Teleport_TargetY = 0;

//----------------------------Black Geyser State-------------------------//

//The variables for how long the Black Geysers will be conjured
Malvalia_FirstFight_BlackGeyser_StateTimer = 0;
Malvalia_FirstFight_BlackGeyser_StateTimerLimit = 600;

//Variable the holds the geyser warning particles
Malvalia_FirstFight_BlackGeyser_ConjureParticle = noone;

//How long it takes for a Black Geyser to be created after the warning
Malvalia_FirstFight_BlackGeyser_ConjureTime = 60;

//Timer for the interval between when the Black Geysers are summoned
Malvalia_FirstFight_BlackGeyser_CreateTimerLimit = 80;
Malvalia_FirstFight_BlackGeyser_CreateTimer = Malvalia_FirstFight_BlackGeyser_CreateTimerLimit;

//How far off the Black Geysers can be
Malvalia_FirstFight_BlackGeyser_Range = 50;

//--------------------------Red Needles State---------------------------//

//Variable for if Malvalia has teleported to the center first
Malvalia_FirstFight_RedNeedles_TeleportedToCenter = false;

//The variables for how long the Red Needles will be shot
Malvalia_FirstFight_RedNeedles_StateTimer = 0;
Malvalia_FirstFight_RedNeedles_StateTimerLimit = 400;

//The variables for the frequency the Red Needles shoot at
Malvalia_FirstFight_RedNeedles_ShootTimer = 0;
Malvalia_FirstFight_RedNeedles_ShootTimerLimit = 8;