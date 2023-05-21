// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hurt(){

	hascontrol = false;
	image_speed = 0;
	sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.HURT];
	mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
	//image_alpha = Wave(0, 1, 0.1, 1);
	
	var _vulnerable = function()
	{
		Invincible = false;
		image_alpha = 1;
		PlayerState = PLAYERSTATE.NEUTRAL;
		DamagedTimer = 0;
	}
	
	InvincTimer = time_source_create(time_source_game, 100, time_source_units_frames, _vulnerable);
	
	DamagedTimer++;

	Wall_FallOn();
	Wall_StopRun();

	if (instance_exists(AttackerID))
	{
		
		if (!Invincible)
		{	
			
			var _knockdir;
			
			if (AttackerID.x < x)
			{
				_knockdir = 0;
			}
			else
			{
				_knockdir = 180;
			}
			
			Knockback(2, _knockdir, 0);
			ySpeed = -5;
			Invincible = true;
		}
	
	}//end if AttackerID exists
	
	if (place_meeting(x, y + ySpeed, obj_WallPlatform) || DamagedTimer > 20)
	{
		hascontrol = true;
		PlayerState = PLAYERSTATE.NEUTRAL;
		DamagedTimer = 0;
		time_source_start(InvincTimer);
	}
	
	

}//end PlayerState_Hurt()