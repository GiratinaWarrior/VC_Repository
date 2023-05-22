/// @description Set Up

Gravity = 0.5;

SoldierSpeed = 1;

xSpeed = SoldierSpeed;
ySpeed = 0;

enum SHRINESOLDIER_STATE
{
	WALK,
	ATTACK,
	HURT
}

SoldierState = SHRINESOLDIER_STATE.WALK;

PlayerInRange = 0;