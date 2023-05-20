/// @description
//Access enemy

//Check if this enemy has already been hit
if (ds_list_find_index(hitBySeleneSword, other.id) == -1)
{

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
	
	with (obj_Player)
	{
		if (sprite_index == spr_PlayerAirJumpDown_SeleneSword)
		{
			ySpeed = -JumpPower * 2;
		}
		else if (sprite_index == spr_PlayerAirJumpUp_SeleneSword)
		{
			ySpeed = 0;
		}
	}

	//Add instance to the list of enemies hit
	ds_list_add(hitBySeleneSword, other.id);

}//end check if hit

//If the attack can't phase through enemies, destroy itself
if (!CanPhase_Enemy)
{
	instance_destroy();
}//end if can't phase through enemy