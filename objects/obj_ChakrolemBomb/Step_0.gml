/// @description Insert description here

//If the Chakrolem is still alive
if (instance_exists(ChakrolemBomb_Creator))
{
	//Check the Chakrolems State
	switch(ChakrolemBomb_Creator.Chakrolem_State)
	{
		//If the Chakrolem is charging the explosion
		case CHAKROLEM_STATE.CHARGE:
		
			//Set the damage to 0
			Damage = 0;
		
			//Set the image alpha to correspond to the image index
			//So that as the charge animation plays, the bomb appears
			image_alpha = map(ChakrolemBomb_Creator.image_index, 0, ChakrolemBomb_Creator.image_number - 1, 0, 1);
		
			break;//end Chakrolem charge
	
		//If the Chakrolem is ready to explode
		case CHAKROLEM_STATE.EXPLODE:
			
			instance_destroy(ChakrolemBomb_Creator);
		
			break;//end Chakrolem explode
			
		default:
			ChakrolemBomb_Creator.Chakrolem_Bomb = noone;
			instance_destroy();
			break;
		
	}
}

//If Chakrolem is gone
else
{
	//Set the damage
	Damage = 5;
	
	//Make the bomb expand
	image_xscale += ChakrolemBomb_Grow;
	image_yscale = image_xscale;
		
	//If the bomb has reached a certain size
	if (image_xscale >= 8)
	{
		//Reset the damage, and destroy the creator
		Damage = 0;
		FadeAndDestroy(0.1);
		ChakrolemBomb_Grow *= 0.9;
	}
}

image_angle -= 4 * 10;
