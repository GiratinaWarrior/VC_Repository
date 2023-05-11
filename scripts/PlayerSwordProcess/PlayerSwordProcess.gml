/// @description PlayerSwordProcess(sprite_index, mask_index)
/// @arg sprite_index
/// @arg mask_index

function PlayerSwordProcess(argument0, argument1){

	var _attackanimation = argument0;
	var _attackhitbox = argument1;

	//start attack
	if (sprite_index !=_attackanimation)
	{
		sprite_index = _attackanimation;
		image_index = 0;
		image_speed = 1;
		var SwordSFX = choose(sound_SwordAttack,sound_SwordAttack2, sound_SwordAttack3, sound_SwordAttack4);
		audio_sound_gain(SwordSFX, 0.05, 0);
		audio_play_sound(SwordSFX, 5000, false);
		ds_list_clear(hitByAttack);
	}//end start attack

	//use hitbox
	mask_index = _attackhitbox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, parent_Enemy, hitByAttackNow, false);
	var counter = instance_place_list(x, y, parent_EnemyAttack, hitByAttackNow, false);
	
	//if an enemy was hit
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not been hit
			var hitID = hitByAttackNow[|i];
			
			//if this instance has not been hit
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				
				//Do a different effect depending on the animation
				switch(_attackanimation)
				{
					//If the player attacked in the air aiming down
					case spr_PlayerAttack_Jump_AimDown: 
						Gravity = Gravity_Jump;
						ySpeed = JumpPower * -1;
						break;
						
					//If the player attacked in the air aiming up
					case spr_PlayerAttack_Jump_AimUp: 
						ySpeed = 0;
						break;
						
					//If the player is the air and aimed in front
					case spr_PlayerAttack_Jump_Neutral:
					//	Knockback(20, point_direction(x, y, hitID.x, hitID.y));
						break;
						
					//If the player is on the ground running
					case spr_PlayerAttack_Run:
						xSpeed = 0;
						break;
					
					default:
					
						break;
				}
				
				//If Violet Rosery was hit
				if (hitID.object_index == obj_VioletRosery)
				{
					//Access VR's health and lower it
					with (obj_VRBossHealth)
					{
						VR_Health -= VR_Damage * global.BossDamage;
					}//end access VR health
					
					//Access Violet Rosery
					with (obj_VioletRosery)
					{

						//Trigger the white flash
						Attacked = true;
						if (!alarm[11])
						{
							alarm[11] = FlashLength;
						}//end Trigger white flash
						
					}//end access VR
		
				}//end VR hit
				
				//If King Chimarine was hit
				else if (hitID.object_index == obj_KingChimarine)
				{
					with (obj_KCBossHealth)
					{
						KC_Health -= KC_Damage * global.BossDamage;
					}
				}
				
				//If the thing hit was not a boss
				else
				{
					//Access the enemy that was hit
					with (hitID)
					{
						//Decrease their health
						Health -= global.SwordDamage;
						//If they die, roll a number to see if the player gets health
						if (Health <= 0)
						{
							//Access the player health
							with(obj_PlayerHealth)
							{
								//Check if the player is not at full HP
								if (global.Health < MaxHealth)
								{
									//Set the chance of rolling a heal to depend on the enemy slain
									var HealChance = other.HealthDrop; //number is between 0 and 1
									var HealRoll = random_range(0, 1);
									
									//If the number is greater a random number between 0 and 1
									if (HealChance > HealRoll)
									{
										//Heal the player
										global.Health++;
									}//end if roll succeeded
									
								}//end if not at full HP
								
							}//end access player health
							
						}//end if enemy is dead
						
						//Play the sound ffect
						audio_play_sound(sound_SwordStrike, 5, false);
						
						//Make the enemy flash white
						Attacked = true;
						if (!alarm[11])
						{

							alarm[11] = FlashLength;

						}//end flash
						
					}//end decrease Health
					
				}//end hit regular enemy
			
				if (hitID.object_index == parent_Enemy)
				{
					xSpeed = image_xscale * -5;
				}
			
			}//end if instance not hit
			
		}//loop that repeats for as many things that were hit
		
	}//if something has been struck
	
	//if an enemy attack was hit
	if (counter > 0)
	{
		for (var i = 0; i < counter; i++)
		{
			//if this instance has not been hit
			var hitID = hitByAttackNow[|i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				
				if (hitID.object_index == parent_EnemyAttack)
				{
					if (!Indestructible)
					{
						instance_destroy();
					}
				}
				
			
			}//end if instance not hit
			
		}//loop that repeats for as many things that were hit
		
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = PlayerSpriteSet[PLAYERSTATE_SPRITE.IDLE];

}