/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_DivineArsenal_Portal))
{
	DivineArsenalWeapon_DistFromPortal = abs(x - obj_DivineArsenal_Portal.x);
}

x += xSpeed;

if (x < 0 || x > room_width)
{
	instance_destroy();
}


