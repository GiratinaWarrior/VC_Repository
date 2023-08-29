
/// @description Wall_FallOn()
/// When an entity is falling towards the ground, stop them when they hit the ground
function Wall_FallOn(){

	//If the entity will hit the ground in the next step
	if (place_meeting(x, y + ySpeed, obj_Wall)){
	
			//If they won't hit the ground in the next step, move them towards the ground by one pixel
			while(!place_meeting(x, y + sign(ySpeed), obj_Wall))
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
	if (place_meeting(x, y + 1, obj_Wall)) && (!place_meeting(x + xSpeed + (sign(xSpeed) * abs(sprite_width/2)), y + 1, obj_Wall)) 
	{
		//Switch directions horizontally
		xSpeed = -xSpeed;
	}
	
}//end Wall_LedgeTurn()

/// @description Wall_StopRun()
/// When an entity is about to run into a wall, stop moving horizontally
function Wall_StopRun(){
	
		//If the entity will touch a wall next step
		if (place_meeting(x + xSpeed, y, obj_Wall)){
	
			//If the entity will not touch a wall next step, move them by one pixel
			while(!place_meeting(x + sign(xSpeed), y, obj_Wall))
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
	if (place_meeting(x + xSpeed, y, obj_Wall)){
	
		//If the entity will not touch a wall next step, move them by one pixel
		while(!place_meeting(x + sign(xSpeed), y, obj_Wall))
		{
			x = x + sign(xSpeed);
		}

		//If the entity will touch a wall next step, switch direction horizontally
		xSpeed *=- 1;

	}

}

// @description Wall_BounceOn()
// When an entity is about to fly into a wall, change directions vertically
function Wall_BounceOn()
{
	//If the entity will fly into a  wall next step
	if (place_meeting(x, y + ySpeed, obj_Wall)){
	
		//If the entity will not touch a wall next step, move them by one pixel
		while(!place_meeting(x, y + sign(ySpeed), obj_Wall))
		{
			y += sign(ySpeed);
		}

		//If the entity will touch a wall next step, switch direction horizontally
		ySpeed *=- 1;

	}
}
