// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hurt(){

	hascontrol = false;
	image_speed = 0;
	sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.HURT];
	mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
	//image_alpha = Wave(0, 1, 0.1, 1);
	
	//Variable for returning to normal
	var _vulnerable = function()
	{
		Invincible = false;
		image_alpha = 1;
		PlayerState = PLAYERSTATE.NEUTRAL;
		DamagedTimer = 0;
	}

	//stop movement upon hitting a wall
	Wall_FallOn();
	Wall_StopRun();

	//variables for invincibility time and flinch
	var _inv;
	var _flinch;
	
	//variables for knockback distance
	var _knockbackH;
	var _knockbackV;
	
	//If the damage dealer is still around
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
		
		//If the player is not invincible anymore
		if (!Invincible)
		{	
			
			/////////Setting the knockback direction
			var _knockdir;
			
			if (AttackerID.x < x)
			{
				_knockdir = 0;
			}
			else
			{
				_knockdir = 180;
			}
			
			//Knock back the player
			Knockback(2, _knockdir, 5);
			
			//Make the user invincible
			Invincible = true;
			
			//play the sound effect
			audio_play_sound(sound_PlayerDamage, 10, false);
			
		}//end player not invincible
		
	}//end if AttackerID exists
	
	//if the damage dealer is not around, use default values
	else
	{
		_flinch = 20;
		_inv = 20;
	}
	
	//Set the player to become vulnerable again after a set amount of time
	InvincTimer = time_source_create(time_source_game, _inv, time_source_units_frames, _vulnerable);
	
	//If the player hits the ground or if theyve been flinched for long enough
	if (place_meeting(x, y + ySpeed, obj_Wall) || DamagedTimer++ > _flinch)
	{
		hascontrol = true;
		PlayerState = PLAYERSTATE.NEUTRAL;
		DamagedTimer = 0;
		time_source_start(InvincTimer);
		//show_debug_message("InvincibleLength: {0} \n FlinchLength: {1}", _inv, _flinch)
	}
	
	

}//end PlayerState_Hurt()