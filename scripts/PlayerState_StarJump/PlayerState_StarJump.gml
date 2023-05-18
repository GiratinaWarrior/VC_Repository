// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_StarJump(){

	Trail(c_aqua, 0.5, 0.1);
	
	if (ySpeed > 0)
	{
		PlayerState = PLAYERSTATE.NEUTRAL;
	}

}