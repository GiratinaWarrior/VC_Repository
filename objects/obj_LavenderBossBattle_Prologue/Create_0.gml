/// @description Insert description here
// You can write your code in this editor


enum LAVENDERBOSSBATTLE_PROLOGUE_STATE
{
	IDLE,
	BLOOD_PETALS,
	POISON_GARDEN,
	DIVINE_ARSENAL,
	ABYSSAL_SUICIDE
}
	
enum LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE
{
	FLOAT,
	DODGE
}
	
LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;

LavenderBossBattlePrologue_IdleState = LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.FLOAT;

LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.BLOOD_PETALS;

xSpeed = 0;
ySpeed = 0;
Gravity = 0;

LavenderBossBattlePrologue_StateChangeTimer = 0;
LavenderBossBattlePrologue_StateChangeTimerLimit = 100;

//----------------Idle State----------------//


LavenderBossBattlePrologue_Idle_Speed = 5// LavenderBossBattlePrologue_Idle_Dist/LavenderBossBattlePrologue_Idle_Time;

LavenderBossBattlePrologue_Idle_FloatTimer = 0;

LavenderBossBattlePrologue_Dodge_Chance = 0.4;
LavenderBossBattlePrologue_Dodge_Speed = 10;

LavenderBossBattlePrologue_InRangeSword = false;
