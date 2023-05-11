/// @description Insert description here
// You can write your code in this editor
JumpTimer = 0;
JumpLimit = 100;
ChargeTimer = 0;
ChargeLimit = 50;

MantisSpeed = -1;

enum MASKMANTIS_STATE
{
	WALK,
	CHARGE,
	JUMP,
	FALL,
	KNOCKBACK
}

MantisState = MASKMANTIS_STATE.WALK;
