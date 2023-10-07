/// @description Insert description here
// You can write your code in this editor

if (instance_exists(Creator)) && (instance_exists(obj_Player))
{
	
	TalkRange = Creator.TalkRange;
	
//	show_debug_message("CarvalinePedestal Talk Range: {0}", TalkRange);
	
//	point_in_rectangle(obj_Player.x, obj_Player.y, Creator.x + TalkRange * 2, Creator.y + TalkRange * 2, Creator.x - TalkRange * 2, Creator.y - TalkRange * 2)
	
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