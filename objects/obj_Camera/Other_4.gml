/// @description Reconfigure the camera view
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

global.xrange = view_w_half;
global.yrange = view_w_half;

if (instance_exists(obj_Player))
{
	x = obj_Player.x;
	y = obj_Player.y;
}