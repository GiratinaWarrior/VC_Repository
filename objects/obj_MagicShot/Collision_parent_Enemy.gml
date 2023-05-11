/// @description If it hits the enemy stand user

with (other)
{
	Health -= other.Damage;
	HitFrom = other.direction;
	
	Attacked = true;
	if (!alarm[11])
	{

		alarm[11] = 60;

	}
	
}

instance_destroy();
