/// @description Insert description here
// You can write your code in this editor
image_alpha -= 0.5;
if (image_alpha < 1.5)
{
	Damage = 0;
}

if (image_alpha < 0)
{
	instance_destroy();
}