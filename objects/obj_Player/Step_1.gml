//@description When the player dies

if (global.Health <= 0)
{		
	instance_change(obj_PlayerDying, true);
}//end if player should be dead