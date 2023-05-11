/// @description Wall_StopRun()
function Wall_StopRun(){
	
	
		if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
			while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
			{
				x = x + sign(xSpeed);
			}
	
			xSpeed = 0;
		}
		
}