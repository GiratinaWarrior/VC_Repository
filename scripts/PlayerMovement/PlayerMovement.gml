// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMovement(){
	
	xSpeed = PlayerSpeed * move; //Change the horizontal movement according to the players input

	//If the player enters the jump key
	if (key_jump)
	{
		
		//If the player is allowed to jump
		if (PlayerJump > 0)
		{
			ySpeed = -JumpPower; //Jump
			PlayerJump = 0; //Reset the coyote jump timer
		}//end player can jump
		
		//If the player is underwater, simply move them upwards
		else if (PlayerNeutralState == PLAYERSTATE_NEUTRAL.WATER)
		{
			ySpeed = -JumpPower / SwimPower;
		}//end if underwater
	
	
	}//end jump key pressed
	
}