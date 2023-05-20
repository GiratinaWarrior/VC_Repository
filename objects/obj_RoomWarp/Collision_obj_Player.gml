/// @description Insert description here
// You can write your code in this editor
with (obj_Player)
{
	if (hascontrol) 
	{
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
		global.WarpTargetX = other.WarpX;
		global.WarpTargetY = other.WarpY;
	}
	
	RoomIsCutscene = other.targetIsCutScene;
}
