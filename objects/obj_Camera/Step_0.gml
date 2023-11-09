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
	xTo = follow.x;
	yTo = follow.y;
}

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