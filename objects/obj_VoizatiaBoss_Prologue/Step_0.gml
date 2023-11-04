/// @description Insert description here
// You can write your code in this editor

var _leftBoundary = obj_Camera.x - (RES_W/2) + (sprite_width/2) + 15;
var _rightBoundary = obj_Camera.x + (RES_W/2) - (sprite_width/2) - 15;

var _upperBoundary = (sprite_height/2) + 15;
var _lowerBoundary = 352 - (sprite_height/2) - 15;

#region Check Attacks In Range

#region Selene Sword

//Attacks in range
if (instance_exists(obj_Player))
{
	
	if (abs(x - obj_Player.x) < 128 && abs(y - obj_Player.y) < 128)
	{
		VoizatiaBossPrologue_InRangeSword = true;
	}
	
	//If the user is not in range
	else
	{
		VoizatiaBossPrologue_InRangeSword = false;
	}
	
	if (VoizatiaBossPrologue_InRangeSword)
	{
		//If the player is about to use Selene Sword
		if (obj_Player.PlayerState == PLAYERSTATE.SWORD)
		{
			VoizatiaBossPrologue_Teleport();//VoizatiaBossPrologue_State_Idle = VOIZATIABOSSPROLOGUE_STATE_IDLE.TELEPORT;
		}
	}
	
}//end attacks in range

//Attack out of range
else
{
	VoizatiaBossPrologue_InRangeSword = false;
}

#endregion

#region Lunar Cannon

if (instance_exists(obj_LunarCannon))
{
	var _moonAttack = instance_nearest(x, y, obj_LunarCannon);
	
	if (point_distance(x, y, _moonAttack.x, _moonAttack.y) < 64)
	{
		VoizatiaBossPrologue_InRangeCannon = true;
	}
	else
	{
		VoizatiaBossPrologue_InRangeCannon = false;
	}
	
}
//Attack out of range
else
{
	VoizatiaBossPrologue_InRangeCannon = false;
}

if (VoizatiaBossPrologue_InRangeCannon)
{
	var _moonAttack = instance_nearest(x, y, obj_LunarCannon);
					
	with (_moonAttack)
	{
		speed /= 1.5;	
		image_alpha = map(speed, 0, 7, 0, 2);
	}
							
}

#endregion

#endregion

//Voizatias State Machine
switch (VoizatiaBossPrologue_CurrentState)
{
	//Idle State: Voizatia is passive, and is constantly dodging your attacks
	case VOIZATIABOSSPROLOGUE_STATE.IDLE:
		
		#region Idle
		
			sprite_index = spr_Voizatia_Fly;
			
			if (VoizatiaBossPrologue_StateChangeTimer++ > VoizatiaBossPrologue_StateChangeTimerLimit)
			{
				VoizatiaBossPrologue_CurrentState = VoizatiaBossPrologue_NextState;
				VoizatiaBossPrologue_StateChangeTimer = 0;	
			}
			
		#endregion
		
		break;//end Idle State
		
	//Rouge Spear State: Voizatia summons Rouge Spears to attack the player
	case VOIZATIABOSSPROLOGUE_STATE.ROUGE_SPEAR:
		
		#region Rouge Spear
		
			if (instance_exists(obj_Player))
			{
				VoizatiaBossPrologue_RougeSpear();
			}
		
		#endregion
		
		break;//end Rouge Spear State
		
	//Sin Eruption State: 
	case VOIZATIABOSSPROLOGUE_STATE.SIN_ERUPTION:
	
		#region Sin Eruption
			
			VoizatiaBossPrologue_SinEruption();
			
		#endregion
	
		break;//end Sin Eruption State
		
}//end State Machine






