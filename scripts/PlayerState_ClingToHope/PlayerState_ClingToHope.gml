// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_ClingToHope(){
	
	Gravity = Gravity_Wall;
	
	ClingToHope_Usable = place_meeting(x + 1, y, obj_WallPlatform) - place_meeting(x - 1, y, obj_WallPlatform);
	
	var _ymove = key_down - key_up;

	sprite_index = spr_StarJumpParticles;

	if (key_wall)
	{
		ClingToHope_State = CLINGTOHOPE_STATE.JUMP;
	}
	
	else
	{
		ySpeed = _ymove * PlayerSpeed;
	}
	
	if !(ClingToHope_Usable)
	{
		PlayerState = PLAYERSTATE.NEUTRAL;
	}
	
	
	
}