/// @description Attack collides with enemy

//Access enemy
with (other)
{
	//Decrease enemy health
	Health -= other.PlayerAttackDamage;
	
	//store the direction of the attack relative to the enemy
	HitFrom = point_direction(other.x, other.y, x, y);
	
	//If the attack can't phase through enemies, destroy itself
	if (!CanPhase_Enemy)
	{
		instance_destroy();
	}//end if can't phase through enemy
	
	Attacked = true;
	if (!alarm[11])
	{

		alarm[11] = FlashLength;

	}
	
}//end access enemy