/// @description Shootings lasers

//Rune Turret State Machine
switch(TurretState)
{
	//If RT is passive
	case RUNETURRET_STATE.IDLE:
	
		#region Idle Code
	
			image_speed = 1;
			sprite_index = spr_RuneTurret;
	
			//Check if the Player exists
			if (instance_exists(obj_Player))
			{
				//Check if they're in range
				if (point_distance(obj_Player.x, obj_Player.y, x, y) < 600)
				{
				
					//If the count down reaches 0
					if (RuneTurret_Cooldown <= 0)
					{
						//Switch to the charging state
						TurretState = RUNETURRET_STATE.CHARGE;
					}
					
					//If the countdown hasn't reached 0
					else
					{
						RuneTurret_Cooldown--;
					}
		
				}//end player in range
	
			}//end if player exists
		
		#endregion
		
		break; //end RT passive
		
	//If RT is charging an attack	
	case RUNETURRET_STATE.CHARGE:
	
		#region Charge Code
	
			sprite_index = spr_RuneTurretCharge;
		
			//If the charge animation is about to end
			if (image_index >= image_number - 1)
			{
				//If the player exists
				if (instance_exists(obj_Player))
				{
					//If RT has a clear shot
					if (!collision_line(x, y, obj_Player.x, obj_Player.y, obj_Wall, false, false))
					{
						TurretState = RUNETURRET_STATE.SHOOT;
					}//end clear shot
					
					//If RT doesn't have a clear shot
					else
					{
						//Freeze frame
						image_speed = 0;
						image_index = image_number - 1;
					}//end no clear shot
					
				}//if the player exists
				
			
			}//end charge end
	
		#endregion
	
		break; //end RT Charge
		
	//If RT is shooting an attack
	case RUNETURRET_STATE.SHOOT:
	
		#region Shoot Code
		
			//Play the sound effect
			audio_play_sound(sound_Shoot, 5, false);
				
			//Create the Rune Turret laser
			with (instance_create_layer(x, y, layer, obj_RuneTurretLaser))
			{
				//Set its speed
				speed = 6;
				
				//If the player exists
				if (instance_exists(obj_Player))
				{
					//Set the direction to be at the Player
					other.RuneTurret_ShootDir = point_direction(other.x, other.y, obj_Player.x, obj_Player.y);
				}
				
				//How mouch the Rune Turret can miss by
				var shootRange = 0;
					
				//The direction that the Rune Turret travels in
				direction = other.RuneTurret_ShootDir + random_range(-shootRange, shootRange);
				image_angle = direction;
					
			}//end create Rune Turret Laser
				
			//Reset the countdown
			RuneTurret_Cooldown = RuneTurret_CooldownRate;
			
			TurretState = RUNETURRET_STATE.IDLE;
		
		#endregion
	
		break; //end RT Shoot
		
}