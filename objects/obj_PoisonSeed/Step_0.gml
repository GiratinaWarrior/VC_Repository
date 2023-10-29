/// @description Insert description here
// You can write your code in this editor

y += ySpeed;

if (ySpeed < 0) && (y < -100)
{
	x = PoisonSeed_TargetX;
	ySpeed *= -1;
}

else if (ySpeed > 0) && (place_meeting(x, y + ySpeed, obj_Wall))
{
	ySpeed = 0;
	instance_create_layer(x, y + ySpeed, layer, obj_PoisonFlower);
	instance_destroy();
}