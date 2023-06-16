/// @description

#region Movement

	Wall_FallOn();
	Wall_SwitchRun();
	Wall_LedgeTurn();

	x += xSpeed;
	
	y += ySpeed;

#endregion Movement

#region State 
	
	//Shrine General State Machine
	switch(ShrineGeneral_State_One)
	{
		//if SG is in the Idle state
		case SHRINEGENERAL_STATE_ONE.IDLE:
		
			#region Idle
		
				if (xSpeed != 0)
				{
					image_xscale = sign(xSpeed);
				}
		
				/////Have the arms approach the main body
				//var _reattachSpeed = 5;
	
				with (ShrineGeneral_LeftArm)
				{
					x = other.x// Approach(x, other.x, _reattachSpeed);
					y = other.y// Approach(y, other.y, _reattachSpeed);
					image_xscale = other.image_xscale;
					depth = other.depth - image_xscale;
				}
				with (ShrineGeneral_RightArm)
				{
					x = other.x//Approach(x, other.x, _reattachSpeed);
					y = other.y//Approach(y, other.y, _reattachSpeed);
					image_xscale = other.image_xscale;
					depth = other.depth + image_xscale;
				}
		
				//Determine how close the player is from SG
				if (instance_exists(obj_Player))
				{
					ShrineGeneral_PlayerRange = abs(obj_Player.x - x);
				}
		
				//If its time for SG to attack
				if (ShrineGeneral_StateChangeCounter++ > ShrineGeneral_StateChangeLimit)
				{
					//If the player is in range of Rapid Punch
					if (ShrineGeneral_PlayerRange <= ShrineGeneral_RapidRange)
					{
					    ShrineGeneral_State_One = SHRINEGENERAL_STATE_ONE.RAPID;
						ShrineGeneral_StateChangeCounter = 0;
					}//end in range of Rapid Punch
			
					//If the player is in range of Rocket Punch
					else if (ShrineGeneral_PlayerRange <= ShrineGeneral_RocketRange)
					{
						ShrineGeneral_State_One = SHRINEGENERAL_STATE_ONE.ROCKET;
						ShrineGeneral_StateChangeCounter = 0;
					}//end in range of Rocket Punch 
			
				}//end SG attack
		
			#endregion
			
			break;//end Idle state
		
		//if SG is in the rapid punch state
		case SHRINEGENERAL_STATE_ONE.RAPID:
		
			ShrineGeneralPhaseOne_RapidPunches();
		
			break;//end rapid punch state
		
		//if SG is in the rocket punch state
		case SHRINEGENERAL_STATE_ONE.ROCKET:
			
			ShrineGeneralPhaseOne_RocketPunch();
			
			break;//end rocket punch state
	
	}//end SG State machine
	
#endregion