// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wall_FallOn(){



	if (place_meeting(x, y + ySpeed, obj_WallPlatform)){
	
			while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
			{
				y = y + sign(ySpeed);
			}
	
			ySpeed = 0;
		}

}