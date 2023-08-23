/// @description

if (place_meeting(x, y, obj_Wall))
{
	instance_destroy();
}

if (x <= -50 || x >= room_width + 50)
{
	instance_destroy();
}

