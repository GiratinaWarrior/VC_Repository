//@description When the player dies

if (global.Health <= 0)
{	
	if !(Player_ForcedToLose)
	{
		with(instance_create_depth(x, y, depth - 1, obj_PlayerDying))
		{
			image_xscale = other.image_xscale;
		}
		instance_destroy();
	}
	else
	{
		with(instance_create_depth(x, y, depth - 1, obj_PlayerDefeated))
		{
			image_xscale = other.image_xscale;
		}
		instance_destroy();
	}
}//end if player should be dead