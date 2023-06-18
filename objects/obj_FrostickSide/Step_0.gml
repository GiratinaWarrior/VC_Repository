/// @description Actions

xSpeed += Gravity;

if (ySpeed != 0)
{
	image_yscale = sign(ySpeed);
}

#region Vertical movement? 

//dont walk off and die
if (!place_meeting(x - Frostick_Orient, y + ySpeed + (sign(ySpeed) * 37.5), obj_Wall)) && (Grounded) && (AfraidOfHeights)
{
	ySpeed *= -1;
}

//If were not on the ground, then we're not on the ground
if (!place_meeting(x - (10 * Frostick_Orient), y, obj_Wall)) {
	
	Grounded = false;

}

//If we're on the ground, then we're on the ground
else {
	
	Grounded = true;
}


if (place_meeting(x + xSpeed, y, obj_Wall)){
	
	while(!place_meeting(x + sign(xSpeed), y, obj_Wall))
	{
		x = x + sign(xSpeed);
	}

	xSpeed = 0;

}

x = x + xSpeed;

#endregion 

#region Horizontal movement?

//if the object is touching a platform
if (place_meeting(x, y + ySpeed, obj_Wall)){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_Wall))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed *= -1;
}

y = y + ySpeed;

#endregion