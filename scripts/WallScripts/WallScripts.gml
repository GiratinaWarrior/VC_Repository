
/// @description Wall_FallOn()
/// When an entity is falling towards the ground, stop them when they hit the ground
function Wall_FallOn(){

	//If the entity will hit the ground in the next step
	if (place_meeting(x, y + ySpeed, obj_WallPlatform)){
	
			//If they won't hit the ground in the next step, move them towards the ground by one pixel
			while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
			{
				y += sign(ySpeed);
			}
	
			//If they'll hit the ground next step, stop moving
			ySpeed = 0;
		}

}//end Wall_FallOn()

/// @description Wall_LedgeTurn()
/// When an entity is about to walk off a ledge, change directions
function Wall_LedgeTurn(){
	
	/*
		If the entity is standing on the ground
		AND
		if the entity's will not be touching the ground in the next step
	*/
	if (place_meeting(x, y + 1, obj_WallPlatform)) && (!place_meeting(x + xSpeed + (sign(xSpeed) * abs(sprite_width/2)), y + 1, obj_WallPlatform)) 
	{
		//Switch directions horizontally
		xSpeed = -xSpeed;
	}
	
}//end Wall_LedgeTurn()

/// @description Wall_StopRun()
/// When an entity is about to run into a wall, stop moving horizontally
function Wall_StopRun(){
	
		//If the entity will touch a wall next step
		if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
			//If the entity will not touch a wall next step, move them by one pixel
			while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
			{
				x += sign(xSpeed);
			}
	
			//If the entity will touch a wall next step, stop moving
			xSpeed = 0;
		}
		
}

/// @description Wall_SwitchRun()
/// When an entity is about to run into a wall, change directions horizontally
function Wall_SwitchRun(){

	//If the entity will touch a wall next step
	if (place_meeting(x + xSpeed, y, obj_WallPlatform)){
	
		//If the entity will not touch a wall next step, move them by one pixel
		while(!place_meeting(x + sign(xSpeed), y, obj_WallPlatform))
		{
			x = x + sign(xSpeed);
		}

		//If the entity will touch a wall next step, switch direction horizontally
		xSpeed *=- 1;

	}

}
