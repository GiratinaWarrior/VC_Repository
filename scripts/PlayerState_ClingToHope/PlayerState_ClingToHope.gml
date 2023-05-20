// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_ClingToHope(){
	
	sprite_index = spr_StarJumpParticles;
		
	switch(ClingToHope_State)
		{
			//if the player is in a wall climb
			case CLINGTOHOPE_STATE.CLIMB:
			
				Gravity = Gravity_Wall;
			
				var _ymove = key_down - key_up;
				
				ySpeed = PlayerSpeed * _ymove;
				
				ClingToHope_JumpMomentum = ClingToHope_MaxMomentum;
				
				if (key_wall)
				{
					ClingToHope_State = CLINGTOHOPE_STATE.JUMP;
					xSpeed = -ClingToHope_Usable * ClingToHope_JumpPowerX;
					ySpeed = -ClingToHope_JumpPowerY;
				}
				
				if !(place_meeting(x + 1, y + ySpeed, obj_WallPlatform) || place_meeting(x - 1, y + ySpeed, obj_WallPlatform))
				{
					PlayerState = PLAYERSTATE.NEUTRAL;
				}
				
				//StarJump_Usable = true;
				
				//CrescentBlitz_Usable = true;
			
				break;//end climb state
		
			//If the player is in a wall jump
			case CLINGTOHOPE_STATE.JUMP: 
				
				Gravity = Gravity_Normal;
				
				ySpeed += Gravity;
				
				if (sign(xSpeed) != 0)
				{
					image_xscale = sign(xSpeed);
				}
				
				ClingToHope_JumpMomentum--;
				
				if (ClingToHope_JumpMomentum < 0)
				{
					PlayerState = PLAYERSTATE.NEUTRAL;
				}
					
				break;//end jump state
		
		}
	
}