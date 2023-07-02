/// @description Set Up

Gravity = 0.5;

xSpeed = SoldierSpeed;
ySpeed = 0;

enum SHRINESOLDIER_STATE
{
	WALK,
	ATTACK,
	HURT,
	DEFEAT
}

SoldierState = SHRINESOLDIER_STATE.WALK;

PlayerInRange = 0;

ShrineSoldierAttackHitbox = noone;

TextBox_Text[0] = "";
TextBox_PageNumber = 0;
TextBox_UIPosition = TEXTBOX_POS.TOP;

Name = "Shrine Soldier";