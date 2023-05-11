/// @description Reconfigure the camera view
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
if (instance_exists(obj_NewPlayer))
{
	follow = obj_NewPlayer;
}