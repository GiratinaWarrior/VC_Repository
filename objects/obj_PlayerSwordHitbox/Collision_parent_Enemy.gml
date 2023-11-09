/// @description

HitSomething = true;

//Access the enemy
with (other)
{
	//If the sword has not recoverd the player yet
	if !(other.PlayerHealed)
	{
		//
		if (EnemyVallenDropChance > random_range(0, 1))
		{
			with (obj_Player)
			{
				PlayerRestoreVallen(other.EnemyVallenDropAmount);
			}
		}
		other.PlayerHealed = true;	
	}
}

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

//If the attack can't phase through enemies, destroy itself
if (!CanPhase_Enemy)
{
	alarm[0] = 3;
}//end if can't phase through enemy