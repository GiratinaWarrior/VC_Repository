/// @description

if (instance_exists(obj_Player))
{
	//If the player touches the flower
	if (!Flower_HitByPlayer && !Flower_IsCut && obj_Player.xSpeed != 0 && place_meeting(x, y, obj_Player))
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

if (instance_exists(obj_PlayerSwordHitbox))
{
	if (!Flower_IsCut && place_meeting(x, y, obj_PlayerSwordHitbox))
	{
		sprite_index = Flower_DieSprite;
		Flower_IsCut = true;
	}
}

//Fall to the ground if not on the ground
ySpeed += Gravity;
Wall_FallOn();
y += ySpeed;








