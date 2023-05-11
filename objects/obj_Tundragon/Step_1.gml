/// @description Death
if (Health <= 0)
{
	with(instance_create_layer(x, y, layer, obj_TundragonDead))
	{
	
	}
	
	instance_destroy();
}
