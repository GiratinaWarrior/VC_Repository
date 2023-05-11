// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VioletRoseryState_Turmoil(){

	//Transition to the Turmoil Charge Mode
	if (sprite_index = spr_VioletRosery)
	{
		image_index = 0;
		sprite_index = spr_VioletRoseryTurmoilTrans;
	}//end Turmoil Charge
	
	//Transition to the Turmoil Attack Mode
	else if (sprite_index == spr_VioletRoseryTurmoilTrans)
	{
	
		layer_y(TurmoilSea, Approach(TurmoilSeaY, 650, 30));
	
		
		//If the animation is about to end
		if (image_index >= 10)
		{
			//image_speed = 0;
			sprite_index = spr_VioletRoseryTurmoil;
			
		}//end if animation end
		
	}//end to turmoil attack mode
	
	//If the Rest In Turmoil attack is charged
	else if (sprite_index == spr_VioletRoseryTurmoil)
	{
	
		image_speed = 1;
		image_index = 0;
	
		TurmoilSeaX = layer_get_x(TurmoilSea);
		TurmoilSeaY = layer_get_y(TurmoilSea);
	
		//If they come down from the sky
		TurmoilX = random_range(480 + sprite_get_width(spr_RestInTurmoil)/2, 1408 - sprite_get_width(spr_RestInTurmoil)/2);
	
		//Change where the Turmoil spawns based on what direction it moves
		switch(TurmoilDir)
		{
			case TURMOILDIR.DOWN: default:
				//If they come down from the sky
				TurmoilY = 0;
				TurmoilSpeed = 5;
				break;
			case TURMOILDIR.UP:
				//If they come up from the earth
				TurmoilY = room_height + 40;
				TurmoilSpeed = -5;
				break;
		}//end turmoil spawn direction
	
		//Summon the Rest in Turmoil attack
		RestInTurmoil(TurmoilX, TurmoilY, TurmoilSpeed);
		
		//Increment the number of turmoils summoned
		NumOfTurmoil++;
	
		//If enough Rest In Turmoils have been summmoned
		if (NumOfTurmoil > MaxTurmoil)
		{
			layer_y(TurmoilSea, Approach(TurmoilSeaY, 750, 10));
			CurrentAttack = VR_PHASE.REST;
			NumOfTurmoil = 0;
			
		}
	
	}//end turmoil charged
	

}