// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wall_LedgeTurn(){
	
	if (Grounded) && (AfraidOfHeights) && (!place_meeting(x + xSpeed + (sign(xSpeed) * abs(sprite_width)), y + 1, obj_WallPlatform)) 
	{
		xSpeed = -xSpeed;
	}
	
}