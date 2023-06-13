// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShrineGeneralPhaseOne_RocketPunch(){

	xSpeed = 0;
	
	//The Rocket Punch state machine
	switch(ShrineGeneral_RocketPunch_State)
	{
		//The wind up stage of the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP:
		
			#region Wind Up Stage
			
				image_xscale = -sign(x - obj_Player.x);
		
				//Do stuff to the right arm
				with (ShrineGeneral_RightArm)
				{
					sprite_index = spr_ShrineGeneral_RightArm_RocketPunchWindUp_PhaseOne;
					image_xscale = other.image_xscale;
				}//end with Right Arm
			
				//Do stuff to the left arm
				with (ShrineGeneral_LeftArm)
				{
					sprite_index = spr_ShrineGeneral_LeftArm_RocketPunchWindUp_PhaseOne;
					image_xscale = other.image_xscale;
				}//end with Left Arm
			
				//If the wind up time is finished
				if (ShrineGeneral_RocketPunch_StartTimer++ > ShrineGeneral_RocketPunch_TimeToWindUp)
				{
					ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.JAB;
					ShrineGeneral_RocketPunch_StartTimer = 0;
				}
				
			#endregion
			
			break;//end wind up stage
			
		//The jab state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.JAB:
			
			show_debug_message("Jab State")
			
			#region Jab State
				
				#region Right Arm moves out to punch
				
					//Change the sprite
					ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne;
				
					//Change the damage
					ShrineGeneral_RightArm.Damage = ShrineGeneral_RocketPunch_Damage;
				
					//Adjust the direction depending on which way SG is facing
					ShrineGeneral_RocketPunch_Dir = image_xscale;
				
					//If the Right arm has reached the maximum distance, time for the Cross State
					if (abs(point_distance(x, y, ShrineGeneral_RightArm.x, ShrineGeneral_RightArm.y)) >= ShrineGeneral_RocketPunch_MaxDist)
					{
						ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS;
					}
					
					else
					{
						//Move the Right Armmm
						ShrineGeneral_RightArm.x += ShrineGeneral_RocketPunch_Speed * ShrineGeneral_RocketPunch_Dir;
					}
					
					
				#endregion
				
				#region Left Arm returns to its original position if i want a multi rocket punch
				
				#endregion
				
			#endregion

			break;//end jab stage
			
		//The cross state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS:
			
			show_debug_message("Cross State")
		
			#region Cross State
				
				#region Right Arm Returns to its original place
					
					//if the right arm is not at its original position, place it there
					if (abs(ShrineGeneral_RightArm.x - x) <= 10)
					{
						ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_Idle_PhaseOne;
						ShrineGeneral_RightArm.x = x;
					}//end move arm while not regrouped
					
					//If the arm has regrouped with the body, change the sprite to the default one
					else
					{
						//Move the right arm back to its original position
						ShrineGeneral_RightArm.x -= ShrineGeneral_RocketPunch_Speed * ShrineGeneral_RocketPunch_Dir;
					}//end arm regrouped
					
				#endregion
				
				#region Left Arm moves to attack
					
					//Change the sprite
					ShrineGeneral_LeftArm.sprite_index = spr_ShrineGeneral_LeftArm_RocketPunchAttack_PhaseOne;
				
					//Change the damage
					ShrineGeneral_LeftArm.Damage = ShrineGeneral_RocketPunch_Damage;
				
					//Adjust the direction depending on which way SG is facing
					ShrineGeneral_RocketPunch_Dir = image_xscale;
				
					//If the Left arm has reached the maximum distance, time for the Cross State
					if (abs(point_distance(x, y, ShrineGeneral_LeftArm.x, ShrineGeneral_LeftArm.y)) >= ShrineGeneral_RocketPunch_MaxDist)
					{
						//If the Right Arm has been retracted
						if (ShrineGeneral_RightArm.sprite_index == spr_ShrineGeneral_RightArm_Idle_PhaseOne)
						{
							ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.COOLDOWN;
						}
					}
					
					else
					{
						//Move the Left Arm
						ShrineGeneral_LeftArm.x += ShrineGeneral_RocketPunch_Speed * ShrineGeneral_RocketPunch_Dir;
					}
					
					
				#endregion
				
			#endregion
		
			break;//end cross state
			
		//The cooldown state for the rocket punch
			//for when its time to stop rocket punching
		case SHRINEGENERAL_ROCKETPUNCH_STATE.COOLDOWN:
		
			show_debug_message("Cooldown State")
			
			#region Cooldown State
			
				//if the left arm is not at its original position, place it there
					if !(abs(ShrineGeneral_LeftArm.x - x) <= 10)
					{
						//Move the left arm back to its original position
						ShrineGeneral_LeftArm.x -= ShrineGeneral_RocketPunch_Speed * ShrineGeneral_RocketPunch_Dir;
						
					}//end move arm while not regrouped
					
					//If the arm has regrouped with the body, change the sprite to the default one
					else
					{
						//Reset the sprite
						ShrineGeneral_LeftArm.sprite_index = spr_ShrineGeneral_LeftArm_Idle_PhaseOne;
						
						ShrineGeneral_LeftArm.x = x;
						
						/*
							Start the punch cooldown, once the cooldown is finished
							reset Shrine General back to the Idle state
						*/
						if (ShrineGeneral_RocketPunch_CooldownTimer++ > ShrineGeneral_RocketPunch_TimeToCoolDown)
						{
							ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP;
							ShrineGeneral_State_One = SHRINEGENERAL_STATE_ONE.IDLE;
							ShrineGeneral_LeftArm.x = x;
							ShrineGeneral_RightArm.x = x;
							xSpeed = ShrineGeneral_Speed * image_xscale;
							ShrineGeneral_RocketPunch_CooldownTimer = 0;
						}
						
					}//end arm regrouped
			
			#endregion
		
			break;///end cooldown state
			
	}//end Rocket Punch state machine

}//end ShrineGeneralPhaseOne_RocketPunch()