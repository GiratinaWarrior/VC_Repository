/// @description Fade Away after a certain distance


if (LunarCannon_Fading)
{
	FadeAndDestroy(0.075);
}

var _func = function()
{
	Damage = 0;
	LunarCannon_Fading = true;
}

TimeSourceCreateAndStart(60 * 0.75, _func);





