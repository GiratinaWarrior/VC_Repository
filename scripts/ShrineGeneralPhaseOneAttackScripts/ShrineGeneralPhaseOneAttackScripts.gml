// This function runs the Rocket Punch attack for the Shrine General
function ShrineGeneralPhaseOne_RocketPunch(){

	xSpeed = 0;
	
	//The Rocket Punch state machine
	switch(ShrineGeneral_RocketPunch_State)
	{
		//The wind up stage of the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP:
		
			#region Wind Up Stage
				
				sprite_index = spr_ShrineGeneral_Body_RocketPunchWindUp_PhaseOne;
		
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
			
		//	show_debug_message("Jab State")
			
			#region Jab State
				
				sprite_index = spr_ShrineGeneral_Body_RocketPunchAttack_PhaseOne;
				
				#region Right Arm moves out to punch
				
					if (ShrineGeneral_RightArm.sprite_index != spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne)
					{
						//Change the sprite
						ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne;
						
						//Play the sound effect
						audio_play_sound(sound_ShrineGeneral_RocketPunch, 80, false);
					}
				
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
			
		//	show_debug_message("Cross State")
		
			#region Cross State
				
				sprite_index = spr_ShrineGeneral_Body_RocketPunchAttack_PhaseOne;
				
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
					
					if (ShrineGeneral_LeftArm.sprite_index != spr_ShrineGeneral_LeftArm_RocketPunchAttack_PhaseOne)
					{
						//Change the sprite
						ShrineGeneral_LeftArm.sprite_index = spr_ShrineGeneral_LeftArm_RocketPunchAttack_PhaseOne;
						//play the sound effect
						audio_play_sound(sound_ShrineGeneral_RocketPunch, 80, false);
					}
				
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
		
		//	show_debug_message("Cooldown State")
			
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
	
// This function runs the Rapid Punch attack for the Shrine General
function ShrineGeneralPhaseOne_RapidPunches() {

	//State machine for the Rapid Punches
	switch(ShrineGeneral_RapidPunch_State)
	{
		
		//The Windup State for the Rapid Punch
		//This is where SG will pull back its arms to prepare
		case SHRINEGENERAL_RAPIDPUNCH_STATE.WINDUP:
			
			#region Wind Up
				
				sprite_index = spr_ShrineGeneral_Body_RapidPunchWindup_PhaseOne;
			
				xSpeed = 0;
			
				ShrineGeneral_LeftArm.sprite_index = spr_ShrineGeneral_LeftArm_RapidPunchWindUp_PhaseOne;
				ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_RapidPunchWindUp_PhaseOne;
				
				ShrineGeneral_LeftArm.image_index = image_index;
				ShrineGeneral_RightArm.image_index = image_index;
				
				if (ShrineGeneral_RapidPunch_WindUpTimer++ > ShrineGeneral_RapidPunch_TimeToWindUp)
				{
					ShrineGeneral_RapidPunch_State = SHRINEGENERAL_RAPIDPUNCH_STATE.FLURRY;
				}
				
			#endregion
				
			break;//end Wind up State
		
		//The Flurry state for the Rapid Punch
		//This is where SG will rapidly fire mirages of punches
		case SHRINEGENERAL_RAPIDPUNCH_STATE.FLURRY:
			
			#region Flurry
			
				sprite_index = spr_ShrineGeneral_Body_RapidPunchFlurry_PhaseOne;
			
				xSpeed = image_xscale = ShrineGeneral_Speed/10;
				
				#region Regular Arms
				
					//Temporarily deactivate the Shrine Generals left and right arms
					//instance_deactivate_object(ShrineGeneral_RightArm);
					//instance_deactivate_object(ShrineGeneral_LeftArm);
					
					//ShrineGeneral_RightArm.image_alpha = 0;
					//ShrineGeneral_LeftArm.image_alpha = ShrineGeneral_RightArm.image_alpha;
				
				#endregion 
			
				#region Mirage Arms
					
					//if the flurry has gone on long enough, end it
					if (ShrineGeneral_RapidPunch_FlurryTimer++ > ShrineGeneral_RapidPunch_FlurryLength)
					{
						if (!instance_exists(obj_ShrineGeneral_RapidPunch))
						{
							ShrineGeneral_RapidPunch_State = SHRINEGENERAL_RAPIDPUNCH_STATE.COOLDOWN;
						}
					}//end flurry
					
					else
					{
						//Start creating the rapid punches
						ShrineGeneral_RapidPunch_FlurryCreate();
						
						if (!audio_is_playing(sound_ShrineGeneral_RapidPunch))
						{
							audio_play_sound(sound_ShrineGeneral_RapidPunch, 60, false);
						}
						
					}
					
				#endregion
			
			#endregion 	
			
			break;//end Flurry State
			
		//The Finish state for the Rapid Punch
		//This is where SG will do the finishing blow
		case SHRINEGENERAL_RAPIDPUNCH_STATE.FINISH:
			
			#region Finish
			
				//If a Rapid Punch Finsih hasnt been created yet, create it
				if (!instance_exists(obj_ShrineGeneral_RapidPunch_Finish))
				{
					
					RapidPunchFinish_StartY = 0;
					
					//Access the Finishing move
					with (instance_create_depth(x, y + RapidPunchFinish_StartY, depth + 1, obj_ShrineGeneral_RapidPunch_Finish))
					{
						RapidPunchFinish_MainBody = other.id;
					
						RapidPunchFinish_MaxDist = other.ShrineGeneral_RapidPunch_FinishRange;
						
						//RapidPunchFinish_StartY = other.RapidPunchFinish_StartY;
						
						image_xscale = other.image_xscale;
						
						speed = image_xscale * 7;
					
					}//end access finishing move
					
				}//end if Finish not created
				
			#endregion
			
			break;
			
		//The Cooldown state for Rapid Punch
		//This is where SG will reactivate its arms
		case SHRINEGENERAL_RAPIDPUNCH_STATE.COOLDOWN:
		
			#region Cooldown
				
				audio_stop_sound(sound_ShrineGeneral_RapidPunch);
				
				//Reactivte the Arms
			//	ShrineGeneral_RightArm.image_alpha = 1;
			//	ShrineGeneral_LeftArm.image_alpha = ShrineGeneral_RightArm.image_alpha;
				
				//Reset the sprites
				ShrineGeneral_LeftArm.sprite_index = spr_ShrineGeneral_LeftArm_Idle_PhaseOne;
				ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_Idle_PhaseOne;
				
				//Set the Shrine General to the Idle State
				ShrineGeneral_State_One = SHRINEGENERAL_STATE_ONE.IDLE;
				
				//Reset the Rapid Punch state machine
				ShrineGeneral_RapidPunch_State = SHRINEGENERAL_RAPIDPUNCH_STATE.WINDUP;
				
				//Reset the arms position
				ShrineGeneral_LeftArm.x = x;
				ShrineGeneral_RightArm.x = x;
				
				//Reset the speed of SG
				xSpeed = ShrineGeneral_Speed * image_xscale;
				
				ShrineGeneral_RapidPunch_FlurryTimer = 0;
				
				ShrineGeneral_RapidPunch_WindUpTimer = 0;
				
			#endregion
			
			break;
			
	}//end Rapid Punch State Machine
	
}//end ShrineGeneralPhaseOne_RapidPunches()
	