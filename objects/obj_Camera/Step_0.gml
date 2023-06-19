/// @description Camera follow player

#region Camera follows player

//Update destination 
if (instance_exists(follow)) 
{
	xTo = follow.x;
	yTo = follow.y;
	//show_debug_message("Camera X = {0}", x);
	//show_debug_message("Camera Follow = {0}", object_get_name(follow));
}

//Update object position
x += (xTo - x)/25;
y += (yTo - y)/25;

//var CamSpeed = 5;
//x = Approach(x, xTo, CamSpeed);
//y = Approach(y, yTo, CamSpeed);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

#endregion 

#region PARALLAX

	/*
	The following code checks if a parallax background exists
	and adjust its position relative to the camera

	the greater the number x is divided by, the farther it appears
	*/

	#region Nox City Parallax

		if (layer_exists(NoxCityBackLayer))
		{
			layer_x(NoxCityBackLayer, x/8);
		}
	
		if (layer_exists(NoxCityMidLayer))
		{
			layer_x(NoxCityMidLayer, x/6);
		}
	
		if (layer_exists(NoxCityForeLayer))
		{
			layer_x(NoxCityForeLayer, x/4);
		}
	
	#endregion

	#region Forest Parallax

		#region Trees

		if (layer_exists(TreeLayer3))
		{
			layer_x(TreeLayer3, x/3);
		}

		if (layer_exists(TreeLayer2))
		{
			layer_x(TreeLayer2, x/4);
		}

		if (layer_exists(TreeLayer))
		{
			layer_x(TreeLayer, x/5);
		}

		#endregion Trees
 
	#endregion Field Parallax

	#region Ocean Parallax

	switch(room)
	{
		case Room_Ocean1:
			OceanSpeed = 2;
			break;
		
		case Room_Ocean2:
			OceanSpeed = 4;
			break;
		
		case Room_Ocean3:
			OceanSpeed = 8;
			break;
		
		default:
			OceanSpeed = 2;
			break;
	}

	if (layer_exists(OceanLayer2))
	{
		OceanLayerX1 += OceanSpeed/2;
		layer_x(OceanLayer2, OceanLayerX1);
	}

	if (layer_exists(OceanLayer))
	{
		OceanLayerX2 += OceanSpeed;
		layer_x(OceanLayer, OceanLayerX2);
	}



	#endregion

	#region Tundra Parallax

		#region Mountains

			if (layer_exists(MountainLayer3))
			{
				layer_x(MountainLayer3, x/1);
			}

			if (layer_exists(MountainLayer2))
			{
				layer_x(MountainLayer2, x/1.5);
			}

			if (layer_exists(MountainLayer))
			{
				layer_x(MountainLayer, x/2);
			}

			#endregion Mountains

	#endregion
	
#endregion