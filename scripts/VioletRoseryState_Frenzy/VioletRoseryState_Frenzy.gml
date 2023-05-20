// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VioletRoseryState_Frenzy(){

var _frenzySpr = [spr_VioletRoseryFrenzyTrans, spr_VioletRoseryFrenzyAwaken, spr_VioletRoseryFrenzy, spr_VioletRoseryFrenzySlumber, spr_VioletRoseryFrenzyRevert];

//If Violet Rosery hasn't begun transforming
if (sprite_index == spr_VioletRosery)
{
	//Change the sprite to the Transformation sprite
	sprite_index = _frenzySpr[0];
	
}//end VR not transformign

//If VR has finished the transformation stage
else if (sprite_index == _frenzySpr[0])
{
	
	//If the animation is about to end 
	if (image_index > image_number - 1)
	{
		//VR's sprite will enter the awakened stage 
		sprite_index = _frenzySpr[1];
		
	}//end animation about to end

}//end VR finished transformation

//If VR has entered the awakened stage
else if (sprite_index == _frenzySpr[1])
{
	
	//If VR has finished the awakened stage
	if (image_index > image_number - 1)
	{
		//VR's sprite will enter the attack stage
		sprite_index = _frenzySpr[2];
	}//end animation about to end

}//end VR finished awakening

//If VR is currently attacking
else if (sprite_index == _frenzySpr[2])
{
	
	//Increment the timer for how long the Frenzy should last
	FrenzyTimer++;
	
	//De-increment the cooldown timer for VR charging at the player 
	FrenzyRushCooldown--;
	
	//Check if the player exists, and if so, proceed with the Frenzy Code
	if (instance_exists(obj_Player))
	{
	
		//If the cooldown is done and the player is still alive, start attacking
		if (FrenzyRushCooldown < 0 && FrenzyRushCooldown >= FrenzyRushFreeze)
		{	
			
			//If VR has not reached it's target, move towards it
			if (point_distance(x, y, FrenzyTargetX, FrenzyTargetY) > 5 && y < 650)
			{
			    move_towards_point(FrenzyTargetX, FrenzyTargetY, FrenzySpeed);
				SpeedTrail();
			}//end VR not reached target
			
			//If VR has reached it's target
			else
			{	
				speed = 0;
				
				if (instance_exists(obj_Trail))
				{
					instance_destroy(obj_Trail);
				}
			}//end VR reached target
			
		}//end if cooldown is done
	
		//If VR has paused for long enough
		else if (FrenzyRushCooldown < FrenzyRushFreeze)
		{
			FrenzyRushCooldown = FrenzyRushMax;
		}//end VR paused
	
		//If the cooldown is ongoing
		else
		{
		
			speed = 0;
		
			//If the player is still alive
			if (instance_exists(obj_Player))
			{
				//Set the player as the target for movement
				FrenzyTargetX = obj_Player.x;
				FrenzyTargetY = obj_Player.y;
	
			}//end if player is alive
		
		}//end cooldown ongoing
	
		//If it's time for VR's Frenzy to end
		if (FrenzyTimer > FrenzyLimit)
		{
			speed = 0;
			Damage = 0;
			FrenzyRushCooldown = FrenzyRushMax;
			sprite_index = _frenzySpr[3];
			FrenzyTimer = 0;
		}//end if VR frenzy end
		else
		{
			Damage = 2;
		}
	
	}//end if Player is alive

}//end VR attacking

//If VR is closing it's eye
else if (sprite_index == _frenzySpr[3])
{
	if (animation_end())
	{
		sprite_index = _frenzySpr[4];
		image_index = 0;
	}
}

//If VR is reverting it's body to normal
else if (sprite_index = _frenzySpr[4])
{
	if (animation_end())
	{
		CurrentAttack = VR_PHASE.REST;
	}
}

if (sprite_index == _frenzySpr[3] || sprite_index == _frenzySpr[4])
{
	if (y > ystart)
	{
		y--;
	}
}

}//end VioletRoseryState_Frenzy()