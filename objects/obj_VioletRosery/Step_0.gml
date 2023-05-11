/// @description Violet Rosery's State Machine

//Make Violet Rosery face the player
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
	
}//end face player

switch(CurrentAttack)
{
	case VR_PHASE.REST:
		//Display the default sprite
		sprite_index = spr_VioletRosery;
		
		//Stop the Laughing cry
		audio_stop_sound(sound_FrenzyLaugh);
		
		//If the State change incrementation reaches a certain value
		if (PhaseChange > PhaseLimit)
		{
			
			CurrentAttack = NextAttack;
			PhaseChange = 0;
			
		}//end Phase should change
		
		//Increment the state change value
		else
		{
			PhaseChange++;
		}
		
		break; //end rest phase
		
	case VR_PHASE.ARROW:
		if (!alarm[1])
		{
			alarm[1] = ArrowTimer;
			
			if (alarm_get(1) < ArrowTimer * 0.25)
			{
				part_system_position(ArrowCharge, x - (42 * image_xscale), y + 11);
			}
			
		}
		
		NextAttack = VR_PHASE.TURMOIL;
		break;
		
	case VR_PHASE.TURMOIL:
		if (!alarm[2])
		{
			alarm[2] = TurmoilTimer;
		}
		NextAttack = VR_PHASE.FRENZY;
		break;
		
	case VR_PHASE.FRENZY:
		VioletRoseryState_Frenzy();
		NextAttack = VR_PHASE.ARROW;
		break;
	
}
