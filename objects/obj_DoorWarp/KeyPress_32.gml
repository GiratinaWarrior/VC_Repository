/// @description Teleport the player

//If the player is touching the door object
if (place_meeting(x, y, obj_Player))
{
	//Access the player object
	with (obj_Player)
	{
		//if the player can control their actions
		if (hascontrol) 
		{
			//take away the players control
			hascontrol = false;
			//Change the room
			SlideTransition(TRANS_MODE.GOTO, other.target);
			//Set the target coordinates
			global.WarpTargetX = other.WarpX;
			global.WarpTargetY = other.WarpY;
		}//end if has control
		
	}//end access Player
	
}//end door collision