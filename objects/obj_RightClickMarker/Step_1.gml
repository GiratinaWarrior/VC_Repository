/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(Creator) || Creator == noone)
{
	instance_destroy();
}
else
{
	x = Creator.x + Marker_OffsetX;
	y = Creator.y + Marker_OffsetY; 
}


