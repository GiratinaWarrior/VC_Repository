///Blood Petals
function LavenderBossBattle_Prologue_BloodPetals()
{

	var _fadeTarget = 0.5;

	if (sprite_index == spr_Lavender_BloodPetal_Charge)
	{
		image_alpha = map(image_index, 0, image_number - 1, 1, _fadeTarget);
	}
	else if (sprite_index == spr_Lavender_BloodPetal)
	{
		image_alpha = _fadeTarget;
	}
	else if (sprite_index == spr_Lavender_BloodPetal_Decharge)
	{
		image_alpha = map(image_index, 0, image_number - 1, _fadeTarget, 1);	
	}

	//Lavender faces the player
	if (instance_exists(obj_Player))
	{
	
		image_xscale = -sign(x - obj_Player.x);
	
	}//end face player
			
	if (LavenderBossBattlePrologue_BloodPetals_ParticleCreated == false)
	{
		Enemy_Invincible = true;
				
		if (sprite_index != spr_Lavender_BloodPetal_Charge)
		{
			image_index = 0;
			LavenderBossBattlePrologue_BloodPetals_Particle = instance_create_layer(x, y, "BloodPetal", obj_BloodPetalSignal);
			audio_play_sound(sound_BloodPetalSignal, 200, false);
			sprite_index = spr_Lavender_BloodPetal_Charge;
		}
			
		else if (image_index == image_number - 1)
		{
			sprite_index = spr_Lavender_BloodPetal;
			LavenderBossBattlePrologue_BloodPetals_ParticleCreated = true;	
		}
		
	}
			
	else
	{
				
		if (sprite_index == spr_Lavender_BloodPetal_Charge)
		{
			
			if (animation_end())
			{
				sprite_index = spr_Lavender_BloodPetal;
				image_index = 0;
			}
		}
		
		if (LavenderBossBattlePrologue_MaxPetalTimer++ < LavenderBossBattlePrologue_MaxPetalTimerLimit)
		{
			Enemy_Invincible = true;
			if (LavenderBossBattlePrologue_PetalTimer++ > LavenderBossBattlePrologue_PetalRate)
			{
				var petalX = obj_Camera.x + (random_range(-1, 1) * 700);
				var petalY = -random_range(50, 150);
				
				with(instance_create_layer(petalX, petalY, "BloodPetal", obj_BloodPetal))
				{
					xSpeed  = random_range(4, 7);
					ySpeed  = xSpeed;
				}
				LavenderBossBattlePrologue_PetalTimer = 0;
			}	
		}
		
		else
		{
			if (sprite_index == spr_Lavender_BloodPetal)
			{
				image_index = 0;
				sprite_index = spr_Lavender_BloodPetal_Decharge;
			}
			
			else if (animation_end(spr_Lavender_BloodPetal_Decharge))
			{
				sprite_index = spr_Lavender_Levitate;
				LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;
				LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.POISON_GARDEN;
				LavenderBossBattlePrologue_PetalTimer = 0;
				LavenderBossBattlePrologue_MaxPetalTimer = 0;
				Enemy_Invincible = false;
				LavenderBossBattlePrologue_BloodPetals_Particle = noone;
				LavenderBossBattlePrologue_BloodPetals_ParticleCreated = false;
			}
			
			
					
		}
				
	}
	
	
}//end function
	
function LavenderBossBattle_Prologue_PoisonGarden()
{
	
	//Lavender faces the player
	if (instance_exists(obj_Player))
	{
	
		image_xscale = -sign(x - obj_Player.x);
	
	}//end face player
			
	if (sprite_index == spr_Lavender_Levitate) && !(LavenderBossBattlePrologue_SeedsPlanted)
	{
		if !(instance_exists(obj_PoisonFlower))
		{
			if (image_index == image_number - 1)
			{
				sprite_index = spr_Lavender_PoisonGarden_Charge;
				image_index = 0;
			}
		}
				
		else
		{
			LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;
			LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.BLOOD_PETALS;
			LavenderBossBattlePrologue_SeedsMade = 0;
			LavenderBossBattlePrologue_SeedFireRate = 0;
			LavenderBossBattlePrologue_SeedsPlanted = false;
		}
					
	}
			
	else if (sprite_index == spr_Lavender_PoisonGarden_Charge)
	{
		if (image_index == image_number - 1)
		{
			sprite_index = spr_Lavender_PoisonGarden;
			image_index = 0;
			LavenderBossBattlePrologue_NumberOfPoison = irandom_range(LavenderBossBattlePrologue_MinPoison, LavenderBossBattlePrologue_MaxPoison);
		}
	}
			
	else if (sprite_index == spr_Lavender_PoisonGarden)
	{
		if !(LavenderBossBattlePrologue_SeedsPlanted) 
		{	
			//if all the seeds havent been made
			if (LavenderBossBattlePrologue_SeedsMade < LavenderBossBattlePrologue_NumberOfPoison)
			{
				//if the seed cooldown rate is finished
				if (LavenderBossBattlePrologue_SeedCooldown-- < LavenderBossBattlePrologue_SeedFireRate)
				{
			
					audio_play_sound(sound_PoisonSeed, 150, false);
			
					with(instance_create_layer(x, y, "PoisonGarden", obj_PoisonSeed))
					{
						PoisonSeed_TargetX = map(other.LavenderBossBattlePrologue_SeedsMade, 0, other.LavenderBossBattlePrologue_NumberOfPoison, 500, 1400)//irandom_range(480 + _range, 720 - _range);
					}
			
					LavenderBossBattlePrologue_SeedCooldown = LavenderBossBattlePrologue_SeedFireRate;
					LavenderBossBattlePrologue_SeedsMade++;
				}//end time to create a seed
		
			}//end not all seeds
	
			//If all of the seeds have been made
			else
			{
				TimeSourceCreateAndStart(120, function(){LavenderBossBattlePrologue_SeedsPlanted = true});
			}
		}//end seeds not planted
		else 
		{
			sprite_index = spr_Lavender_PoisonGarden_Decharge;
			image_index = 0;
		}
	}
			
	else if (sprite_index = spr_Lavender_PoisonGarden_Decharge)
	{
		if (image_index == image_number - 1)
		{
			sprite_index = spr_Lavender_Levitate;
			image_index = 0;
		}
	}
			
	else
	{
		LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;
		LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.DIVINE_ARSENAL;
		LavenderBossBattlePrologue_SeedsMade = 0;
		LavenderBossBattlePrologue_SeedFireRate = 0;
		LavenderBossBattlePrologue_SeedsPlanted = false;
	}
	
}//end function

