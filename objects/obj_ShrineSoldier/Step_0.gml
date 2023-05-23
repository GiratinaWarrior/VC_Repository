/// @description Real Stuff

#region Movement

	ySpeed += Gravity;

	Wall_FallOn();
	Wall_SwitchRun();
	Wall_LedgeTurn();

	x += xSpeed;
	
	y += ySpeed;

#endregion Movement

#region State Transition

if (instance_exists(obj_Player))
{
	PlayerInRange = (abs(x - obj_Player.x) > 100);
}

if (!Attacked)
{
	if (PlayerInRange)
	{
		//SoldierState = SHRINESOLDIER_STATE.ATTACK;
	}
	else
	{
		SoldierState = SHRINESOLDIER_STATE.WALK;
	}
}

else
{
	SoldierState = SHRINESOLDIER_STATE.HURT;
}

#endregion

#region State Machine

switch(SoldierState)
{
	case SHRINESOLDIER_STATE.WALK:
		
		if (xSpeed != 0) image_xscale = sign(xSpeed);
	
		
		break;
		
	case SHRINESOLDIER_STATE.ATTACK:
		
		break;
		
	case SHRINESOLDIER_STATE.HURT:
		
		image_speed = 0;
		
		xSpeed = lengthdir_x(SoldierSpeed, HitFrom);
		
		break;
}

#endregion