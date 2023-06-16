/// @description Moving out of range

var _currentDist = abs(point_distance(x, y, RapidPunch_MainBody.x, RapidPunch_MainBody.y));

//If the Rapid Punch has reached a certain distance away from the main body, stop moving and fade out
if (_currentDist > RapidPunch_MaxDist)
{
	image_alpha -= 0.1;
	//speed = 0;
}

if (image_alpha < RapidPunch_StartFade)
{
	Damage = 0;
}

//If the Rapid Punch has completely faded out, destroy itself
if (image_alpha <= 0)
{
	instance_destroy();
}