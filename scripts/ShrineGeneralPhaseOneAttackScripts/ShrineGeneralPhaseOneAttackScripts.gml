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
			
			if (ShrineGeneral_RocketPunch_StartTimer++ > ShrineGeneral_RocketPunch_TimeToWindUp)
			{
				ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.PUNCH;
			}
			
			break;//end wind up stage
			
		//The punch state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.PUNCH:
			
			break;//end punch stage
			
	}

}