/// @description Swaying by the player being nearby

//If the player is present
if (instance_exists(obj_Player))
{
	//If the player touches the flower
	if (place_meeting(x, y, obj_Player) && !Flower_HitByPlayer && obj_Player.xSpeed != 0)
	{
		//Sway in a direction depending on the players speed
		if (obj_Player.xSpeed > 0)
		{
			sprite_index = Flower_MoveFromLeftSprite;
		}
		else
		{
			sprite_index = Flower_MoveFromRightSprite;
		}
		
		Flower_HitByPlayer = true;
	}
	
	//If the player is not touching the flower
	else
	{
		//Flower_HitByPlayer = false;
	}
}//end player is present

//Fall to the ground if not on the ground
ySpeed += Gravity;
Wall_FallOn();
y += ySpeed;
