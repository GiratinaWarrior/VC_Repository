/// @description Insert description here
// You can write your code in this editor

image_yscale += 0.7;

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




