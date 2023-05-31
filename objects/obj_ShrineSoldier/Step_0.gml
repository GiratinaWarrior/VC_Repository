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

if (Health > 0)
{
	if (instance_exists(obj_Player))
	{
		PlayerInRange = (abs(x - obj_Player.x) < 100 && abs(y - obj_Player.y) < 32);
	}
	else
	{
		PlayerInRange = false;
	}

	if (Attacked)
	{
		SoldierState = SHRINESOLDIER_STATE.HURT;
	}
}
else
{
	SoldierState = SHRINESOLDIER_STATE.DEFEAT;
}

#endregion

#region State Machine

switch(SoldierState)
{
	case SHRINESOLDIER_STATE.WALK:
		
		sprite_index = spr_ShrineSoldierWalk;
		
		image_speed = 1;
		
		if (xSpeed != 0) image_xscale = sign(xSpeed);
		
		if (PlayerInRange)
		{
			SoldierState = SHRINESOLDIER_STATE.ATTACK;
		}
		
		break;
		
	case SHRINESOLDIER_STATE.ATTACK:
		
		ShrineSoldierState_Attack()
		
		break;
		
	case SHRINESOLDIER_STATE.HURT:
		
		sprite_index = spr_ShrineSoldierWalk;
		
		image_speed = 0;
		
		xSpeed = lengthdir_x(SoldierSpeed, HitFrom);
	
		x += xSpeed;
	
		instance_destroy(ShrineSoldierAttackHitbox);
		
		break;
		
	case SHRINESOLDIER_STATE.DEFEAT:
	
		ShrineSoldierState_Defeat();
	
		break;
		
}

#endregion