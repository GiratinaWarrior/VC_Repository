/// @description

#region Movement

	ySpeed += Gravity;

	Wall_FallOn();
	Wall_LedgeTurn();
	Wall_SwitchRun();

	x += xSpeed;
	y += ySpeed;

#endregion

#region State Transition

	if (instance_exists(obj_Player))
	{
		PlayerInRange = (abs(x - obj_Player.x) < 500 && abs(y - obj_Player.y) < 32);
	}
	else
	{
		PlayerInRange = false;
	}

	if (Attacked)
	{
		Guardark_State = GUARDARK_STATE.HURT;
	}

#endregion

#region States

//Guardarks state machine
switch (Guardark_State)
{
	//The Guardark patrols the area
	case GUARDARK_STATE.PATROL:
		
		sprite_index = spr_Guardark_Idle;
	
		image_speed = 1;
		
		if (xSpeed != 0)
		{
			Guardark_Dir = sign(xSpeed);
		}
		
		if (PlayerInRange)
		{
			Guardark_State = GUARDARK_STATE.SHOOT;
		}
		
		break;//end Guardark patrol
		
	//The Guardark shoots at the player
	case GUARDARK_STATE.SHOOT:
		
		GuardarkState_Shoot();
		
		break;//end Guardark shoot
		
	//The Guardark takes damage
	case GUARDARK_STATE.HURT:
		
		sprite_index = spr_Guardark_Idle;
		
		image_speed = 0;
		
		xSpeed = lengthdir_x(Guardark_Speed, HitFrom);
	
		x += xSpeed;
		
		break;//end Guardark hurt
	
}//end Guardark state machine

#endregion