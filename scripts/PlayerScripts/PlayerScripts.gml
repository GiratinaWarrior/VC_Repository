
//function for the players movement and jumping
function PlayerMovement(){
	
	xSpeed = PlayerSpeed * move; //Change the horizontal movement according to the players input

	//If the player enters the jump key
	if (key_jump)
	{
		
		//If the player is allowed to jump
		if (PlayerJump > 0)
		{
			ySpeed = -JumpPower; //Jump
			PlayerJump = 0; //Reset the coyote jump timer
			audio_play_sound(sound_Jump, 5, false, 0);
		}//end player can jump
		
		//If the player is underwater, simply move them upwards
		else if (PlayerNeutralState == PLAYERSTATE_NEUTRAL.WATER)
		{
			//ySpeed = -JumpPower / SwimPower;
		}//end if underwater
	
	
	}//end jump key pressed
	
}

//function for the sound of the players footsteps
function PlayerFootsteps()
{
	
	audio_play_sound(choose(sound_Footstep1, sound_Footstep2, sound_Footstep3, sound_Footstep4), 50, false, 1.5);
}

//function for the players basic sword attack
/// @description PlayerState_SeleneSword(sprite, hitbox, direction)
/// @arg sprite
/// @arg hitbox
/// @arg direction
function PlayerState_SeleneSword(argument0, argument1, argument2){

	var _attacksprite = argument0;
	var _attackhitbox = argument1;
	var _attackdir = argument2;
	
	var _newHitBox = noone;

	if (sprite_index != _attacksprite)
	{
		sprite_index = _attacksprite;
		image_index = 0;
		image_speed = 1;
		var SwordSFX = choose(sound_SwordAttack,sound_SwordAttack2, sound_SwordAttack3, sound_SwordAttack4);
		audio_sound_gain(SwordSFX, 0.25, 0);
		audio_play_sound(SwordSFX, 5, false);
		
		var _offsetmax = 48;
	
		if (_attackhitbox == spr_Hitbox_PlayerSword_V)
		{
			var _offsety = _offsetmax *_attackdir;
			var _offsetx = 0;
		}
		else
		{
			var _offsetx = _offsetmax * _attackdir;
			var _offsety = 0;
		}

		_SeleneSwordHitboxsprite = _attackhitbox;
		
		_newHitBox = instance_create_layer(x + _offsetx + xSpeed, y + _offsety + ySpeed, layer, obj_PlayerSwordHitbox);
		
		_newHitBox.sprite_index = _SeleneSwordHitboxsprite;
		
		
	}

	//Check if the hitbox still exists
	if (instance_exists(_newHitBox))
	{
		_newHitBox.x = x + _offsetx + xSpeed;
		_newHitBox.y = y + _offsety + ySpeed;
		
		//Check if the hitbox hit something
		if (_newHitBox.HitSomething)
		{
			//If the player attacked down, do a pogo jump
			if (sprite_index == spr_PlayerAirJumpDown_SeleneSword)
			{
				ySpeed = -JumpPower * 1;
			}//end pogo jump
			
			//If the player attack up, make the vertical speed zero
			else if (sprite_index == spr_PlayerAirJumpUp_SeleneSword)
			{
				ySpeed = 0;
			}//end stop jump
			
		}//end if hit something
		
		
		
	}//end hitbox exists

	if (ySpeed >= 0)
	{ 	
		Gravity_Normal = Gravity_Fall;
	} 
	else 
	{
		Gravity_Normal = Gravity_Jump;
		if (!key_jump)
		{
			//ySpeed = 0;
		}
	}
	
	if (animation_end())
	{
		PlayerState = PLAYERSTATE.NEUTRAL;
	}
	

}
	
