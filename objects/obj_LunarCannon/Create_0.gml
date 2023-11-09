/// @description Set the Damage
PhaseThrough = true;
ScreenShake(10, 10);
LunarCannon_Fading = false;

var _func = function()
{
	Damage = 0;
	LunarCannon_Fading = true;
	time_source_destroy();
	LunarCannon_TimeSource = noone;
}

LunarCannon_TimeSource = TimeSourceCreateAndStart(60 * 0.75, _func);