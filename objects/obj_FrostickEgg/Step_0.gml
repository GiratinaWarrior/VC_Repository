/// @description Exploding

if (EggSize > 0.7)
{
	instance_create_layer(x, y, "Frosticks", obj_SnowBall);
}

if (EggSize >= 1)
{
	//instance_create_layer(x, y, "Frosticks", obj_SnowBall);
	EggSize = 0.7;
	if (!alarm[0])
	{
		alarm[0] = 10;
	}
}

image_xscale = EggSize;
image_yscale = EggSize;

EggSize += EggSizeChange;

if (EggSize < 0)
{
	instance_destroy();
}
