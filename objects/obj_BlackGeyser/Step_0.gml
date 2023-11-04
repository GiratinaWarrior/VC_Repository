/// @description

image_yscale += 0.4;

if (image_yscale >= 15)
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




