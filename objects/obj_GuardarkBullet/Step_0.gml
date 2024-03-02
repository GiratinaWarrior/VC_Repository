/// @description

x += xSpeed;

if (abs(x - xstart) > GuardarkBullet_MaxDistance)
{
	Damage = 0;
	FadeAndDestroy(0.1);
}

