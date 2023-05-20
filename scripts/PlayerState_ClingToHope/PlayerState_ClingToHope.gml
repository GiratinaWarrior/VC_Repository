// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_ClingToHope(){
	
	//sprite_index = spr_StarJumpParticles;
		
	switch(ClingToHope_State)
		{
			//if the player is in a wall climb
			case CLINGTOHOPE_STATE.CLIMB:
				
				Gravity = Gravity_Wall;
			
				image_speed = 1;
				
				var _ymove = key_down - key_up;
				
				ySpeed = PlayerSpeed * _ymove;
				
				if (_ymove != 0)
				{
					sprite_index = spr_PlayerClingToHope_Run;
					image_yscale = -_ymove;
				}
				else
				{
					sprite_index = spr_PlayerClingToHope_Idle;
				}
				
				ClingToHope_JumpMomentum = ClingToHope_MaxMomentum;
				
				if (key_wall)
				{
					image_yscale = 1;
					ClingToHope_State = CLINGTOHOPE_STATE.JUMP;
					xSpeed = -ClingToHope_Usable * ClingToHope_JumpPowerX;
					ySpeed = -ClingToHope_JumpPowerY;
				}
				
				if !(place_meeting(x + 1, y + ySpeed, obj_WallPlatform) || place_meeting(x - 1, y + ySpeed, obj_WallPlatform))
				{
					image_yscale = 1;
					PlayerState = PLAYERSTATE.NEUTRAL;
				}
				
				//mask_index = sprite_index;
			
				break;//end climb state
		
			//If the player is in a wall jump
			case CLINGTOHOPE_STATE.JUMP: 
				
				image_yscale = 1;
				
				image_speed = 0;
				
				sprite_index = spr_PlayerJump;
				
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