/// @description Insert description here
// You can write your code in this editor

enum LAVENDERBOSSBATTLE_PROLOGUE_STATE
{
	IDLE,
	BLOOD_PETALS,
	POISON_GARDEN,
	DIVINE_ARSENAL,
}
	
enum LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE
{
	FLOAT,
	DODGE
}
	
layer_create(depth + 2, "DivineArsenal");
layer_create(depth - 2, "BloodPetal");
layer_create(depth - 1, "PoisonGarden");
	
LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;

LavenderBossBattlePrologue_IdleState = LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.FLOAT;

LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.BLOOD_PETALS;

xSpeed = 0;
ySpeed = 0;
Gravity = 0;

LavenderBossBattlePrologue_StateChangeTimer = 0;
LavenderBossBattlePrologue_StateChangeTimerLimit = 200;

//----------------Idle State----------------//

LavenderBossBattlePrologue_Idle_Speed = 5// LavenderBossBattlePrologue_Idle_Dist/LavenderBossBattlePrologue_Idle_Time;

LavenderBossBattlePrologue_Idle_FloatTimer = 0;

LavenderBossBattlePrologue_Dodge_Rate = 5;
LavenderBossBattlePrologue_Dodge_Cooldown = LavenderBossBattlePrologue_Dodge_Rate;

LavenderBossBattlePrologue_Dodge_Speed = 20;
LavenderBossBattlePrologue_Dodge_Dir = 1;

LavenderBossBattlePrologue_InRangeSword = false;

//--------------Blood Petals----------------//

//the flash signaling the blood petals
LavenderBossBattlePrologue_BloodPetals_Particle = noone;
LavenderBossBattlePrologue_BloodPetals_ParticleCreated = false;
//LavenderBossBattlePrologue_BloodPetals_ParticleInfo  = particle_get_info(ps_Lavender_BloodPetals);

LavenderBossBattlePrologue_PetalRate = 15;
LavenderBossBattlePrologue_PetalTimer = 0;

LavenderBossBattlePrologue_MaxPetalTimer = 0;
LavenderBossBattlePrologue_MaxPetalTimerLimit = 300;

//-------------Poison Garden------------------//

LavenderBossBattlePrologue_NumberOfPoison = 5;
LavenderBossBattlePrologue_SeedsMade = 0;

LavenderBossBattlePrologue_MaxPoison = 7;
LavenderBossBattlePrologue_MinPoison = 3;

LavenderBossBattlePrologue_SeedFireRate = 0;
LavenderBossBattlePrologue_SeedCooldown = LavenderBossBattlePrologue_SeedFireRate;
LavenderBossBattlePrologue_SeedsPlanted = false;

//-------------Divine Arsenal-----------------//

LavenderBossBattlePrologue_PortalCreated = false;
LavenderBossBattlePrologue_Portal = noone;

LavenderBossBattlePrologue_DivineArsenal_StateTimer = 0;
LavenderBossBattlePrologue_DivineArsenal_StateTimerLimit = 400;






