/// @description

HitSomething = true;

with(obj_Player)
{
	//If the player attacked down, do a pogo jump
	if (sprite_index == spr_PlayerAirJumpDown_SeleneSword)
	{
		ySpeed = -JumpPower * 1;
	}//end pogo jump
			
	//If the player attack up, make the vertical speed zero
	else if (sprite_index == spr_PlayerAirJumpUp_SeleneSword)
	{
		ySpeed = 0;
	}//end stop jump
}

with (other)
{
	speed *= -1;
}