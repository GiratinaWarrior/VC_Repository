/// @description Enemy Attack

with (other)
{
	if (!Indestructible)
	{
		Health -= other.Damage;
	}
}