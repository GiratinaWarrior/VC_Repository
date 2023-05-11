/// @description If the Player is dumb and takes a swim in Acid

//With the Player
with (obj_NewPlayer)
{
	//Check if the player is in water
	if (FreeState == FREE.WATER)
	{
		//Lets make the poison bubbles
		var PoisonCloud = part_system_create(ps_PoisonDamage);
		part_system_position(PoisonCloud, x, y);
		
		//activate the alarm that does damage;
		with(other)
		{
			if (!alarm[0])
			{
				alarm[0] = 5;
			}
		}
	
	}//if in Water

}