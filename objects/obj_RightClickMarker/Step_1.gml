/// @description Insert description here
// You can write your code in this editor

if (Creator == noone) || !(instance_exists(Creator))
{
	instance_destroy();
}
else
{
	Marker_OffsetX = Creator.TextMarker_OffsetX;
	Marker_OffsetY = Creator.TextMarker_OffsetY;
	x = Creator.x + Marker_OffsetX;
	y = Creator.y + Marker_OffsetY; 
}


