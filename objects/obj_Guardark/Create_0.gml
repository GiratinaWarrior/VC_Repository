/// @description the variables
Guardark_Speed = 2;

Gravity = 0.1;
xSpeed = Guardark_Speed;
ySpeed = 0;

Guardark_Dir = 1;

enum GUARDARK_STATE
{
	PATROL,
	SHOOT,
	HURT
}

Guardark_State = 0;

PlayerInRange = false;

Guardark_Shoot_Timer = 0;
Guardark_Shoot_Rate = 60;