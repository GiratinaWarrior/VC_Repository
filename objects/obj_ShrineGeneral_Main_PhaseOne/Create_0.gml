/// @description Set Variables

//-------------Movement Variables-------------//
ShrineGeneral_Speed = 2;

xSpeed = ShrineGeneral_Speed;
ySpeed = 0;
Gravity = 0.3;

//-------------State Variables-------------//

//Different states
enum SHRINEGENERAL_STATE_ONE
{
	IDLE,
	RAPID,
	ROCKET
}

//Variable that holds the state
ShrineGeneral_State_One = SHRINEGENERAL_STATE_ONE.IDLE;

//Variable the counts up to change the state
ShrineGeneral_StateChangeCounter = 0;
//How long it takes for SG to use an attack
ShrineGeneral_StateChangeLimit = 100;

//-------------Arm Objects-------------//
ShrineGeneral_LeftArm = instance_create_depth(x, y, depth - 1, obj_ShrineGeneral_LeftArm_PhaseOne);
ShrineGeneral_RightArm = instance_create_depth(x, y, depth + 1, obj_ShrineGeneral_RightArm_PhaseOne);

//-------------Distance Range Variables-------------//

//How far away the player is from SG
ShrineGeneral_PlayerRange = 0;
//The range the player needs to be in for SG to use Rapid Punches
ShrineGeneral_RapidRange = 100;
//The range the player needs to be in for SG to use Rocket Punch, must not be within range of Rapid Punch
ShrineGeneral_RocketRange = 1000;

//------------Rocket Punch variables---------------//

enum SHRINEGENERAL_ROCKETPUNCH_STATE
{
	WINDUP,
	JAB,
	CROSS,
	COOLDOWN
}

ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP;

//The distance the rocket punch travels
ShrineGeneral_RocketPunch_MaxDist = 200;
//The time it takes for the punch to reach its max distance
ShrineGeneral_RocketPunch_MaxTime = 10;
//The speed of the punch
ShrineGeneral_RocketPunch_Speed = ShrineGeneral_RocketPunch_MaxDist/ShrineGeneral_RocketPunch_MaxTime; 

ShrineGeneral_RocketPunch_Accel = 2;

ShrineGeneral_RocketPunch_Dir = image_xscale;

//The time it takes to wind up the punch, as well as the timer
ShrineGeneral_RocketPunch_TimeToWindUp = 40;
ShrineGeneral_RocketPunch_StartTimer = 0;

//The damage the rocket punch does
ShrineGeneral_RocketPunch_Damage = 3;

//How long the rocket punch stays still after reaching its max distance, as well as the timer
ShrineGeneral_RocketPunch_HangTime = 10;
ShrineGeneral_RocketPunch_StayTimer = 0;

//The cooldown for after the rocket punch has been fired, as well as the timer
ShrineGeneral_RocketPunch_TimeToCoolDown = 20;
ShrineGeneral_RocketPunch_CooldownTimer = 0;

//------------Rapid Punch variables----------------//