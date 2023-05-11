// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hurt(){

	hascontrol = false;
	image_speed = 0;
	sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.DAMAGED];
	mask_index = spr_PlayerIdle;
	image_alpha = Wave(0, 1, 0.1, 1);
	
	DamagedTimer++;
	
	if (ySpeed > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}

	if (instance_exists(AttackerID))
	{
		
	
		var _launchSpeed = 2;
	
		if (!Invincible)
		{
			ySpeed = -2 * _launchSpeed;
			Invincible = true;
			xSpeed = sign(x - AttackerID.x) * _launchSpeed;
		}
		else
		{
			xSpeed = Approach(sign(x - AttackerID.x) * _launchSpeed, 0, 0.1);
		}
	
	//	show_debug_message(xSpeed);
		
		Wall_StopRun();
		
		x += xSpeed;
	
		//If the player was in the Swim State
		if (FreeState == FREE.WATER)
		{
			//If the player is no longer in the water
			if (!place_meeting(x, y + ySpeed - (sign(ySpeed)), obj_WallPlatform))
			{
				Gravity = Gravity_Normal;
			}
		}
		
	
	}//end if AttackerID exists

	if (place_meeting(x, y + ySpeed + sign(ySpeed), obj_WallPlatform) || DamagedTimer > 20)
	{
		hascontrol = true;
		AttackState = ATTACK.FREE;
		DamagedTimer = 0;
		if (!alarm[0])
		{
			alarm[0] = InvincCoolDown;
		}
	}
	
	

}//end PlayerState_Hurt()