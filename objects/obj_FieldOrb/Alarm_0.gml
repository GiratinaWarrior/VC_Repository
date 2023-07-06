/// @description Return to Home Base
global.FieldOrb = 1;
global.OrbsCollected++;

with (obj_Player)
{
	hascontrol = true;
}

SlideTransition(TRANS_MODE.GOTO, Room_NoctisCity);
global.WarpTargetX = 904;
global.WarpTargetY = 228;
