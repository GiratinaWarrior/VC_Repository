/// @description Insert description here
// You can write your code in this editor

y += ySpeed;
Wall_FallOn();

//state machine for the poison flower
switch(PoisonFlower_State)
{
	//Grow State: The poison flower grows into place
	case POISONFLOWER_STATE.GROW:
	
		sprite_index = spr_PoisonFlower_Rise;
		
		AnimationStopAtEnd(spr_PoisonFlower_Rise);
		
		if (image_speed == 0)
		{
			PoisonFlower_State = POISONFLOWER_STATE.IDLE;
		}
		
		
		break;//end Grow State
		
	//Idle State: The flower is in cooldown from shooting
	case POISONFLOWER_STATE.IDLE:
	
		if (PoisonFlower_ShootTimer-- < 0)
		{
			PoisonFlower_State = POISONFLOWER_STATE.SHOOT;
			PoisonFlower_StateShoot = POISONFLOWER_STATE_SHOOT.SQUISH;
			PoisonFlower_ShootTimer = PoisonFlower_ShootTimerCooldown;
		}
	
		break;//end Idle State
		
	//Shoot State: The poison flower shoots an attack
	case POISONFLOWER_STATE.SHOOT:
	
			//Shoot stage machine
			switch(PoisonFlower_StateShoot)
			{
				//squish stage
				case POISONFLOWER_STATE_SHOOT.SQUISH:
					
					image_yscale = max(image_yscale - PoisonFlower_SquishRate, 1/PoisonFlower_MaxSquish);
					image_xscale = min(image_xscale + PoisonFlower_SquishRate, PoisonFlower_MaxSquish);
					
					if (image_xscale == PoisonFlower_MaxSquish  && image_yscale == 1/PoisonFlower_MaxSquish)
					{
						PoisonFlower_StateShoot = POISONFLOWER_STATE_SHOOT.STRETCH;
					}
					
					break;//end squish stage
					
				//stretch stage
				case POISONFLOWER_STATE_SHOOT.STRETCH:
				
					image_xscale = max(image_xscale - PoisonFlower_SquishRate, 1/PoisonFlower_MaxSquish);
					image_yscale = min(image_yscale + PoisonFlower_SquishRate, PoisonFlower_MaxSquish);
					
					if (image_yscale == PoisonFlower_MaxSquish  && image_xscale == 1/PoisonFlower_MaxSquish)
					{
						PoisonFlower_StateShoot = POISONFLOWER_STATE_SHOOT.BULLET;
					}
					
					break;//end stretch stage
				
				//bullet stage
				case POISONFLOWER_STATE_SHOOT.BULLET:
					
					if (PoisonFlower_FireLengthTimer++ < PoisonFlower_FireLength)
					{
						if (PoisonFlower_FireTimer-- < PoisonFlower_FireRate)
						{
							
							audio_play_sound(sound_PoisonBubble, 5, false, 0.2);
							
							with(instance_create_layer(x, y - sprite_height - 5, layer, obj_PoisonBubble))
							{
								PoisonBubble_Wave = random(360);
								image_xscale = 0;
								image_yscale = image_xscale;
							}
							
							PoisonFlower_FireTimer = PoisonFlower_FireRate;
						}
					}
					else
					{
						PoisonFlower_StateShoot = POISONFLOWER_STATE_SHOOT.RETURN;
						PoisonFlower_FireTimer = 0;
						PoisonFlower_FireLengthTimer = 0;
					}
						
					break;//end bullet stage
				
				//return stage
				case POISONFLOWER_STATE_SHOOT.RETURN:
		
					image_yscale = max(1, image_yscale - PoisonFlower_SquishRate);
					image_xscale = min(1, image_xscale + PoisonFlower_SquishRate);
					
					if (image_xscale == image_yscale == 1)
					{
						PoisonFlower_State = POISONFLOWER_STATE.IDLE;
					}
						
					break;//end return stage
					
				
			}//end shoot stage machine
		
		break;//end Shoot State
		
	//Die State: The flower is cut up and dies
	case POISONFLOWER_STATE.DIE:
	
		image_speed = 1;
		
		AnimateAndDestroy(spr_PoisonFlower_Death);
	
		break;//end Die State
		
}//end state machine






