/// @description Actions

ySpeed += Gravity;

if (xSpeed != 0)
{
	image_xscale = sign(xSpeed);
}

#region Horizontal movement

//dont walk off and die
if (!place_meeting(x + xSpeed + (sign(xSpeed) * 37.5), y + (1 * Frostick_Orient), obj_Wall)) && (Grounded) && (AfraidOfHeights)
{
	xSpeed *= -1;
}

//If were not on the ground, then we're not on the ground
if (!place_meeting(x, y + (10 * Frostick_Orient), obj_Wall)) {
	
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

	xSpeed *=- 1;

}

x = x + xSpeed;

#endregion 

#region Vertical movement

//if the object is touching a platform
if (place_meeting(x, y + ySpeed, obj_Wall)){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_Wall))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed = 0;
}

y = y + ySpeed;

#endregion