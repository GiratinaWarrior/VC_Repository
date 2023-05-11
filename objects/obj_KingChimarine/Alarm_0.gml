/// @description Conjure The Crabs and Birds
var Spawned = choose(1, 2); 

audio_play_sound(sound_Conjure, 20, false);

switch(Spawned)
{
	//Summon CRAB
	case 1:
		
		//Choose a random platform
		var RandLand = irandom_range(1, 8);
		
		var CrabX;
		var CrabY;
		
		//Choose a platform to spawn on
		switch(RandLand)
		{
			//Top left
			case 1: 
				CrabX = random_range(256, 512);
				CrabY = 192;
				break;
				
			//Top middle
			case 2:	
				CrabX = random_range(864, 1056);
				CrabY = 192;
				break;
				
			//Top right
			case 3:
				CrabX = random_range(1408, 1728);
				CrabY = 192;
				break;
				
			//Middle left
			case 4:
				CrabX = random_range(640, 736);
				CrabY = 320;
				break;
			
			//Middle right
			case 5:
				CrabX = random_range(1184, 1280);
				CrabY = 320;
				break;
			
			//Bottom left
			case 6: 
				CrabX = random_range(256, 512);
				CrabY = 448;
				break;
				
			//Bottom middle
			case 7:	
				CrabX = random_range(864, 1056);
				CrabY = 448;
				break;
				
			//Bottom right
			case 8:
				CrabX = random_range(1408, 1728);
				CrabY = 448;
				break;
			
		}
		
		//Create the Crab
		instance_create_layer(CrabX, CrabY, "KingChimarine", obj_ConjuredCrab);

		
		break; //END SUMMON CRAB

	//Summon BIRD
	default:
		
		instance_create_layer(random_range(128, 1852), random_range(160, 192), "KingChimarine", obj_ConjuredBird);
		
		break;//end SUMMON BIRD
}
