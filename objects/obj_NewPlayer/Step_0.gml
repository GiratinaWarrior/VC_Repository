/// @description The Individual States

if (Invincible == true) {
	image_alpha = Wave(0, 1, 0.1, 1);
}

#region Collect player input

	//If the player has control over their own actions
	if (hascontrol == true) {

		//player inputs left, right, up, space
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"))
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));
		key_sword = mouse_check_button(mb_left);
		key_moon = keyboard_check(vk_space);
		
		move = key_right - key_left;

	}//end if player has control
	
	//if the player has control taken from them
	else if (hascontrol = false) {
			key_right = 0;
			key_left = 0;
			key_jump = 0;
			key_up = 0;
			key_crouch = 0;
			move = 0;
			key_sword = 0;
			key_moon = 0;
	}

#endregion

#region Movement

//Accelerate the player vertically
ySpeed += Gravity;

xSpeed = PlayerSpeed * move;

if (PlayerJump <= 0)
{
	PlayerJump = 0;
}

//show_debug_message(PlayerJump);

if (key_jump)
{
	if (PlayerJump > 0)
	{
		ySpeed = -JumpPower;
		PlayerJump = 0;
	}
	
	else if (FreeState == FREE.WATER)
	{
		ySpeed = -JumpPower / SwimPower;
	}
}

//If the player is on land and not in water
if (place_meeting(x, y + 1, obj_WallPlatform) && (!place_meeting(x, y, obj_WaterBody)))
{
	FreeState = FREE.LAND;
}		

//if the player is in water
else if (place_meeting(x, y, obj_WaterBody))
{
	FreeState = FREE.WATER;
}
//if the player is not in water or land, they're in the air
else
{
	FreeState = FREE.AIR;
	PlayerJump--;
}

//Collision with walls when falling and running
Wall_FallOn();
Wall_StopRun();

x += xSpeed;

y += ySpeed;

#endregion

#region States

	#region Transition between states

		firingdelay -= 1;
	
		if (key_sword)
		{
			instance_change(obj_Player, true);
			with (obj_Camera)
			{
				follow = obj_Player;
			}
		}

		else if (key_moon)
		{
			if (firingdelay < 0) AttackState = ATTACK.MOON;
		}

		if (AttackState != ATTACK.SWORD && AttackState != ATTACK.MOON && AttackState != ATTACK.HURT)
		{
			AttackState = ATTACK.FREE;
		}

	#endregion

	//The different states of attacking
	switch(AttackState)
	{
		//If the player is not attacking
		case ATTACK.FREE:
			if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);
			mask_index = sprite_index;
			
			switch(FreeState)
			{
				//If the player is on the ground
				case FREE.LAND:
				
					Gravity = Gravity_Normal;
					
					image_speed = 1;
					
					PlayerJump = MaxCoyoteJump;
					
					if (sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.JUMP]) {
						audio_play_sound(sound_Landing, 40, false);
					}	
					
					if (xSpeed != 0) sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.RUN];
					
					else sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.IDLE];
					
					mask_index = sprite_index;
					
					break;
				
				//If the player is in the air
				case FREE.AIR:
					Gravity = Gravity_Normal;
					sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.JUMP];
					image_speed = 0;
					
					//If the player is falling
					if (ySpeed > 0)
					{ 
						image_index = 1;
						Gravity_Normal = Gravity_Fall; //Give them a heavier gravity
					
					} 
					//If the player is jumping
					else 
					{
						image_index = 0;
						Gravity_Normal = Gravity_Jump; //Give them a lighter gravity						
						//If the player releases the jump button
						if (!key_jump)
						{
							ySpeed = 0;
						}
					}					
					
					break;
				
				
				//If the player is in the water
				case FREE.WATER:
					Gravity = Gravity_Swim;
					image_speed = 1;
					sprite_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.SWIM_H];
					ySpeed = lerp(ySpeed, 0, 0.1);
					if (key_crouch && !place_meeting(x, y + 1, obj_WallPlatform))
					{
						ySpeed = JumpPower / SwimPower;
					}
					//mask_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.IDLE];
					break;
			
			}
			break; //end not attacking
		
		//if the player is attacking with a sword
		case ATTACK.SWORD:
			if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);
		
			var _attacksprite;
			var _attackhitbox;
		
			//Determine the attack animation to use based on what the player was doing
			switch(FreeState)
			{
				//If they're on the ground
				case FREE.LAND:
					//If the player is idle
					if (xSpeed == 0)
					{
						_attacksprite = spr_PlayerAttack_Idle;
						_attackhitbox = spr_PlayerAttack_Idle_Hitbox;
					}
					//if the player is moving
					else
					{
						_attacksprite = spr_PlayerAttack_Run;
						_attackhitbox = spr_PlayerAttack_Run_Hitbox;
					}
					break;
			
				//If they're in the air
				case FREE.AIR:
				
					//If the player inputs the jump key
					if (key_up && move == 0)
					{
						_attacksprite = spr_PlayerAttack_Jump_AimUp;
						_attackhitbox = spr_PlayerAttack_Jump_AimUp_Hitbox;
					}//end jump key pressed
					
					//If the player inputs the down key
					else if (key_crouch)
					{
						_attacksprite = spr_PlayerAttack_Jump_AimDown;
						_attackhitbox = spr_PlayerAttack_Jump_AimDown_Hitbox;
					}//end down key pressed
					
					//If the player doesn't input a direction
					else
					{
						_attacksprite = spr_PlayerAttack_Jump_Neutral;
						_attackhitbox = spr_PlayerAttack_Jump_Neutral_Hitbox;
					}
					
					
					break;
		
				case FREE.WATER:
					_attacksprite = spr_PlayerAttack_Swim;
					_attackhitbox = spr_PlayerAttack_Swim_Hitbox;
					break;
		
			}
		
			PlayerState_Sword(_attacksprite, _attackhitbox);
		
			switch(FreeState)
			{
				//If the player is on the ground
				case FREE.LAND:
					Gravity = Gravity_Normal;
					PlayerJump = MaxCoyoteJump;
					break;
				
				//If the player is in the air
				case FREE.AIR:
					Gravity = Gravity_Normal;
					break;
				
				
				//If the player is in the water
				case FREE.WATER:
					Gravity = Gravity_Swim;
					ySpeed = lerp(ySpeed, 0, 0.1);
					if (key_crouch && !place_meeting(x, y + 1, obj_WallPlatform))
					{
						ySpeed = JumpPower / SwimPower;
					}
					break;
			
			}
		
			break;//end sword

		//if the player is attacking with the moon
		case ATTACK.MOON:
			PlayerState_Moon();
			break;//end moon
	
		//if the player has been attacked
		case ATTACK.HURT:
			x += xSpeed;
			PlayerState_Hurt();
			break;//end hurt
		
		
	}//end Attack States

#endregion
