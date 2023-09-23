/// @description

x += xSpeed;

if (abs(y - ystart) > GuardarkBullet_MaxDistance)
{
	image_alpha -= 0.1;
	Damage = 0;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

