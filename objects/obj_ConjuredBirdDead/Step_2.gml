/// @description If they have died
if (Done == 1)
{
	image_alpha -= 0.1;
}

if (image_alpha < 0)
{
	instance_destroy();
}