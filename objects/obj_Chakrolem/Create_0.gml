/// @description Insert description here
// You can write your code in this editor

Gravity = 0.5;
xSpeed = 0;
ySpeed = 0;

Chakrolem_ChaseSpeed = 9;

enum CHAKROLEM_STATE
{
	IDLE,
	NOTICE,
	CHASE,
	HURT,
	CHARGE,
	EXPLODE
}

Chakrolem_State = 0;

Chakrolem_Dir = 1;

PlayerInRange = false;

Chakrolem_Bomb = noone;

Chakrolem_SurpriseSeq = noone;