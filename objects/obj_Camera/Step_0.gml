/// @description Camera follow player

if (instance_exists(follow))
{
	//show_debug_message("Target: {0}", follow);
	//show_debug_message("Target Coordinates: x = {0}, y = {1}", follow.x, follow.y);
}

#region Camera follows player

//Update destination 
if (instance_exists(follow)) 
{

	if (follow == obj_Player)
	{
		//move the camera infront of the player
	
		if (follow.xSpeed == 0)
		{
			Camera_PlayerFollowXTimer = 0;
			Camera_PlayerAheadDist = 0;
		}
	
		if (Camera_PlayerFollowXTimer++ > Camera_PlayerFollowXTimerLimit) && (follow.hascontrol)
		{
			Camera_PlayerAheadDist += 5;
			xTo = follow.x + (sign(follow.xSpeed) * min(300, Camera_PlayerAheadDist));
		}
		else
		{
			xTo = follow.x;
		}
		
		
		
		/*
		if (follow.ySpeed < 1)
		{
			Camera_PlayerFollowYTimer = 0;
		}
	
		if (Camera_PlayerFollowYTimer++ >= Camera_PlayerFollowYTimerLimit) && (follow.hascontrol)
		{
			Camera_PlayerBelowDist += 4;
			yTo = follow.y + (sign(follow.ySpeed) * min(200, Camera_PlayerBelowDist));
		}
		else
		{
			Camera_PlayerBelowDist = 0;
			yTo = follow.y;
		}
		*/
		
		if (follow.ySpeed <= 0.4)
		{
			Camera_PlayerFollowYTimer = 0;
		//	Camera_PlayerBelowDist = 0;
		}
	
		if (Camera_PlayerFollowYTimer++ > Camera_PlayerFollowYTimerLimit) && (follow.hascontrol)
		{
			Camera_PlayerBelowDist += 10;
			yTo = follow.y + (sign(follow.ySpeed) * min(400, Camera_PlayerBelowDist));
		}
		else
		{
			yTo = follow.y;
			Camera_PlayerBelowDist = 0;
		}
		
		/*
		if (follow.ySpeed > 3)
		{
			yTo = follow.y + (sign(follow.ySpeed) * 200);
		}
		else
		{
			yTo = follow.y;
		}
		*/
		
	}//end follow is player
	
}//end follow exists

//Update object position
x += (xTo - x)/25;
y += (yTo - y)/25;


x = clamp(x, view_w_half + ScreenShake_Buffer, room_width - view_w_half - ScreenShake_Buffer);
y = clamp(y, view_h_half + ScreenShake_Buffer, room_height - view_h_half - ScreenShake_Buffer);

camera_set_view_pos(camera, x - view_w_half, y - view_h_half);

view_w_half = camera_get_view_width(camera) / 2;
view_h_half = camera_get_view_height(camera) / 2;

x += random_range(-ScreenShake_Remain, ScreenShake_Remain);
y += random_range(-ScreenShake_Remain, ScreenShake_Remain);
ScreenShake_Remain = max(0, ScreenShake_Remain - ((1/ScreenShake_Length) * ScreenShake_Magnitude));


#endregion 

#region Activate/Deactivate


var cam, cleft, ctop, cwidth, cheight, cmargin;
cam = camera;
cmargin = 10;
cleft = camera_get_view_x(cam) - cmargin;
ctop = camera_get_view_y(cam) - cmargin;
cwidth = camera_get_view_width(cam) + cmargin + cmargin;
cheight = camera_get_view_height(cam) + cmargin + cmargin;

instance_activate_region(cleft, ctop, cwidth, cheight, true);




#endregion