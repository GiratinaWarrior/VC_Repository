// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScarletCrab_Shoot(){

	xSpeed = 0;
		
	y = y + ySpeed;
	
	image_speed = 1;
		
	if (room = Room_OceanBoss)
	{
		sprite_index = spr_ConjuredCrabShoot;	
	}
	
	else
	{
		sprite_index = spr_ScarletCrabShoot;
	}
	
	
	
	image_xscale = sign(x - obj_NewPlayer.x);
	
	if (image_index == 4)
	{
		//If these are Conjured Crabs	
		if (room == Room_OceanBoss)
		{
			with (instance_create_layer(x - (image_xscale * 20), y, "KingChimarine", obj_CrabBlast))
			{
				sprite_index = spr_ConjuredCrabBlast;
				//speed = 10 * -other.image_xscale;
				xAccel = 0.5 * -other.image_xscale;
				Damage = 3;
				image_index = 1;
			}//end with Crab Blast
		}
		
		//If they're normal crabs
		else
		{
			with (instance_create_layer(x - (image_xscale * 20), y, "ScarletCrab", obj_CrabBlast))
			{
				speed = 10 * -other.image_xscale;
				Damage = 2;
				image_index = 1;
			}//end with Crab Blast
		}
		
	}//if the Scarlet Crab animation is at the shoot frame

	if (animation_end())
	{
		sprite_index = spr_ScarletCrab;
		xSpeed = CrabSpeed;
		image_speed = 1;
	}


}//end ScarletCrab_Shoot