function LavenderBossBattle_Prologue_DivineArsenal()
{
	//If Lavender hasnt started charging
	if !(LavenderBossBattlePrologue_PortalCreated) && (sprite_index == spr_Lavender_Levitate)
	{
		if (image_index >= image_number - 1)
		{
			image_index = 0;
			sprite_index = spr_Lavender_DivineArsenal_Charge;
		}
				
	}//end lavender not start charging
	
	//If Lavender is charging
	else if (sprite_index == spr_Lavender_DivineArsenal_Charge)
	{
		if (image_index >= image_number - 1)
		{
			image_index = 0;
			sprite_index = spr_Lavender_DivineArsenal;
		}
	}//end lavender charging
	
	//If Lavender is ready
	else if (sprite_index == spr_Lavender_DivineArsenal)
	{
		
		var _ySpe = 2;
		var _xSpe = 5;
		
		var _yTarget = 100;
		var _xTarget = 1440 - (0.5 * sprite_get_width(spr_DivineArsenal_Portal));
		
		//rise up out of reach
		y = max(_yTarget, y - _ySpe);
		
		if (x > _xTarget)
		{
			x = max(_xTarget, x - _xSpe);
		}
		
		else if (x < _xTarget)
		{
			x = min(_xTarget, x + _xSpe);
		}
			
		
			
		//If the portal hasnt been made yet, make it
		if !(LavenderBossBattlePrologue_PortalCreated) && (x == _xTarget) && (y == _yTarget)
		{
			LavenderBossBattlePrologue_Portal = instance_create_layer(1440 - (0.5 * sprite_get_width(spr_DivineArsenal_Portal)), 352 - (0.5 * sprite_get_height(spr_DivineArsenal_Portal)), "DivineArsenal", obj_DivineArsenal_Portal);
			LavenderBossBattlePrologue_PortalCreated = true;
		}
		//If the portal has been created
		else
		{
			
			//Lavender faces the player
			if (instance_exists(obj_Player))
			{
	
				image_xscale = -sign(x - obj_Player.x);
	
			}//end face player
			
			//If this state is finished
			if (LavenderBossBattlePrologue_DivineArsenal_StateTimer++ > LavenderBossBattlePrologue_DivineArsenal_StateTimerLimit)
			{
				//Make the Portal disappear
				with(LavenderBossBattlePrologue_Portal)
				{
					if (DivineArsenalPortal_ShootTimer == 0) DivineArsenalPortal_State = DIVINEARSENALPORTAL_STATE.DISAPPEAR;
				}//end disappear portal
				
				//Once the portal has been destroyed
				if !(instance_exists(obj_DivineArsenal_Portal))
				{
					if (image_index == image_number - 1)
					{
						image_index = 0;
						sprite_index = spr_Lavender_DivineArsenal_Decharge;
					}
					LavenderBossBattlePrologue_Portal = noone;
				}
			
			}//end state ongoing
			
		}//end portal created
		
	}//end ready
	
	else if (sprite_index == spr_Lavender_DivineArsenal_Decharge)
	{
		if (image_index == image_number - 1)
		{
			sprite_index = spr_Lavender_Levitate;
		}
	}
	
	else if (LavenderBossBattlePrologue_PortalCreated) && (sprite_index == spr_Lavender_Levitate)
	{
		
		var _ySpe = 2;
		var _xSpe = 5;
		
		var _yTarget = 204;
		var _xTarget = 960;
		
		//rise up out of reach
		y = min(_yTarget, y + _ySpe);
		
		if (x > _xTarget)
		{
			x = max(_xTarget, x - _xSpe);
		}
		else if (x < _xTarget)
		{
			x = min(_xTarget, x + _xSpe);
		}
		
		if (x == _xTarget && y == _yTarget)
		{
			LavenderBossBattlePrologue_CurrentState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE;
			LavenderBossBattlePrologue_NextState = LAVENDERBOSSBATTLE_PROLOGUE_STATE.BLOOD_PETALS;
			LavenderBossBattlePrologue_PortalCreated = false;
			LavenderBossBattlePrologue_DivineArsenal_StateTimer = 0;
		}
	}	
	
}//end function