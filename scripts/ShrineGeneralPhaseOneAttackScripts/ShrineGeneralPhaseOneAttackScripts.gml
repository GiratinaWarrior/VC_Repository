// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShrineGeneralPhaseOne_RocketPunch(){

	xSpeed = 0;
	
	//The Rocket Punch state machine
	switch(ShrineGeneral_RocketPunch_State)
	{
		//The wind up stage of the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.WINDUP:
		
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
			}
			
			break;//end wind up stage
			
		//The jab state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.JAB:

			#region Old Right Arm
			
				/*
			
				//access the right arm
				with (ShrineGeneral_RightArm)
				{
					//change the sprite
					sprite_index = spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne;
					//make it do damage
					Damage = other.ShrineGeneral_RocketPunch_Damage;
				
					//Set the direction the punch goes
					other.ShrineGeneral_RocketPunch_Dir = image_xscale;
				
					//Make it MOVE
					x += (other.ShrineGeneral_RocketPunch_Speed * other.ShrineGeneral_RocketPunch_Dir);
				
					//If the rocket punch has reached its maximum range
					if (abs(point_distance(x, y, other.x, other.y)) >= other.ShrineGeneral_RocketPunch_MaxDist)
					{
						other.ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS;
					}//end reached max distance
				
				}//end access right arm
				
				*/
				
			#endregion
			
			#region New Right Arm
				
				ShrineGeneral_RightArm.sprite_index = spr_ShrineGeneral_RightArm_RocketPunchAttack_PhaseOne;
				
				ShrineGeneral_RightArm.Damage = ShrineGeneral_RocketPunch_Damage;
				
				ShrineGeneral_RocketPunch_Dir = image_xscale;
				
				ShrineGeneral_RightArm.x += ShrineGeneral_RocketPunch_Speed * ShrineGeneral_RocketPunch_Dir;
				
				if (abs(point_distance(x, y, ShrineGeneral_RightArm.x, ShrineGeneral_RightArm.y)) >= ShrineGeneral_RocketPunch_MaxDist)
				{
					ShrineGeneral_RocketPunch_State = SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS;
				}
				
			#endregion

			break;//end jab stage
			
		//The cross state for the rocket punch
		case SHRINEGENERAL_ROCKETPUNCH_STATE.CROSS:
		
			
		
			break;//end cross state
			
	}//end Rocket Punch state machine

}//end ShrineGeneralPhaseOne_RocketPunch()