//function for the players lunar cannon, shot out in front of it
function PlayerState_LunarCannon(){
	
		xSpeed = 0;
		
		//The function for creating the Lunar Cannon
		var _fmoon = function()
		{
			//Check if the user has enough vallen to unleash the Lunar Cannon
			if (LunarCannon_VallenUse <= global.Vallen)
			{
				audio_play_sound(sound_MoonShoot, 5, false);
				var MagicAttack = instance_create_layer(x, y - 1, layer, obj_LunarCannon);
				MagicAttack.speed = 7;
				LunarCannonCooldown = LunarCannonCooldownMax;
			
				//switch-case for the players direction
				switch(obj_Player.image_xscale){
					
					case 1:
						MagicAttack.direction = 0;
						break;
			
					case -1:
						MagicAttack.direction = 180;
						break;
		
				}//end player direction switch case
				PlayerDepleteVallen(LunarCannon_VallenUse);
			}//end if user has enough vallen
			
			else
			{
			
			}
			
		}//end _fmoon function
	
		image_speed = 1;
		
		if (sprite_index != spr_RoseLunarCannon)
		{
			image_index = 0;
			sprite_index = spr_RoseLunarCannon;
		}
	
	
		if (image_index > 3 && LunarCannon_VallenUse <= global.Vallen)
		{
			var _knockdir;
			if (image_xscale == 1) _knockdir = 180;
			else _knockdir = 0;
			Knockback(13, _knockdir);
		}
	
		if (animation_end()) 
		{
			_fmoon();
			xSpeed = 0;
			PlayerState = PLAYERSTATE.NEUTRAL;
		}

}
	
//function for the players crescent blitz, their dash in the 8 cardinal directions
function PlayerState_CrescentBlitz(){

	if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);

	xSpeed = lengthdir_x(CrescentBlitz_Speed, CrescentBlitz_Direction);
	ySpeed = lengthdir_y(CrescentBlitz_Speed, CrescentBlitz_Direction);
	
	SpeedTrail(c_black);
	
	Wall_StopRun();
	Wall_FallOn();
	
	x += xSpeed;
	y += ySpeed;
	
	CrescentBlitz_Duration -= CrescentBlitz_Speed;
	
	if (CrescentBlitz_Duration < 0)
	{
		//xSpeed = 0;
		ySpeed = 0;
		PlayerState = PLAYERSTATE.NEUTRAL;
		image_alpha = 1;
	}
	else
	{
		image_alpha = 0;
	}
	
}
	
//function for the players cling to hope, or their wall run
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
				
				if !(place_meeting(x + 1, y + ySpeed, obj_Wall) || place_meeting(x - 1, y + ySpeed, obj_Wall))
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
		
//function for the players night night, or their healing technique
function PlayerState_NightNight(){

	if (global.Health < global.MaxHealth && NightNight_VallenUse <= global.Vallen)
	{
		
		if (sprite_index != spr_PlayerNightNight_Close && !NightNight_Started)
		{
			xSpeed = 0;
			image_index = 0;
			image_speed = 1;
			sprite_index = spr_PlayerNightNight_Close;
			NightNight_Started = true;
		}
		
		if (sprite_index == spr_PlayerNightNight_Close && image_index >= image_number - 1)
		{
			image_index = 0;
			sprite_index = spr_PlayerNightNight_Activate;
		}
		
		if (sprite_index == spr_PlayerNightNight_Activate && image_index >= image_number - 1)
		{
			image_index = 0;
			PlayerHeal(4);
			PlayerDepleteVallen(4);
			audio_play_sound(sound_Heal, 300, false, 1);
			sprite_index = spr_PlayerNightNight_Open;
		}
		
		if (sprite_index == spr_PlayerNightNight_Open)
		{
			PlayerState = PLAYERSTATE.NEUTRAL;
		}
		
	}//end if Health is less than Max Health

}//end PlayerState_NightNight()

//function for the players hurt state
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
	
//function for the player after taking damage
function PlayerTakenDamage(){

	//show_debug_message(global.Immortal);
	if (other.Damage > 0)
	{
		//audio_play_sound(sound_PlayerDamage, 5, false);
	
		AttackerID = other.id;
	
		global.Health -= other.Damage;
	
		PlayerState = PLAYERSTATE.HURT;
	
		hascontrol = false;
	}

}

function PlayerHeal(_healAmount = global.MaxHealth - global.Health)
{
	if (global.Health + _healAmount < global.MaxHealth)
	{
		global.Health += _healAmount;	
	
	}
	else
	{
		global.Health = global.MaxHealth;
	}
}

function PlayerRestoreVallen(_restoreAmount = global.MaxVallen - global.Vallen)
{
	if (global.Vallen + _restoreAmount < global.MaxVallen)
	{
		global.Vallen += _restoreAmount;	
	
	}
	else
	{
		global.Vallen = global.MaxVallen;
	}
}
	
function PlayerDepleteVallen(_depleteAmount)
{
	global.Vallen -= _depleteAmount;
}

function PlayerFullHeal()
{
	global.Health = global.MaxHealth;
	global.Vallen = global.MaxVallen;
}