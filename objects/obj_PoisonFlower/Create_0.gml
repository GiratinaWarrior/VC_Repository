/// @description Insert description here
// You can write your code in this editor

PoisonFlower_State = 0;
PoisonFlower_StateShoot = 0;

enum POISONFLOWER_STATE
{
	GROW,
	IDLE,
	SHOOT,
	DIE
}

enum POISONFLOWER_STATE_SHOOT
{
	SQUISH,
	STRETCH,
	BULLET,
	RETURN
}

PoisonFlower_ShootTimerCooldown = 60;
PoisonFlower_ShootTimer = PoisonFlower_ShootTimerCooldown;

PoisonFlower_MaxSquish = 1.5;
PoisonFlower_SquishRate = 0.05;

PoisonFlower_FireRate = 10;
PoisonFlower_FireTimer = PoisonFlower_FireRate;