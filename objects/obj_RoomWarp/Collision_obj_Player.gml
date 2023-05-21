/// @description Insert description here
// You can write your code in this editor
with (obj_Player)
{
	if (hascontrol) 
	{
		hascontrol = false;
	}
	
	RoomIsCutscene = other.targetIsCutScene;
}
TransitionStart(target, ExitSequence, EnterSequence);
global.WarpTargetX = WarpX;
global.WarpTargetY = WarpY;