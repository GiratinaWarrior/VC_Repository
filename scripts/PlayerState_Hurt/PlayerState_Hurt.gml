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

	Wall_FallOn();
	Wall_StopRun();

	var _inv;
	var _flinch;
	
	var _knockbackH;
	var _knockbackV;

	if (instance_exists(AttackerID))
	{
		
		if (object_get_parent(AttackerID.object_index) == parent_EnemyAttack)
		{
			_flinch = AttackerID.FlinchPower;
			_inv = AttackerID.InvincPower;
			_knockbackH = AttackerID.EnemyAttack_LaunchPower_H;
			_knockbackV = AttackerID.EnemyAttack_LaunchPower_V;
		}
		else
		{
			_flinch = 20;
			_inv = 20;
			_knockbackH = 2;
			_knockbackV = 5;
		}
		
		
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
			
			Knockback(2, _knockdir, 5);
			//ySpeed = -5;
			Invincible = true;
		}
		
		
		
		
	}//end if AttackerID exists
	
	else
	{
		_flinch = 20;
		_inv = 20;
	}
	
	InvincTimer = time_source_create(time_source_game, _inv, time_source_units_frames, _vulnerable);
	
	if (place_meeting(x, y + ySpeed, obj_Wall) || DamagedTimer++ > _flinch)
	{
		hascontrol = true;
		PlayerState = PLAYERSTATE.NEUTRAL;
		DamagedTimer = 0;
		time_source_start(InvincTimer);
		//show_debug_message("InvincibleLength: {0} \n FlinchLength: {1}", _inv, _flinch)
	}
	
	

}//end PlayerState_Hurt()