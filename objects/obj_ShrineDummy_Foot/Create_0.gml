/// @description Set up the dummy
with (instance_create_depth(x, y, depth - 1, obj_ShrineDummy_Body))
{
	ShrineDummy_OriginBodyPart = other.id;
}
with (instance_create_depth(x, y, depth - 2, obj_ShrineDummy_Head))
{
	ShrineDummy_OriginBodyPart = other.id;
}

ShrineDummy_KnockbackForce = 5;

