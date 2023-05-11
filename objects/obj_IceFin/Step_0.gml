/// @description Step
ySpeed += Gravity;

//if the ice is touching a platform, and it's not the super one
if (place_meeting(x, y + ySpeed, obj_WallPlatform) && room != Room_OceanBoss){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed = 0;
	image_index = 1;
	Damage = 0;
	meltrate = 0.025;
	image_alpha -= meltrate;
}

y = y + ySpeed;

if (image_alpha < 0)
{
	instance_destroy();
}

if (y > room_height + 40) instance_destroy();