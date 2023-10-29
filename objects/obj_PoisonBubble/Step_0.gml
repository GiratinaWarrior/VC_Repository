/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_PoisonBubble_Pop)
{
	Damage = 0;
	AnimateAndDestroy();
}

x += xSpeed;
y += ySpeed;

image_xscale = min(1, image_xscale + PoisonBubble_Growth);
image_yscale = image_xscale;

ySpeed = -7;

if (image_xscale == 1) && !(PoisonBubble_Charged)
{
	PoisonBubble_Charged = true;
}

else if (PoisonBubble_Charged)
{
	PoisonBubble_Wave += pi/8;
	xSpeed = 2 * sin(PoisonBubble_Wave);
}