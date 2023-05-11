/// @description If it hits the enemy
with (other)
{
	
	HitFrom = point_direction(other.x, other.y, x, y);
	
	Health -= other.Damage;
	//HitFrom = other.direction;
	
	Attacked = true;
	if (!alarm[11])
	{

		alarm[11] = FlashLength;

	}
	
}

if (!PhaseThrough)
{
	instance_destroy();
}