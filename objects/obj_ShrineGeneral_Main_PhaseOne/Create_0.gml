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
ShrineGeneral_RocketPunch_MaxTime = 20;
//The speed of the punch
ShrineGeneral_RocketPunch_Speed = ShrineGeneral_RocketPunch_MaxDist/ShrineGeneral_RocketPunch_MaxTime; 

ShrineGeneral_RocketPunch_Dir = image_xscale;

//The time it takes to wind up the punch, as well as the timer
ShrineGeneral_RocketPunch_TimeToWindUp = 40;
ShrineGeneral_RocketPunch_StartTimer = 0;

//The damage the rocket punch does
ShrineGeneral_RocketPunch_Damage = 3;
//The cooldown for after the rocket punch has been fired, as well as the timer
ShrineGeneral_RocketPunch_TimeToCoolDown = 20;
ShrineGeneral_RocketPunch_CooldownTimer = 0;

//------------Rapid Punch variables----------------//

//The states of the Rapid Punch
enum SHRINEGENERAL_RAPIDPUNCH_STATE
{
	WINDUP,
	FLURRY,
	FINISH,
	COOLDOWN
}

//Variables that tracks the state of the Rapid Punch
ShrineGeneral_RapidPunch_State = SHRINEGENERAL_RAPIDPUNCH_STATE.WINDUP;

//The time it takes to wind up the rapid punch
ShrineGeneral_RapidPunch_TimeToWindUp = 20;
//and the timer
ShrineGeneral_RapidPunch_WindUpTimer = 0;

//How long the rapid punches last
ShrineGeneral_RapidPunch_FlurryLength = 50;
//and the timer
ShrineGeneral_RapidPunch_FlurryTimer = 0;

//How long the finishing blow stays in place
ShrineGeneral_RapidPunch_FinishHangTime = 20;
//and the timer
ShrineGeneral_RapidPunch_FinishTimer = 0;

//How long it takes for the rapid punch state to revert to the Idle state
ShrineGeneral_RapidPunch_TimeToCooldown = 30;
//and the timer
ShrineGeneral_RapidPunch_CooldownTimer = 0;

//How much damage the flurry of punches do
ShrineGeneral_RapidPunch_FlurryDamage = 0.1;
//How much the finishing blow does
ShrineGeneral_RapidPunch_FinishDamage = 2;

//How often the punches are sent out
ShrineGeneral_RapidPunch_FlurryRate = 2;
//and the timer
ShrineGeneral_RapidPunch_FlurryCounter = 0;

//the function that creates the rapid punches
ShrineGeneral_RapidPunch_FlurryCreate = function()
{
	//create and access a Rapid Punch
	with(instance_create_depth(x, y, depth + choose(1, -1), obj_ShrineGeneral_RapidPunch))
	{
		
		image_xscale = other.image_xscale;
		switch(depth)
		{
			case other.depth + 1:
				sprite_index = spr_ShrineGeneral_RightArm_RapidPunchFlurry_PhaseOne;
				break;
			
			case other.depth - 1:
				sprite_index = spr_ShrineGeneral_LeftArm_RapidPunchFlurry_PhaseOne;
				break;
				
		}
		
		
	}//end create and access Rapid Punch
	
}//end ShrineGeneral_RapidPunch_FlurryCreate()

ShrineGeneral_RapidPunch_CreateTimer = time_source_create(time_source_game, ShrineGeneral_RapidPunch_FlurryRate, time_source_units_seconds, ShrineGeneral_RapidPunch_FlurryCreate, [], -1);



