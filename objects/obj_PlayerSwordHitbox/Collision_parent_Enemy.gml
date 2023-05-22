/// @description

HitSomething = true;

//Access the enemy instance
with (other)
{
	//Decrease enemy health
	Health -= other.PlayerAttackDamage;
		
	//store the direction of the attack relative to the enemy
	HitFrom = point_direction(other.x, other.y, x, y);
	
	Attacked = true;
	if (!alarm[11])
	{

		alarm[11] = FlashLength;

	}
		
		
}//end access enemy

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
	instance_destroy();
}//end if can't phase through enemy