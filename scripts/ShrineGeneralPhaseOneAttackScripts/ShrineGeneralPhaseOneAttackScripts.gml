// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShrineGeneralPhaseOne_RocketPunch(){

	xSpeed = 0;
	
	//The Rocket Punch state machine
	switch(ShrineGeneral_RocketPunch_State)
	{
		//The wind up stage of the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP:
		
			//Do stuff to the right arm
			with (ShrineGeneral_RightArm)
			{
				sprite_index = spr_ShrineGeneral_RightArm_RocketPunchWindUp_PhaseOne;
			}//end with Right Arm
			
			//Do stuff to the left arm
			with (ShrineGeneral_LeftArm)
			{
				sprite_index = spr_ShrineGeneral_LeftArm_RocketPunchWindUp_PhaseOne;
			}//end with Left Arm
			
			//If the wind up time is finished
			if (ShrineGeneral_RocketPunch_StartTimer++ > ShrineGeneral_RocketPunch_TimeToWindUp)
			{
				ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.JAB;
			}
			
			break;//end wind up stage
			
		//The jab state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.JAB:

			//access the right arm
			with (ShrineGeneral_RightArm)
			{
				//change the sprite
				sprite_index = spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne;
				//make it do damage
				Damage = other.ShrineGeneral_RocketPunch_Damage;
				
				//Set the direction the punch goes
				ShrineGeneral_RocketPunch_Dir = image_xscale;
				
				//Make it MOVE
				x += Approach(0, other.ShrineGeneral_RocketPunch_Speed * other.ShrineGeneral_RocketPunch_Dir, other.ShrineGeneral_RocketPunch_Accel);
				
				//If the rocket punch has reached its maximum range
				if (x >= abs(other.x + other.ShrineGeneral_RocketPunch_MaxDist * image_xscale))
				{
					other.ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS;
				}//end reached max distance
				
			}//end access right arm

			break;//end jab stage
			
		//The cross state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS:
		
			
		
			break;//end cross state
			
	}//end Rocket Punch state machine

}//end ShrineGeneralPhaseOne_RocketPunch()