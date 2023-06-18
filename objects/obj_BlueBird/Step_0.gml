/// @description Blue Bird Actions

#region Wall Contact

if (place_meeting(x + xSpeed, y, obj_Wall)){
	
	while(!place_meeting(x + sign(xSpeed), y, obj_Wall))
	{
		x = x + sign(xSpeed);
	}

	xSpeed *=- 1;

}

x += xSpeed;

if (xSpeed != 0) image_xscale = sign(xSpeed);

#endregion

#region Icicle Attack

//If Ice ready to be shot, shoot ice
if (!alarm[0])
{
	alarm[0] = IceTimer;
}

#endregion