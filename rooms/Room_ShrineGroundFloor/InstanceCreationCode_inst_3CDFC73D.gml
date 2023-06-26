if (global.CardinalCongratulation_Family)
{
	instance_destroy();
}
else
{
	eventFunc = function()
	{
		instance_create_layer(480, 270, layer, obj_CardinalFamilyCongratsCutscene);
	}
}