/// @description Stuff

global.Health = clamp(global.Health, 0, global.MaxHealth);

global.Vallen = clamp(global.Vallen, 0, global.MaxVallen);

global.Vallen = round(global.Vallen);

x = round(x);
y = round(y);

ySpeed = clamp(ySpeed, -ySpeed_Max, ySpeed_Max);


if (Invincible == true) {
	image_alpha = Wave(0, 1, 0.1, 1);
}

#region Collect player input

	//If the player has control over their own actions
	if (hascontrol == true) {

		//player input controls
		key_left = global.Key_Left;
		key_right = global.Key_Right;
		key_up = global.Key_Up;
		key_down = global.Key_Down;
		key_jump = global.Key_Jump;
		key_starjump = global.Key_Starjump;
		key_wall = global.Key_Wall;
		key_sword = global.Key_Sword;
		key_moon = global.Key_Cannon;
		key_dash = global.Key_Dash;
		key_heal = global.Key_Heal;
		
		move = key_right - key_left;
		
		/*
		if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
		{
			key_left = -sign(min(gamepad_axis_value(0, gp_axislh),0));
			key_right = sign(max(gamepad_axis_value(0, gp_axislh), 0));
			move = key_right - key_left;//move = sign(gamepad_axis_value(0, gp_axislh));			
			global.UsingController = 1;
		}
		
		if (abs(gamepad_axis_value(0, gp_axislv)) > 0.2)
		{
			key_up = -sign(min(gamepad_axis_value(0, gp_axislv),0));
			key_down =  sign(max(gamepad_axis_value(0, gp_axislv),0));
			global.UsingController = 1;
		}
		*/
		
		
		
	
	}//end if player has control
	
	//if the player has control taken from them
	else if (hascontrol = false) {
			key_right = 0;
			key_left = 0;
			key_jump = 0;
			key_starjump = 0;
			key_wall = 0;
			key_up = 0;
			key_down = 0;
			move = 0;
			key_sword = 0;
			key_moon = 0;
			key_dash = 0;
			key_heal = 0;
			
	}

#endregion

#region Movement

ySpeed += Gravity; //Apply Gravity

//Keep the players coyote timer above 0
if (PlayerJump <= 0)
{
	PlayerJump = 0;
}

//If the player is on land and not in water
if !place_meeting(x, y, obj_WaterBody) && place_meeting(x, y + 1, obj_Wall)
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

#region State Transitions

LunarCannonCooldown--;

//If the player attacks with the Eclipse Blade
if (key_sword)
{
	if (global.AbilityUnlocked_SeleneSword) 
	{
		PlayerState = PLAYERSTATE.SWORD;
	}
}
//If the player attacks with Lunar Cannon
else if (key_moon)
{
	if (LunarCannonCooldown < 0 && global.AbilityUnlocked_LunarCannon) 
	{
		PlayerState = PLAYERSTATE.CANNON;
	}
}
//If the player uses Crescent Blitz
else if (key_dash)
{
	//If the dash is usable
	if (global.AbilityUnlocked_CrescentBlitz && CrescentBlitz_Usable) 
	{
		PlayerJump = 0;
		CrescentBlitz_Usable = false;
		CrescentBlitz_Direction = point_direction(0, 0, move, key_down - key_up);
		CrescentBlitz_Speed = CrescentBlitz_MaxDistance/CrescentBlitz_MaxTime;
		CrescentBlitz_Duration = CrescentBlitz_MaxDistance;
		
		if !(CrescentBlitz_Direction == 0 && move == 0) PlayerState = PLAYERSTATE.AIRDASH;
		
	}//end dash usable
}

else if (key_heal)
{
	if (global.Vallen >= NightNight_VallenUse) PlayerState = PLAYERSTATE.HEAL;
}

if (PlayerState != PLAYERSTATE.WALL)
{
	image_yscale = 1;
}

#endregion

#region State Machine

