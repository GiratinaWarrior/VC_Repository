/// @description Insert description here
// You can write your code in this editor

if (Creator != noone) && (instance_exists(Creator)) && (PlayerAlive())
{
	
	TalkRange = Creator.TalkRange;
	
	// If the Player exists and is close to the sign, make itself visible
	if (abs(Creator.x - obj_Player.x) < TalkRange && abs(Creator.y - obj_Player.y) < TalkRange)
	{
		 image_alpha = min(1,image_alpha + 0.05)
	}

	else
	{
	
		 image_alpha = max(0, image_alpha - 0.05);
	}
}

else 
{
	instance_destroy();
}

//show_debug_message("Sign marker locate: x = {0}, y = {1}", x, y);