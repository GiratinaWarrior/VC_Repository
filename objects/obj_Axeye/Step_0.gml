/// @description

//show_debug_message("Axeye State: {0}", Axeye_State)

#region Movement

	if (Axeye_State == AXEYE_STATE.ATTACK)
	{
		Wall_FallOn();
		Wall_StopRun();
	}
	else
	{
		Wall_BounceOn();
		Wall_SwitchRun();
	}
	
	x += xSpeed;
	y += ySpeed;

#endregion

#region State Transition

	if (instance_exists(obj_Player))
	{
		PlayerInRange = (point_distance(x, y, obj_Player.x, obj_Player.y) < 300 && !(collision_line(x, y, obj_Player.x, obj_Player.y, obj_Wall, false, false))) //(abs(x - obj_Player.x) < RES_W/2 && abs(y - obj_Player.y) < RES_H/2);
	}
	else
	{
		PlayerInRange = false;
	}

	if (Attacked)
	{
		//Axeye_State = AXEYE_STATE.HURT;
	}

#endregion

#region State Machine
	
	//Axeye State Machine
	switch(Axeye_State)
	{
		//Idle State: The Axeye will float around when the player is not in range
		case AXEYE_STATE.IDLE:
	
			#region Idle

				Damage = 1;
								
				sprite_index = spr_Axeye_Idle;
				mask_index = sprite_index;
			
				image_speed = 1;
				
				image_angle += (0 - image_angle)/10;

				if (xSpeed != 0)
				{
					Axeye_Dir = sign(xSpeed);
				}
			
				if (Axeye_Speed_Idle_Timer++ >= Axeye_Speed_Idle_TimerLimit)
				{
					Axeye_Speed_Idle_X = random_range(-Axeye_Speed_IdleMain, Axeye_Speed_IdleMain);	
					Axeye_Speed_Idle_Y = random_range(-Axeye_Speed_IdleMain, Axeye_Speed_IdleMain);	
					Axeye_Speed_Idle_Timer = 0;
				}
			
				xSpeed = Approach(xSpeed, Axeye_Speed_Idle_X, 0.1);
				ySpeed = Approach(ySpeed, Axeye_Speed_Idle_Y, 0.1);
				
				if (PlayerInRange) && (image_angle == 0)
				{
					Axeye_TargetAngle = Axeye_MaxAngle * (sign(obj_Player.x - x));
					Axeye_State = AXEYE_STATE.CHARGE;
				}
			
			#endregion
	
			break;//end Idle State
		
		//Charge State: Axeye gets ready to charge up an attack
		case AXEYE_STATE.CHARGE:
		
			#region Charge 
				
				Damage = 0;
				
				sprite_index = spr_Axeye_Attack;
				
				xSpeed = 0;
				ySpeed = 0;
				
				//Axeye_TargetAngle = Axeye_MaxAngle * (sign(obj_Player.x - x));
				
				image_angle = Approach(image_angle, Axeye_TargetAngle, Axeye_RotateSpeed);
				
				if (image_angle == Axeye_TargetAngle)
				{
					switch(Axeye_TargetAngle)
					{
						case 90:
							Axeye_SpinDir = -1;
							break;
							
						case -90:
							Axeye_SpinDir = 1;
							break;
					}
					
					if (instance_exists(obj_Player))
					{
						Axeye_AttackDir = point_direction(x, y, obj_Player.x, obj_Player.y);
					}
					
					Axeye_State = AXEYE_STATE.ATTACK;
				}
				
			#endregion
			
			break;//end Charge State
		
		//Attack State: Axeye launches itself at the player
		case AXEYE_STATE.ATTACK:
			
			#region Attack
				
				//mask_index = spr_Axeye_AttackHitbox;
				
				xSpeed = lengthdir_x(Axeye_AttackSpeed, Axeye_AttackDir);
				ySpeed = lengthdir_y(Axeye_AttackSpeed, Axeye_AttackDir);
				
				image_angle += Axeye_SpinSpeed * Axeye_SpinDir;
				
				Damage = 3;
				
				if (place_meeting(x + xSpeed, y + ySpeed, obj_Wall))
				{
					xSpeed *= 0.3;
					ySpeed *= 0.3;
					Axeye_State = AXEYE_STATE.IDLE;
				}
				
			#endregion
			
			break;//end Attack Stage
		
		//Stuck State: Axeye hits a wall and is temporarily stuck as it tries to free itself
		case AXEYE_STATE.STUCK:
		
			#region Stuck
				
				Damage = 0;
				
				xSpeed = -lengthdir_x(max(0, min(Axeye_UnstuckSpeed, Axeye_UnstuckSpeedMax)), Axeye_AttackDir);
				ySpeed = -lengthdir_y(max(0, min(Axeye_UnstuckSpeed, Axeye_UnstuckSpeedMax)), Axeye_AttackDir);
				
				Axeye_UnstuckSpeed += Axeye_UnstuckRate;
				
				if !(place_meeting(x - xSpeed, y - ySpeed, obj_Wall))
				{
					Axeye_Idle_Timer = 0;
					Axeye_State = AXEYE_STATE.IDLE;
				}
			
			#endregion
			
			break;//end Stuck State
		
		//Hurt State: Axeye gets hurt
		case AXEYE_STATE.HURT:
			
			#region Hurt
			
				xSpeed = lengthdir_x(Axeye_Speed_IdleMain, HitFrom);
	
				x += xSpeed;
			
				ySpeed = lengthdir_y(Axeye_Speed_IdleMain, HitFrom);
	
				y += ySpeed;
				
			#endregion
			
			break;//end Hurt State
	
	}//end Axeye State Machine

#endregion








