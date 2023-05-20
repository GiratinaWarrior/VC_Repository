/// @description Insert description here
// You can write your code in this editor
/// @description Blue Bird Actions

#region Wall Contact

if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
	while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
	{
		x = x + sign(xSpeed);
	}

	xSpeed *=- 1;

}

x += xSpeed;

if (xSpeed != 0) image_xscale = sign(xSpeed);

#endregion

#region Icicle Attack

//check if the player exists
if (instance_exists(obj_Player))
{
	//Check if they're in range
	if (abs(obj_Player.x - x) < 100)
	{
		//If unactivated, activate
		if (!alarm[0])
		{
			alarm[0] = IceTimer;
		}//end alarm
		
	}//end check in range
	
	else 
	{
		IceTimer = IceCharge;
	}
	
}//end if the Player is present

#endregion