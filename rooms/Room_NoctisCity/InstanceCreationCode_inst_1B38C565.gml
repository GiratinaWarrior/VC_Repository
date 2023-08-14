eventFunc = function()
{
	instance_create_layer(x, y, layer, obj_CardinalNoctisCongrats);
}

if (global.CardinalNoctisCongrats_Cutscene_Seen)
{
	instance_destroy();
}
