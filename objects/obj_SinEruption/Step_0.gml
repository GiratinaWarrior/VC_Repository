/// @description Insert description here
// You can write your code in this editor

image_yscale += SinEruption_RiseSpeed;

if (image_yscale >= 30)
{
	image_alpha -= 0.1;
	
	if (image_alpha < 0)
	{
		instance_destroy();
	}
	
	else if (image_alpha <= 0.7)
	{
		Damage = 0;
	}
	
}




