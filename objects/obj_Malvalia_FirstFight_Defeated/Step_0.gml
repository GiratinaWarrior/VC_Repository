/// @description

ySpeed += Gravity;

Wall_FallOn();
y += ySpeed;
	
Wall_StopRun();
x += xSpeed;


if (ySpeed == 0)
{
	sprite_index = spr_Malvalia_Fell;
}

with (obj_Player)
{
	if (place_meeting(x, y, obj_Malvalia_FirstFight_Defeated))
	{
		if (x >= other.x)
		{
			x = other.x + 32;
		}
		else
		{
			x = other.x - 32;
		}
	}
					
}

obj_Player.image_xscale = -sign(obj_Player.x - x);

			