//The Player's state machine
switch(PlayerState)
{
	//If the player is not doing anything special today
	case PLAYERSTATE.NEUTRAL:
	
		#region Neutral State
	
		image_alpha = 1;
	
		if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);
		
		PlayerMovement();
		
		NightNight_Started = false;
		
		
		if (global.AbilityUnlocked_ClingToHope)
		{
			ClingToHope_Usable = place_meeting(x + 1, y, obj_Wall) - place_meeting(x - 1, y, obj_Wall);
		}
		
		else
		{
			ClingToHope_Usable = 0;
		}
		
		//The player's neutral state machine
		switch(PlayerNeutralState)
		{
			
			//If the player is on the ground
			case PLAYERSTATE_NEUTRAL.GROUND:
				
				#region Grounded State
				
				Gravity = Gravity_Normal; //Reset the Gravity
				
				image_speed = 1;
				
				PlayerJump = MaxCoyoteJump; //Reset the Coyote Time
				
				StarJump_Usable = true;
				
				CrescentBlitz_Usable = true;
				
				//If the player just landed on the ground, play the landing sound
				if (sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.JUMP]) {
					audio_play_sound(sound_Landing, 100, false, 1);
					for (var i = 0; i < 5; i++)
					{
						with (instance_create_depth(x + (random_range(-1, 1) * 5), y + 15, depth + 1, obj_PlayerMoveParticles))
						{
							image_alpha = 0.7;
							ySpeed = -random_range(0.3, 2);
							Gravity = -0.2;
							xSpeed = choose(-1, 1) * 2;
							sprite_index = spr_PlayerMoveParticle;
							PlayerMoveParticle_FadeRate = random_range(0.01, 0.05);
							PlayerMoveParticle_ShrinkRate = 0.05;
						}
					}
				}//end landed
				
				//If the player is moving horizontally, play the running animation
				if (xSpeed != 0) 
				{
					
					time_source_start(RunDustEffect_TimeSource);
					
					sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.RUN];
					
					if (animation_end(sprite_index))
					{
						PlayerFootsteps();
					}
				}
				
				//If the player is not moving horizontally, play the idle animation
				else 
				{
					sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
					time_source_pause(RunDustEffect_TimeSource)
				}
				
				mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
				
				#endregion
			
				break;//end player grounded
			
			//If the player is in the air
			case PLAYERSTATE_NEUTRAL.AIR:
				
				#region Jumping/Falling State

				time_source_pause(RunDustEffect_TimeSource);

				Gravity = Gravity_Normal; //Set the gravity back to normal

				sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.JUMP]; //Set the sprite to jumping sprite

				image_speed = 0;
				
				//If the player is falling
				if (ySpeed >= 0)
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
				
				//If the player can use Star Jump
				if (global.AbilityUnlocked_StarJump) && (StarJump_Usable)
				{
					//if the player presses the star jump button
					if (key_starjump) && (global.AbilityUnlocked_StarJump)
					{
						ySpeed = -StarJump_Power;
						StarJump_Usable = false;
					}
				}
				
				else if (global.AbilityUnlocked_StarJump) && (ySpeed < 0)
				{
					//SpeedTrail(c_ltgrey);
					ParticleTrail(spr_StarJumpParticles);
					image_alpha = 0;
				}
				else if (global.AbilityUnlocked_StarJump)
				{
					image_alpha = 1;
				}
				
				
				if (global.AbilityUnlocked_ClingToHope) && (ClingToHope_Usable != 0)
				{
					if (key_wall)
					{
						PlayerState = PLAYERSTATE.WALL;
						ClingToHope_State = CLINGTOHOPE_STATE.CLIMB;
					}
					
				}
				
				#endregion
					
				break;//end player airborne
				
			//If the player is submerged in water
			case PLAYERSTATE_NEUTRAL.WATER:
			
				#region Swimming State
			
				time_source_pause(RunDustEffect_TimeSource);
				
				Gravity = Gravity_Swim;
				
				image_speed = 1;
				
				ySpeed = lerp(ySpeed, 0, 0.1);
				
				if (key_down && !place_meeting(x, y + 1, obj_Wall))
				{
						ySpeed = JumpPower / SwimPower;
				}
				
				if (key_up)
				{
					ySpeed = -JumpPower / SwimPower;
				}
				
				if (ySpeed < 0)
				{
					sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.SWIM_V];
				}
				else
				{
					sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.SWIM_H];
				}
					
				mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
					
				#endregion
				
				break;//end player swimming
		}
			
		#endregion
		
		break;//end neutral state
		
	//When the player uses the Selene Sword
	case PLAYERSTATE.SWORD:
		
		#region Selene Sword State
		
		image_alpha = 1;
		
		image_speed = 1;
		
		if (sign(xSpeed) != 0) image_xscale = sign(xSpeed);	
		
		PlayerMovement();
		
		var _attacksprite;
		var _attackhitbox;
		var _attackdir;
		
		//Check what kind of attack is used based on what state the player was in
			//Set the appropriate sprite and hitbox, as well as direction for the hitbox to spawn
		switch(PlayerNeutralState)
		{
			//If the player is in the air
			case PLAYERSTATE_NEUTRAL.AIR:
				
				#region Aerial Attack Set Up
				
					//If the player aims up
					if (key_up && !key_down)
					{
						_attacksprite = spr_PlayerAirJumpUp_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_V;
						_attackdir = SWORD_V_DIR.UP;
					}//end aim up
				
					//If the player aims down
					else if (key_down && !key_up)
					{
						_attacksprite = spr_PlayerAirJumpDown_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_V;
						_attackdir = SWORD_V_DIR.DOWN;
					}//end aim down
				
					//If the player aims forward
					else
					{
						//If the player is falling
						if (ySpeed > 0)
						{
							_attacksprite = spr_PlayerAirFallNeutral_SeleneSword;
							_attackhitbox = spr_Hitbox_PlayerSword_H;
							_attackdir = image_xscale;
						}//end falling
					
						//If the player is jumping
						else
						{
							_attacksprite = spr_PlayerAirJumpNeutral_SeleneSword;
							_attackhitbox = spr_Hitbox_PlayerSword_H;
							_attackdir = image_xscale;
						}//end jumping
					
					}//end aim forward
				
				#endregion
				
				break; //end air
			
			//If the player is on the ground
			case PLAYERSTATE_NEUTRAL.GROUND:
				
				#region Grounded Attack Set Up
					
					//If the player is not moving
					if (xSpeed == 0)
					{
						_attacksprite = spr_PlayerIdle_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_H;
						_attackdir = image_xscale;
					}//end idle
					
					//If the player is running
					else
					{
						_attacksprite = spr_PlayerRun_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_H;
						_attackdir = image_xscale;
					}//end running
				
				#endregion
			
				break; //end ground
			
			//If the player is underwater
			case PLAYERSTATE_NEUTRAL.WATER:
				
				#region Marine Attack Set Up
				
					//If the player aims up
					if (key_up && !key_down)
					{
						_attacksprite = spr_PlayerSwimUp_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_V;
						_attackdir = SWORD_V_DIR.UP;
					}//end aim up
				
					//If the player aims down
					else if (key_down && !key_up)
					{
						_attacksprite = spr_PlayerSwimDown_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_V;
						_attackdir = SWORD_V_DIR.DOWN;
					}//end aim down
				
					//If the player aims forward
					else
					{
						_attacksprite = spr_PlayerSwimNeutral_SeleneSword;
						_attackhitbox = spr_Hitbox_PlayerSword_H;
						_attackdir = image_xscale;
					}//end aim forward
				
				#endregion
				
				break; //end water
			
		}//end neutral state machine
		
		//mask_index = sprite_index;
		mask_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
	
		PlayerState_SeleneSword(_attacksprite, _attackhitbox, _attackdir);
		
		switch(PlayerNeutralState)
			{
				//If the player is on the ground
				case PLAYERSTATE_NEUTRAL.GROUND:
					Gravity = Gravity_Normal;
					PlayerJump = MaxCoyoteJump;
					break;
				
				//If the player is in the air
				case PLAYERSTATE_NEUTRAL.AIR:
					Gravity = Gravity_Normal;
					break;
				
				//If the player is in the water
				case PLAYERSTATE_NEUTRAL.WATER:
					Gravity = Gravity_Swim;
					//ySpeed = lerp(ySpeed, 0, 0.1);
					if (key_down && !place_meeting(x, y + 1, obj_Wall))
					{
						ySpeed = JumpPower / SwimPower;
					}
					break;
			
			}
		
		#endregion
		
		break;//end Selene Sword
	
	//When the player uses Lunar Cannon
	case PLAYERSTATE.CANNON:
	
		PlayerState_LunarCannon();
	
		break;//end Lunar Cannon
		
	//When the player uses Crescent Blitz
	case PLAYERSTATE.AIRDASH:
	
		PlayerState_CrescentBlitz();
	
		break;//end Crescent Blitz
		
	//When the player uses Cling To Hope
	case PLAYERSTATE.WALL:
		
		PlayerState_ClingToHope();
		
		break;//end Cling To Hope
		
	//If the player is hurt
	case PLAYERSTATE.HURT:
	
		//x += xSpeed;
		//y += ySpeed;
		PlayerState_Hurt();
		
		break;//end hurt
		
	case PLAYERSTATE.HEAL:
	
		PlayerState_NightNight();
		
		break;
		
}//end PLayer State Machine

#endregion
