/// @description Fade Away after a certain distance


if (LunarCannon_Fading)
{
	image_alpha -= 0.075;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

var _func = function()
{
	Damage = 0;
	LunarCannon_Fading = true;
}

TimeSourceCreateAndStart(60 * 0.75, _func);





