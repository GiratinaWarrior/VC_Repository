/// @description Insert description here
// You can write your code in this editor

if (instance_exists(Creator)) && (instance_exists(obj_Player))
{
	
	TalkRange = Creator.TalkRange;
	
	// If the Player exists and is close to the sign, make itself visible
	if (point_in_circle(obj_Player.x, obj_Player.y, Creator.x, Creator.y, TalkRange)) 
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
	//instance_destroy();
}

show_debug_message("Sign marker locate: x = {0}, y = {1}", x, y);