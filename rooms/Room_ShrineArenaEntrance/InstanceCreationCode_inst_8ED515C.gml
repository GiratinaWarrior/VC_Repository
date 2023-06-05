eventFunc = function()
{
	if (!instance_exists(obj_JestDebut))
	{
		instance_create_layer(-64, 231, layer, obj_JestDebut)
	}
	instance_destroy();
}