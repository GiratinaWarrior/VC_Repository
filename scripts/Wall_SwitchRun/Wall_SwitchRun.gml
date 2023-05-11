// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wall_SwitchRun(){

	if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
		while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
		{
			x = x + sign(xSpeed);
		}

		xSpeed *=- 1;

	}

}