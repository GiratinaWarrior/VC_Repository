/// @description
Gravity = 0;
xSpeed = 0;
ySpeed = 0;

Axeye_Dir = 1;

enum AXEYE_STATE
{
	IDLE,
	CHARGE,
	ATTACK,
	STUCK,
	HURT
}

Axeye_State = 0;

PlayerInRange = false;

//----------Idle State----------//

Axeye_Speed_IdleMain = 3;

Axeye_Speed_Idle_X = 0;
Axeye_Speed_Idle_Y = 0;

Axeye_Speed_Idle_TimerLimit = 60 * 2;
Axeye_Speed_Idle_Timer = Axeye_Speed_Idle_TimerLimit;

Axeye_Idle_TimerLimit = 30;
Axeye_Idle_Timer = Axeye_Idle_TimerLimit;


//--------Charge State----------//

Axeye_TargetAngle = 0;
Axeye_RotationMultiplier = 10;
Axeye_MaxAngle = 359 * Axeye_RotationMultiplier;
Axeye_RotateSpeed = 4 * Axeye_RotationMultiplier;
Axeye_ChargeSoundMax = 0.3;
Axeye_ChargeSound = Axeye_ChargeSoundMax;

//-------Attack State-----------//

Axeye_SpinDir = 1;
Axeye_SpinSpeed = 30;
Axeye_AttackDir = 0;

Axeye_AttackSpeed = 8;

//------Stuck State------------//
Axeye_UnstuckSpeed = -5;
Axeye_UnstuckRate = 0.1;
Axeye_UnstuckSpeedMax = 2;