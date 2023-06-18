/// @description When it hits a wall
if (place_meeting(x, y, obj_Wall) && room != Room_OceanBoss)
{
	instance_destroy();	
}

if (x >= room_width + 40 || x < -40)
{
	instance_destroy();
}