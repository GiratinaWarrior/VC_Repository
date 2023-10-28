/// @description Insert description here
// You can write your code in this editor

#region Sword Range

if (instance_exists(obj_Player))
{
	
	var _closeRange = 80;
	var _longRange = 128;
	
	//show_debug_message("X-Dist: {0}", abs(x - obj_Player.x))
	//show_debug_message("Y-Dist: {0}", abs(y - obj_Player.y))
	
	//Check if Lavender can be hit by a sword coming from the front/back
	if ( 
			abs(x - obj_Player.x) < _longRange && 
			abs(y - obj_Player.y) < _closeRange 
		)
	{
		LavenderBossBattlePrologue_InRangeSword = true;
	}
	
	//Check if Lavender can be hit by a sword come from  above/below
	else if (
				abs(x - obj_Player.x) < _closeRange &&
				abs(y - obj_Player.y) < _longRange
			)
	{
		LavenderBossBattlePrologue_InRangeSword = true;
	}
	
	//If the user is not in range
	else
	{
		LavenderBossBattlePrologue_InRangeSword = false;
	}
	
}

//If the player is not in range
else
{
	LavenderBossBattlePrologue_InRangeSword = false;
}

#endregion

#region State Machine

//State machine for Lavender
switch (LavenderBossBattlePrologue_CurrentState)
{
	
	//Idle State: This is when Lavender is not attacking the player
	case LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE:
	
		#region Idle
	
			LockEntityInSight();
			
			//Idle State Machine: For the individual things for the idle state
			switch (LavenderBossBattlePrologue_IdleState)
			{
			
				//Idle State (Float): Lavender simply floats around
				case LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.FLOAT:
				
					#region Float
						
						//Lavender faces the player
						if (instance_exists(obj_Player))
						{
	
							image_xscale = -sign(x - obj_Player.x);
	
						}//end face player
						
						//Set the sprite
						sprite_index = spr_Lavender_Levitate;
					
						//Have Lavender float
						LavenderBossBattlePrologue_Idle_FloatTimer += 1/(2 * pi);
						ySpeed = LavenderBossBattlePrologue_Idle_Speed * 0 * sin(LavenderBossBattlePrologue_Idle_FloatTimer * 4);
						y += ySpeed;
						
						//Check if the player exists
						if (instance_exists(obj_Player))
						{
							//Check if the Lavender is in range of being hit by Selene Sword
							if (LavenderBossBattlePrologue_InRangeSword)
							{
								//If Lavender is at the camera boundary
								if !(x - sprite_width/2 <= obj_Camera.x - RES_W) && !(x + sprite_width/2 >= obj_Camera.x + RES_W)
								{
									//If the player is about to use Selene Sword
									if (obj_Player.PlayerState == PLAYERSTATE.SWORD)
									{
										if (Chance(LavenderBossBattlePrologue_Dodge_Chance)) LavenderBossBattlePrologue_IdleState = LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.DODGE;
									}//end player using sword
									
								}//end camera boundary
								
							}//end in sword range
							
						}//end check player existence
						
						if (LavenderBossBattlePrologue_StateChangeTimer++ > LavenderBossBattlePrologue_StateChangeTimerLimit)
						{
							LavenderBossBattlePrologue_StateChangeTimer = 0;
							LavenderBossBattlePrologue_CurrentState = LavenderBossBattlePrologue_NextState;
							LavenderBossBattlePrologue_StateChangeTimer = 0;
						}
					
					#endregion
				
					break;//end Idle-Float
			
				//Idle State (Dodge): Lavender dodges Selene Sword
				case LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.DODGE:
					
					#region Dodge
						
						//Set the sprite
						sprite_index = spr_Lavender_Dodge;
						
						if 
							(
								x + LavenderBossBattlePrologue_Dodge_Speed < (obj_Camera.x + (RES_W/2) - (sprite_width/2)) &&
								x - LavenderBossBattlePrologue_Dodge_Speed > (obj_Camera.x - (RES_W/2) + (sprite_width/2))
							) 
						{
							x -= LavenderBossBattlePrologue_Dodge_Speed * image_xscale;
						}
						
						if !(LavenderBossBattlePrologue_InRangeSword) LavenderBossBattlePrologue_IdleState = LAVENDERBOSSBATTLE_PROLOGUE_IDLESTATE.FLOAT;

					#endregion
					
					break;//end Idle-Dodge
			
			}//end Idle State Machine
			
		#endregion
	
		break;//end Idle State
		
	//Blood Petal State: Lavender summons red rose petals to attack
	case LAVENDERBOSSBATTLE_PROLOGUE_STATE.BLOOD_PETALS:
		
		#region Blood Petal
		
			//Lavender faces the player
			if (instance_exists(obj_Player))
			{
	
				image_xscale = -sign(x - obj_Player.x);
	
			}//end face player
			
			if (LavenderBossBattlePrologue_BloodPetals_ParticleCreated == false)
			{
				Enemy_Invincible = true;
				audio_play_sound(sound_BloodPetalSignal, 200, false);
				
				
				if (sprite_index != spr_Lavender_BloodPetal_Charge)
				{
					image_index = 0;
					sprite_index = spr_Lavender_BloodPetal_Charge;
				}
				
				if (animation_end(spr_Lavender_BloodPetal_Charge))
				{
					LavenderBossBattlePrologue_BloodPetals_ParticleCreated = true;	
				}
			}
			
			else
			{
				
				if (sprite_index == spr_Lavender_BloodPetal_Charge)
				{
					if (animation_end())
					{
						sprite_index = spr_Lavender_BloodPetal;
						image_index = 0;
					}
				}
		
				if (LavenderBossBattlePrologue_MaxPetalTimer++ < LavenderBossBattlePrologue_MaxPetalTimerLimit)
				{
					Enemy_Invincible = true;
					if (LavenderBossBattlePrologue_PetalTimer++ > LavenderBossBattlePrologue_PetalRate)
					{
						LavenderBossBattle_Prologue_BloodPetals();
						LavenderBossBattlePrologue_PetalTimer = 0;
					}	
				}
				else
				{
					if (sprite_index == spr_Lavender_BloodPetal)
					{
						image_index = 0;
						sprite_index = spr_Lavender_BloodPetal_Decharge;
					}
					else if (animation_end(spr_Lavender_BloodPetal_Decharge))
					{
						sprite_index = spr_Lavender_Levitate;
						LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;
						LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.POISON_GARDEN;
						LavenderBossBattlePrologue_PetalTimer = 0;
						LavenderBossBattlePrologue_MaxPetalTimer = 0;
						Enemy_Invincible = false;
						LavenderBossBattlePrologue_BloodPetals_Particle = noone;
						LavenderBossBattlePrologue_BloodPetals_ParticleCreated = false;
					}
					
				}
				
			}
			
		#endregion
		
		break;//end Blood Petal State
	
	case LAVENDERBOSSBATTLE_PROLOGUE_STATE.POISON_GARDEN:
	
		#region Poison Graden
		
			//Lavender faces the player
			if (instance_exists(obj_Player))
			{
	
				image_xscale = -sign(x - obj_Player.x);
	
			}//end face player
			
			
		
		
		#endregion
	
		break;//end Poison Graden State
	
}//end State Machine

#endregion
