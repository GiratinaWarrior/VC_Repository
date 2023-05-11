/// @description Actions

//Make King Chimarine face the player
if (instance_exists(obj_NewPlayer))
{
	
	if (obj_NewPlayer.x >= x)
	{
		image_xscale = -1;
	}
	
	else 
	{
		image_xscale = 1;
	}
	
}

//If King Chimarine is not attacking
if (CurrentAttack == KC_PHASE.REST)
{
	
	PhaseChange += PhaseChangeRise;
	
	if (PhaseChange > PhaseLimit)
	{
	
		ChosenAttack = NextAttack;//choose(1, 2, 3);
	
		switch(ChosenAttack)
		{
			case KC_PHASE.LIGHTNING:
				CurrentAttack = KC_PHASE.LIGHTNING;
				if (!SeenAllAttack)
				{
					NextAttack = KC_PHASE.ACID;
				}
				else
				{
					NextAttack = choose(1, 2, 3);
				}
				break;
			
			case KC_PHASE.ACID:
				if (!SeenAllAttack)
				{
					NextAttack = KC_PHASE.CONJURE;
				}
				else
				{
					NextAttack = choose(1, 2, 3);
				}
				CurrentAttack =  KC_PHASE.ACID;
				break;
			
			case KC_PHASE.CONJURE:
				CurrentAttack = KC_PHASE.CONJURE;
				NextAttack = choose(1, 2, 3);
				SeenAllAttack = true;
				break;
			
			default:
				CurrentAttack = KC_PHASE.REST;
				break;
	
		}//end switch case
		
		PhaseChange = 0;
	}//end if it's time to attack
	
}//end if King Chimarine is resting

//If King Chimarine is attacking with Lightning
else if (CurrentAttack == KC_PHASE.LIGHTNING)
{
	//Increase the Bolt Timer, the length the phase lasts for
	BoltTimer++;
	
	//If the phase is ongoing
	if (BoltTimer < BoltLimit)
	{
		
		sprite_index = spr_KingChimarineLightning;
		
		TravelSpeed = 0;
		
		//Create a Mutant Cloud
		if (!instance_exists(obj_MutantCloud))
		{
			//Create a mutant cloud
			with (instance_create_layer(room_width/2, 128, "KingChimarine", obj_MutantCloud))
			{
				image_xscale = 6;
				alarm[0] = 120;
			}//end with Mutant Cloud
		}//end check if Mutant Cloud exists
	
	}//end ongoing bolt phase
	
	else 
	{
		BoltTimer = 0;
		sprite_index = spr_ChimeraSapphire;
		CurrentAttack = KC_PHASE.REST;
		TravelSpeed = OriginalSpeed;
	}
	
}//end lightning attack

//If King Chimarine is attacking with Conjure
else if (CurrentAttack == KC_PHASE.CONJURE)
{
	//If the animation for the start has not started yet
	if (sprite_index != spr_KingChimarineConjure)
	{
		sprite_index = spr_KingChimarineConjureStart;
	}
	
	//If the beginning animation is finished
	if (animation_end(spr_KingChimarineConjureStart))
	{
		sprite_index = spr_KingChimarineConjure;
	}
	
	//While the Conjure animation is active
	//While crap is happening
	if (sprite_index == spr_KingChimarineConjure)
	{
		
		//KC_Damage = 1/8;
		
		ConjureTimer += 1;
		
		if (!alarm[0])
		{
			alarm[0] = ConjureRate;
		}
		
		if (ConjureTimer > ConjureLimit)
		{
			sprite_index = spr_ChimeraSapphire;
			ConjureTimer = 0;
			CurrentAttack = KC_PHASE.REST;
			//KC_Damage = 1/4;
		}
		
	}//while Conjure is active
	
	
}

//If King Chimarine is attacking with Acid
else if (CurrentAttack == KC_PHASE.ACID)
{
	
	sprite_index = spr_KingChimarineAcidic;
	
	if (AcidTimer < 1)
	{
		audio_play_sound(sound_AcidSignal, 100, false);
	}
	
	AcidTimer += 1;
	
	//If the player has been given their warning to step out of the pool
	if (AcidTimer > AcidWarning)
	{
		//Change the waters into acid
		with (obj_BossWater)
		{
			instance_change(obj_BossAcid, true);
		}//end change to acid
	}//end if warning given
	
	//If the Acid Phase is over
	if (AcidTimer > AcidLimit)
	{
		
		AcidTimer = 0;
		
		//change the acid into reglar water
		with(obj_BossAcid)
		{
			instance_change(obj_BossWater, true);
		}//end change to water
		
		sprite_index = spr_ChimeraSapphire;
		
		CurrentAttack = KC_PHASE.REST;
	
		
	}//end Acid Phase Done
	
	
	
	
}//end if Current Attack is Acid

//If the HP Bar is present
if (instance_exists(obj_KCBossHealth))
{
	//If Violet Rosery is alive, they're target will be an invisible object that teleports around the room
	if (obj_KCBossHealth.KC_Health != 0)
	{
		TargetX = obj_KCParabolicMovement.x;
		TargetY = obj_KCParabolicMovement.y;
			
		//Violet Rosery will move towards their target
		move_towards_point(TargetX, TargetY, TravelSpeed);
			
	}//end if HP is not 0
		
}//end if HP bar exists
