/// @description If hit a wall

//If the players attack hits a wall and they cannot phase through it, destroy itself
if (place_meeting(x, y, obj_Wall) && !CanPhase_Wall)
{
	instance_destroy();	
}
