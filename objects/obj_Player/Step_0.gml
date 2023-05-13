/// @description Stuff

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
		key_dash = keyboard_check(vk_shift);
		key_heal = keyboard_check(vk_numpad1);
		
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
			key_dash = 0;
			key_heal = 0;
	}

#endregion

#region Movement

ySpeed += Gravity; //Apply Gravity

xSpeed = PlayerSpeed * move; //Change the horizontal movement according to the players input

//Keep the players coyote timer above 0
if (PlayerJump <= 0)
{
	PlayerJump = 0;
}

//If the player enters the jump key
if (key_jump)
{
	//If the player is allowed to jump
	if (PlayerJump > 0)
	{
		ySpeed = -JumpPower; //Jump
		PlayerJump = 0; //Reset the coyote jump timer
	}//end player can jump
	
	//If the player is underwater, simply move them upwards
	else if (PlayerNeutralState == PLAYERSTATE_NEUTRAL.WATER)
	{
		ySpeed = -JumpPower / SwimPower;
	}//end if underwater
	
}//end jump key pressed

//If the player is on land and not in water
if (place_meeting(x, y + 1, obj_WallPlatform) && (!place_meeting(x, y, obj_WaterBody)))
{
	PlayerNeutralState = PLAYERSTATE_NEUTRAL.GROUND;
	PlayerJump = MaxCoyoteJump;
}		

//if the player is in water
else if (place_meeting(x, y, obj_WaterBody))
{
	PlayerNeutralState = PLAYERSTATE_NEUTRAL.WATER;
}
//if the player is not in water or land, they're in the air
else
{
	PlayerNeutralState = PLAYERSTATE_NEUTRAL.AIR;
	PlayerJump--;
}

//Collision with walls when falling and running
Wall_FallOn();
Wall_StopRun();


//Apply the speeds to the x and y coordinates
x += xSpeed;

y += ySpeed;

#endregion

#region State Machine

//The Player's state machine
switch(PlayerState)
{
	//If the player is not doing anything special today
	case PLAYERSTATE.NEUTRAL:
		if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);
		
		//The player's neutral state machine
		switch(PlayerNeutralState)
		{
			
			//If the player is on the ground
			case PLAYERSTATE_NEUTRAL.GROUND:
				
				#region Grounded State
				
				Gravity = Gravity_Normal; //Reset the Gravity
				
				image_speed = 1;
				
				PlayerJump = MaxCoyoteJump; //Reset the Coyote Time
				
				//If the player just landed on the ground, play the landing sound
				if (sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.JUMP]) {
					audio_play_sound(sound_Landing, 40, false);
				}//end landed
				
				//If the player is moving horizontally, play the running animation
				if (xSpeed != 0) sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.RUN];
				//If the player is not moving horizontally, play the idle animation
				else sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
				
				mask_index = sprite_index;
				
				#endregion
			
				break;//end player grounded
			
			//If the player is in the air
			case PLAYERSTATE_NEUTRAL.AIR:
				
				#region Jumping/Falling State

				Gravity = Gravity_Normal; //Set the gravity back to normal

				sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.JUMP]; //Set the sprite to jumping sprite

				image_speed = 0;
				
				//If the player is falling
				if (ySpeed > 0)
				{
					image_index = 1;
					Gravity_Normal = Gravity_Fall; //Set the gravity to the falling gravity
				}//end falling
				
				//If the player is jumping
				else
				{
					image_index = 0;
					Gravity_Normal = Gravity_Jump; //Set the gravity to the jumping gravity
					
					//If the player releases the jump button, reset the jump
					if (!key_jump)
					{
						ySpeed = 0;
					}//end varying jump height
					
				}//end jumping
				
				mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
				
				#endregion
					
				break;//end player airborne
				
			//If the player is submerged in water
			case PLAYERSTATE_NEUTRAL.WATER:
			
				break;//end player swimming
		}
		
		break;//end neutral state
		
	//When the player uses the Eclipse Blood Sword
	case PLAYERSTATE.SWORD:
		
		break;//end sword state
	
	//When the player uses Lunar Cannon
	case PLAYERSTATE.CANNON:
	
		break;//end Lunar Cannon
		
}//end PLayer State Machine

#endregion