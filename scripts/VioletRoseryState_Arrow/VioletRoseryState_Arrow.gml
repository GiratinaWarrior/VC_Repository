// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VioletRoseryState_Arrow(){
	
	//If VR has the default sprite displayed, change it to the arrow phase transition sprite
	if (sprite_index == spr_VioletRosery)
	{
		image_index = 0;
		sprite_index = spr_VioletRoseryArrowTrans;
		//show_debug_message("Trans Activated");
	}//end arrow phase transition sprite change
	
	//If VR has ended the Arrow Phase transition animation, change it to the shooting sprite
	else if (sprite_index == spr_VioletRoseryArrowTrans)
	{
		//show_debug_message("Check Trans Activated");
		if (image_index >= 7)
		{
			image_speed = 0;
			sprite_index = spr_VioletRoseryArrowShoot;
			//show_debug_message("Transhoot Activated");
		}
	}
	//If VR is shooting arrows
	else if (sprite_index == spr_VioletRoseryArrowShoot)
	{
		image_speed = 1;
		image_index = 0;
		
		//If a certain amount of arrows have been shot, end this phase
		if (NumOfArrows >= MaxArrows)
		{
			CurrentAttack = VR_PHASE.REST; 
			NumOfArrows = 0;
		}//end if arrows shot a lot
		
		//if the arrows shot hasn't reached the maximum allowed, keep shooting
		else
		{
			//The arrow direction is changed relative to the players position
			if (instance_exists(obj_NewPlayer))
			{
				ArrowDir = point_direction(x, y, obj_NewPlayer.x, obj_NewPlayer.y);
			}//end set arrow direction
	
			//Create an arrow
			with (instance_create_layer(x - (42 * image_xscale), y + 11, layer, obj_FeralArrows))
			{
				direction = other.ArrowDir; //set its direction
				image_angle = direction; //set its angle
				
				image_index = 0;
	
			}//end create arrow
			
			//Increment the number of arrows shot
			NumOfArrows++;
			
		}//end if arrows allowed to be shot
	}
	
}//end script