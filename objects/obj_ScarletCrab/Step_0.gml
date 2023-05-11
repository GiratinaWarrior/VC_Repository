/// @description Insert description here
// You can write your code in this editor

ySpeed = ySpeed + Gravity;

#region Contact

//dont walk off and die
if (!place_meeting(x + xSpeed + (sign(xSpeed) * 103), y + 10, obj_WallPlatform)) && (Grounded) && (AfraidOfHeights)
{
	xSpeed *= -1;
}



if (!place_meeting(x, y + 10, obj_WallPlatform)) {
	
	Grounded = false;
}

else {
	
	Grounded = true;
}

#endregion

#region Horizontal

if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
	while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
	{
		x = x + sign(xSpeed);
	}

	xSpeed *= -1;

}

x = x + xSpeed;

#endregion

#region Border Contact

if (xSpeed != 0) image_xscale = -sign(xSpeed);

#endregion

#region Vertical

//if the object is touching a platform
if (place_meeting(x, y + ySpeed, obj_WallPlatform)){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed = 0;
}

y = y + ySpeed;

#endregion

#region Shooting

//Check if this instance can shoot
if (CanShoot) && (instance_exists(obj_NewPlayer))
{
	
	var InRange = false;
	
	//Check the distance between the Scarlet Crab and the Player
	var XDist = point_distance(x, y, obj_NewPlayer.x, obj_NewPlayer.y);
	
	var YDist = y - obj_NewPlayer.y;
	
	var ObstructShot = collision_line(x, y, obj_NewPlayer.x, obj_NewPlayer.y, obj_WallPlatform, false, false);
	
	if (XDist <= global.xrange && (abs(YDist) <= 50) && !ObstructShot)
	{
		InRange = true;
	}
	
	else 
	{
		InRange = false;
	}
	
	if (InRange)
	{
		ScarletCrab_Shoot();
	}
	
	else 
	{
		sprite_index = spr_ScarletCrab;
		xSpeed = CrabSpeed * -image_xscale;
		//image_index = 0;
	}
	
	
}//end if can shoot

#endregion

//If Scarlet Crab is not attacking
if (sprite_index != spr_ScarletCrabShoot)
{
	
	//Choose a sprite depending on if it's moving or not
	switch(xSpeed)
	{
		case 0:
			sprite_index = spr_ScarletCrabStill;
			break;
			
		default:
			sprite_index = spr_ScarletCrab;
			break;
	}//end switch xSpeed
	
}//end if not attacking