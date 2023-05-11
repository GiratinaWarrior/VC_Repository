/// @description Return to Home Base
global.OceanOrb = 1;
global.OrbsCollected++;

with (obj_NewPlayer)
{
	hascontrol = true;
}

SlideTransition(TRANS_MODE.GOTO, Room_NoxCity);
global.WarpTargetX = 904;
global.WarpTargetY = 228;