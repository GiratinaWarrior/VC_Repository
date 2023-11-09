/// @description Insert description here
// You can write your code in this editor

ySpeed = 3;

PoisonFlower_State = 0;
PoisonFlower_StateShoot = 0;

enum POISONFLOWER_STATE
{
	GROW,
	IDLE,
	SHOOT,
	DIE,
	WITHER
}

enum POISONFLOWER_STATE_SHOOT
{
	SQUISH,
	STRETCH,
	BULLET,
	RETURN
}

PoisonFlower_ShootTimerCooldown = 90;
PoisonFlower_ShootTimer = PoisonFlower_ShootTimerCooldown;

PoisonFlower_MaxSquish = 2;
PoisonFlower_SquishRate = 0.05;

PoisonFlower_FireRate = 5;
PoisonFlower_FireTimer = PoisonFlower_FireRate;

PoisonFlower_FireLength = 60;
PoisonFlower_FireLengthTimer = 0;

PoisonFlower_MaxLife = 400;
PoisonFlower_LifeCounter = 0;