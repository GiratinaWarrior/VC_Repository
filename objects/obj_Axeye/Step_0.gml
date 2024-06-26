/// @description

//show_debug_message("Axeye State: {0}", Axeye_State)

//audio_play_sound(sound_AxeyeCharge, 1, false);



#region State Transition

	if (instance_exists(obj_Player))
	{
		PlayerInRange = (point_distance(x, y, obj_Player.x, obj_Player.y) < 300 && !(collision_line(x, y, obj_Player.x, obj_Player.y, obj_Wall, false, false))) //(abs(x - obj_Player.x) < RES_W/2 && abs(y - obj_Player.y) < RES_H/2);
	}
	else
	{
		PlayerInRange = false;
	}
	
	if (Axeye_State != AXEYE_STATE.CHARGE)
	{
		Axeye_ChargeSound = 0;
	}


#endregion

#region State Machine
	
	//Axeye State Machine
	switch(Axeye_State)
	{
		//Idle State: The Axeye will float around when the player is not in range
		case AXEYE_STATE.IDLE:
	
			#region Idle

			//	audio_stop_sound(sound_AxeyeCharge);
				
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
					Axeye_ChargeSound = Axeye_ChargeSoundMax;
					audio_play_sound(sound_AxeyeCharge, 100, false, Axeye_ChargeSound);
				}
			
			#endregion
	
			break;//end Idle State
		
		//Charge State: Axeye gets ready to charge up an attack
		case AXEYE_STATE.CHARGE:
		
			#region Charge 

				//Damage = 0;
				
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
					
					Axeye_AttackSpeed_X = lengthdir_x(Axeye_AttackSpeed, Axeye_AttackDir);
					Axeye_AttackSpeed_Y = lengthdir_y(Axeye_AttackSpeed, Axeye_AttackDir);
					xSpeed = Axeye_AttackSpeed_X;
					ySpeed = Axeye_AttackSpeed_Y;
					Axeye_State = AXEYE_STATE.ATTACK;
					audio_play_sound(sound_AxeyeAttack, 50, false, 0.3)
				}
				
			#endregion
			
			break;//end Charge State
		
		//Attack State: Axeye launches itself at the player
		case AXEYE_STATE.ATTACK:
			
			#region Attack
				
				image_angle -= Axeye_SpinSpeed * Axeye_SpinDir;
				
				Damage = 3;
				
				if (Axeye_AttackTimer++ > Axeye_AttackTimerLimit)
				{
					Axeye_State = AXEYE_STATE.IDLE;
					Axeye_AttackTimer = 0;
				}
				
				SpeedTrail(c_gray);
				
			#endregion
			
			break;//end Attack Stage
		
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

#region Movement

	Wall_BounceOn();
	Wall_SwitchRun();
	Boundary_SwitchRun();
	Boundary_BounceOn();
	
	x += xSpeed;
	y += ySpeed;

#endregion






