if (global.JestDebut_Cutscene_Seen)
{
	instance_destroy();
}

eventFunc = function()
{
	if (!instance_exists(obj_JestDebut))
	{
		instance_create_layer(-64, 231, layer, obj_JestDebut);
	}	
}